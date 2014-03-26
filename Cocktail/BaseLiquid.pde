//Base Liquor Property
public class BaseLiquid {
  String Name;   //the name of the base liquid
  int Strength;  //the percentage of alcoholic in the base-liquid
  int Colour;    //the color of the liquid

  BaseLiquid(String name, int strength, int colour) {
    Name = name;
    Strength = strength;
    Colour = colour;
  }

  void show(int pos) { 
    pushStyle();
    textAlign(LEFT);
    text(Name, 50 + pos, 290);
    //color(120,100,150);
    fill(Colour);
    //rectMode(CENTER);
    rect(50 + pos, 300, 50, 50);
    popStyle();
  }
}

