import java.util.Iterator;

//Defines
int howtoplay;
int addItem;

PFont f;
ArrayList<BaseLiquid> baseL;
ArrayList<Accessories> accessor;
ArrayList<Recipe> recip;

ArrayList<String> items;
ArrayList doses;

int screenNumber = 0;
//int barlevel = 0;
int barlevel;
int initalX = 10;
int initalY = 180;
boolean overBox = false;
boolean showError = false;
int startTime;
int itemChoose;
String itemName, itemName2;
float dose;
int strength;
color colour;
int flag;
int tag;
int accuracy;
Container container;

//Visualiz
float clickdose = 0.0;
int dragposY = 0;
Boolean dragable = true;  //default is true otherwise the first click won't available
float dragdose = 0.0;

//✓
//Customer mechanism
Boolean addonce = true;
int[] order = {
  0, 2, 1
};
int orderNum = 0;
int playerscore = 0;
int scoreRef = 0;
Boolean isShowFeeling = false;
Boolean isPeek = false;

//Final glass
//the glass represent the final mixture of all the ingredients
float glassbottomX=700.0;
float glassbottomY=350.0;
float glasstopX=0.0;
float glasstopY=0.0;

//challenge mode! ding ding ding
int challenge_timeout = 0;

void setup() {
  size(800, 500);
  f = createFont("Arial", 16, true);
  //screenNumber = 0;
  itemChoose = -1;
  //barlevel = 0;
  tag = 0;
  flag = 0;
  accuracy = 100;
  container = new Container();
  baseL = new ArrayList<BaseLiquid>();
  accessor = new ArrayList<Accessories>();
  recip = new ArrayList<Recipe>();

  items = new ArrayList<String>();
  doses = new ArrayList();

  itemName = "Tequila";
  itemName2 = "Tequila";

  howtoplay = 0;
  addItem = 0;
  //items = new String[3];
  //doses = new String[3];


  //Blocking
  //addRecipes();



  //println(buildRecipePrompt(recip.get(0)));
}

void draw() {
  background(255);
  if (screenNumber == 0) {
    showMenu();
  }
  else if (screenNumber == 1) {
    //In this case, add all the recipes for teaching mode
    if (addonce)
    {
      barlevel = 0;
      setUpNewLiquid(barlevel);
      addRecipes();
      addonce = false;
    }

    Traditional();
  }
  else if (screenNumber == 2) {

    //In this case, add all the recipes for story mode
    if (addonce && orderNum < order.length)
    {
      barlevel = order[orderNum];
      setUpNewLiquid(barlevel);
      addRecipes();
      addonce = false;
    }

    Story();
  }
  else if (screenNumber == 3) {
    victory(barlevel);
  }
  else if (screenNumber == 4) {
    howToPlay();
  }
  else if (screenNumber == 5) {
    //TODO!!
    if(addonce ){
          addRecipes();
    barlevel = 0;
    setUpNewLiquid(barlevel);
      addonce = false;
      
      challenge_timeout = millis() + (60+3) * 1000;
    }

    
    drawChallengeMode();

    
  }
}





//Traditional Game Play
void Traditional() {
  text("Teaching Model", width / 2, 30);
  //println("what's the error" + showError);
  if (showError)
  {
    pushStyle();
    textAlign(LEFT);
    fill(0);
    text("You have got wrong dose", width / 2, 440);
    // If the spent time is above the defined duration
    if (millis() - startTime > 3000) 
    {
      // Stop displaying the message
      showError = false;
    }
    popStyle();
  }
  bartenMainView(barlevel);
}



//Story Style
void Story() {
  text("Story Mode", 60, 30);
  //barlevel = 2;
  bartenMainView(barlevel);
}

void initChallengeMode(){
  
}

void updateChallengeMode(){
}

void drawChallengeMode(){
  if ((challenge_timeout - millis()) > 0){
    bartenMainView(barlevel);
    showGameChallenge();
    showPlayerScore();
    showTimerCountdown();
  } else {
    challengeVictory();
  }
}

void setUpNewLiquid(int barlevel) {
  baseL.clear();
  accessor.clear();

  //Teaching mode
  if (screenNumber == 1) {
    //level 0 cocktail recipes
    if (barlevel == 0) {
      baseL.add(new BaseLiquid("Tequila", 38, 200));
      accessor.add(new Accessories("orange juice", 2, 255,201,14,255));
      accessor.add(new Accessories("grenadine syrup", 4, 237,28,36,255));
    }
    else if (barlevel == 1)
    {
      baseL.add(new BaseLiquid("Vodka", 45, 155));
      baseL.add(new BaseLiquid("Blue Curacao", 23, 0, 162, 232, 255));
      accessor.add(new Accessories("Sprite", 3, 34,177,76,255));
    }
    else if (barlevel == 2)
    {
      baseL.add(new BaseLiquid("Gin", 55, 45));
      baseL.add(new BaseLiquid("Absinthe", 55, 140));
      accessor.add(new Accessories("Oliver", 3, 181, 230, 29, 255));
    }
  }
  //Story mode
  else if (screenNumber == 2 || screenNumber == 5)
  {
    baseL.add(new BaseLiquid("Tequila", 38, 200));
      accessor.add(new Accessories("orange juice", 2, 255,201,14,255));
      accessor.add(new Accessories("grenadine syrup", 4, 237,28,36,255));
    baseL.add(new BaseLiquid("Vodka", 45, 155));
      baseL.add(new BaseLiquid("Blue Curacao", 23, 0, 162, 232, 255));
      accessor.add(new Accessories("Sprite", 3, 34,177,76,255));
    baseL.add(new BaseLiquid("Gin", 55, 45));
    baseL.add(new BaseLiquid("Absinthe", 55, 140));
      accessor.add(new Accessories("Oliver", 3, 181, 230, 29, 255));
  }
}

