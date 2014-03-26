public class Recipe {
  String rName;
  ArrayList<String> itemName;
  ArrayList<Float> itemDose;

  Recipe(ArrayList<String> name, ArrayList<Float> dose) {
    itemName = (ArrayList) name.clone();
    itemDose = (ArrayList) dose.clone();
    println("item=" + itemName);
  }
  Recipe(String[] name, float[] dose) {
    itemName = (ArrayList<String>) new ArrayList();
    itemDose = (ArrayList<Float>) new ArrayList();
    for (String a_name : name){ //check if it works with processing.js
      itemName.add(a_name);
    }
    //itemDose = (ArrayList<Float>) new ArrayList(dose);
    for (Float a_dose: dose){
      itemDose.add(a_dose);
    }
    println("item=" + itemName);
  }
}

void addRecipes(){
  //Sunrise Tequila
  String[] sunrise_name = {"Tequila", "orange juice", "grenadine syrup"};
  float[] sunrise_dose = {0.5, 4.0, 0.5};
  
  //this does NOT work. -LN
  //name = {"Tequila", "orange juice", "grenadine syrup"};
  //dose =  {0.5, 4.0, 0.5};
  recip.add(new Recipe(sunrise_name, sunrise_dose));
  //Blue Lagoon
  String[] lagoon_name = {"Vodka", "Blue Curacao", "Sprite"};
  float[] lagoon_dose = {1.0, 1.0, 10.0};
  recip.add(new Recipe(lagoon_name, lagoon_dose));
  println("yay!");
}
