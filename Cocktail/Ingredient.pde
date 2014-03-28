public class Ingredient {
  String Name;           //the name of the accessory
  int Strength;      //five ranks from 1 to 5 measures the percentage of sweet(sweetness).5 is the sweetest
  int Colour;
  
  void show(int pos) {
  }
  boolean hitTest(int i, int j, int X, int Y){
    if ( X > (50 + i) && mouseX < (50 + i) + 50 && 
        Y > (300 + j) && mouseY < (300+ j +50) ) 
    {
      return true;
    }
    else {
      return false;
    }
  }
}
