public class Accessories extends Ingredient {
  String Name;           //the name of the accessory
  int Strength;      //five ranks from 1 to 5 measures the percentage of sweet(sweetness).5 is the sweetest
  int Colour;

  Accessories(String name, int strength, int colour) {
    Name = name;
    Strength = strength;
    Colour = colour;
  }

  void show(int pos) {
    pushStyle();
    textAlign(LEFT);
    text(Name, 50 + pos, 365);
    fill(Colour);
    //rectMode(CENTER);
    rect(50 + pos, 370, 50, 50);
    popStyle();
  }
}

