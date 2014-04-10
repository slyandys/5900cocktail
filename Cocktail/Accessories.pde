public class Accessories extends Ingredient {
  String Name;           //the name of the accessory
  int Strength;      //five ranks from 1 to 5 measures the percentage of sweet(sweetness).5 is the sweetest
  int Colour;
  int R;
  int G;
  int B;
  int alpha;

  Accessories(String name, int strength, int colour) {
    Name = name;
    Strength = strength;
    R=G=B = colour;
  }
  
  Accessories(String name, int strength, int R, int G, int B, int alpha) {
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
    text(Name, 50 + pos, 365);
    fill(Colour,alpha);
    //rectMode(CENTER);
    rect(50 + pos, 370, 50, 50);
    popStyle();
  }
}

