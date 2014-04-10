public class CockTails {
  String cName;
  float cDose;
  color Colour;    //the color of the liquid
    int R;
  int G;
  int B;
  int alpha;
  

  CockTails(String name, float dose, int colour) {
    cName = name;
    cDose = dose;
    Colour = color(colour);
    alpha = 255;
  }
}
