//Base Liquor Property
public class BaseLiquid extends Ingredient {
  String Name;   //the name of the base liquid
  int Strength;  //the percentage of alcoholic in the base-liquid
  color Colour;    //the color of the liquid
    int R;
  int G;
  int B;
  int alpha;

  BaseLiquid(String name, int strength, int colour) {
    Name = name;
    Strength = strength;
    Colour = color(colour);
    alpha = 255;
  }
  BaseLiquid(String name, int strength, int R, int G, int B, int alpha) {
    Name = name;
    Strength = strength; 
    this.R = R;
    this.G = G;
    this.B = B;
    this.alpha = alpha;
    this.Colour = color(R, G, B);
    //this.Colour = (R<<16+G<<8+B) | 0xff000000;
  }

  void show(int pos) { 
    pushStyle();
    textAlign(LEFT);
    text(Name, 50 + pos, 290);
    //color(120,100,150);
    fill(Colour,alpha);
    //rectMode(CENTER);
    rect(50 + pos, 300, 50, 50);
    popStyle();
  }
}

