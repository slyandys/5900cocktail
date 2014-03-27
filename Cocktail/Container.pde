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
      println("flags == " + flags);
      if (barlevel == 0)
      {
        println("cocktail name:" + ctail.cName);
        println("cocktail dose:" + ctail.cDose);
        switch(flags)
        {
        case 0:
          if (ctail.cName.equals("Tequila") && ctail.cDose >= 1.5*0.9 && ctail.cDose <= 1.5*1.1) 
          {
            println("BL correct~");
            iterator.remove();
            showError = false;
            flags++;
          }
          else
          {
            //flags = 0;
            println("BL incorrect~");
            //mills = millis();
            //mills = millis() + 10000;
            showError = true;
            accuracy--;
            println("cocktail name:" + ctail.cName);
            println("cocktail dose:" + ctail.cDose);
          }
          break;
        case 1:
          if (ctail.cName.equals("orange juice") && ctail.cDose >= 4*0.9 && ctail.cDose <= 4*1.1)
          {
            println("Ac correct~");
            iterator.remove();
            showError = false;
            flags++;
          }
          else
          {
            println("Ac incorrect~");
            showError = true;
            accuracy--;
            println("cocktail name:" + ctail.cName);
            println("cocktail dose:" + ctail.cDose);
            //flags = 0;
          }
          break;
        case 2:
          if (ctail.cName.equals("grenadine syrup") && ctail.cDose >= 0.5*0.9 && ctail.cDose <= 0.5*1.1)
          {
            println("AC2 correct~");
            iterator.remove();
            flags++;
            barlevel = 1;
            showError = false;
          }
          else
          {
            println("AC2 incorrect~");
            showError = true;
            accuracy--;
            println("cocktail name:" + ctail.cName);
            println("cocktail dose:" + ctail.cDose);
            //flags = 0;
          }
          break;
        }
      }
      else if (barlevel == 1)
      {
        println("cocktail name:" + ctail.cName);
        println("cocktail dose:" + ctail.cDose);
        switch(flags)
        {
        case 0:
          if (ctail.cName.equals("Vodka") && ctail.cDose == 1.0) 
          {
            println("BL correct~");
            iterator.remove();
            flags++;
            showError = false;
          }
          else
          {
            //flags = 0;
            println("BL incorrect~");
            showError = true;
            accuracy--;
            println("cocktail name:" + ctail.cName);
            println("cocktail dose:" + ctail.cDose);
          }
          break;
        case 1:
          if (ctail.cName.equals("Blue Curacao") && ctail.cDose == 1.0)
          {
            println("BL correct~");
            iterator.remove();
            flags++;
            showError = false;
          }
          else
          {
            println("BL incorrect~");
            showError = true;
            accuracy--;
            println("cocktail name:" + ctail.cName);
            println("cocktail dose:" + ctail.cDose);
            //flags = 0;
          }
          break;
        case 2:
          if (ctail.cName.equals("Sprite") && ctail.cDose == 10)
          {
            println("AC correct~");
            iterator.remove();
            flags++;
            showError = false;
          }
          else
          {
            println("AC incorrect~");
            showError = true;
            accuracy--;
            println("cocktail name:" + ctail.cName);
            println("cocktail dose:" + ctail.cDose);
            //flags = 0;
          }
          break;
        }
      }
//      if (flags == 3)
//      {
//        println("You make the Sunrise Tequila");
//        flag = 0;
//        screenNumber = 3;
//      }
    }
    counter = 0;
    nStrength = 0;
    nColour = 0;
  }

  //Mix action - for showing the mixture colour
  void mix() {
  }
}

