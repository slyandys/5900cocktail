public class Recipe {
  String rName;
  ArrayList itemName;
  ArrayList itemDose;

  Recipe(ArrayList<String> name, ArrayList dose) {
    ArrayList itemName = new ArrayList();
    ArrayList itemDose = new ArrayList();
    itemName = (ArrayList) name.clone();
    itemDose = (ArrayList) dose.clone();
    println("item=" + itemName);
  }
}

