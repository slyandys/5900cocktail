import java.util.Iterator;
String nName;
int nStrength;
int nColour;
int counter;
float totaldose;
int flags;
int timepass = 0;

public class Container {
  ArrayList<CockTails> cocktail;
  //ArrayList<Recipe> recip;
  //ArrayList<BaseLiquid> BaseL;
  //ArrayList<Accessories> Accesso;
  //ArrayList<CockTails>
  //int Dose;
  float shotMaximum;

  //Initialization
  Container() {
    //BaseL = new ArrayList<BaseLiquid>();
    //Accesso = new ArrayList<Accessories>();
    cocktail = new ArrayList<CockTails>();
    nStrength = 0;
    counter = 0;
    shotMaximum = 100;
    flags = 0;
  }

  //Add Base Liquid
  void addItemBL(String Name, int strength, int colour, float dose) {
    //Dose = dose;
    //BaseL.add(new BaseLiquid(Name, strength, colour));
    //println("indexofbaseliquid:" + cocktail.indexOf(Name));
    //if(cocktail.indexOf((String)Name) == -1)
    //{
    cocktail.add(new CockTails(Name, dose));
    //}
    //else
    //{
    //  println("indexofbaseliquid:" + cocktail.indexOf(Name));
    //}
    //Judging the cocktail
    judge();
  }

  //Add Accessories
  void addItemAc(String Name, int saccharinity, int colour, float dose) {
    cocktail.add(new CockTails(Name, dose));
    //Judging the cocktail
    judge();
  }

  //Judgement system
  void judge() {
    for (Iterator iterator = cocktail.iterator(); iterator.hasNext();) {
      CockTails ctail = (CockTails) iterator.next();
      //      println("cocktail name:" + ctail.cName);
      //      println("cocktail dose:" + ctail.cDose);
      print("[judge] barlevel==" + barlevel + "; ");
      println("[judge] flags == " + flags);
      
      
      Recipe targetRecipe = recip.get(barlevel);
      String targetName = targetRecipe.itemName.get(flags);
      float targetDose = targetRecipe.itemDose.get(flags);
      println ("[judge] ingredient " + flags + ": " + targetDose + "oz "+targetName);
      
      println("[judge] current ingredient name:" + ctail.cName);
      println("[judge] current ingredient dose:" + ctail.cDose);
      
      if (ctail.cName.equals(targetName) && ctail.cDose >= targetDose * 0.9 && ctail.cDose <= targetDose * 1.1) 
      {
          println("[judge] Step correct!");
          iterator.remove();
          showError = false;
          flags++;
          
          if (flags >= targetRecipe.itemDose.size())
          {
            flags = 0;
            barlevel++;
            setUpNewLiquid(barlevel);
          }
      } 
      else 
      {
          println("[judge] Step incorrect!");
          showError = true;
          accuracy--;
      }
      
    }
    counter = 0;
    nStrength = 0;
    nColour = 0;
  }

  //Mix action - for showing the mixture colour
  void mix() {
  }
}

