import java.util.Iterator;
String nName;
int nStrength;
int nColour;
int counter;
float totaldose;
int steps;
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
    steps = 0;
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
  boolean judge() {
    for (Iterator iterator = cocktail.iterator(); iterator.hasNext();) {
      CockTails ctail = (CockTails) iterator.next();
      //      println("2 name:" + ctail.cName);
      //      println("cocktail dose:" + ctail.cDose);
      print("[judge] barlevel==" + barlevel + "; ");
      println("[judge] steps == " + steps);


      Recipe targetRecipe = recip.get(barlevel);
      String targetName = targetRecipe.itemName.get(steps);
      float targetDose = targetRecipe.itemDose.get(steps);
      println ("[judge] ingredient " + steps + ": " + targetDose + "oz "+targetName);

      println("[judge] current ingredient name:" + ctail.cName);
      println("[judge] current ingredient dose:" + ctail.cDose);

      //if (ctail.cName.equals(targetName) && ctail.cDose >= targetDose * 0.9 && ctail.cDose <= targetDose * 1.1)
     if (true) 
      {
        println("[judge] Step correct!");
        
        //don't remove in order to add into the final glass
        
        iterator.remove();
        showError = false;
        steps++;

        if (steps >= targetRecipe.itemDose.size())
        {
          steps = 0;
          if (screenNumber == 2 && orderNum < order.length)
          {
            println("[judge] The accuracy is: " + accuracy);
            playerscore += accuracy;
            scoreRef = accuracy;
            orderNum++;
            accuracy = 100;
            isShowFeeling = true;
            addonce = true;
            return true;
          } else if (screenNumber == 5){
            playerscore += accuracy;
            int oldbarlevel = barlevel;
            while (barlevel == oldbarlevel)
              {barlevel = int(random(float(recip.size())));}
            print("new barlevel ");println(barlevel); 
            accuracy = 100;
            //setUpNewLiquid(barlevel);
            return true;
          }
          barlevel++;


          setUpNewLiquid(barlevel);
        }
      } 
      else 
      {
        println("[judge] Step incorrect!");
        showError = true;
        isShowFeeling = false;
        
        //Unmemorize mechanism
        //Could be remove if need to be memorized what inside the Shock..
        //iterator.remove();
        
        
        
        accuracy--;
      }
    }
    counter = 0;
    nStrength = 0;
    nColour = 0;
    return false;
  }

  //Mix action - for showing the mixture colour
  void mix() {
    //barlevel = int(random(recip.size())); 
    //println( barlevel);
  }
}
