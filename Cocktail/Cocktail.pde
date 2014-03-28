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
int barlevel = 0;
int initalX = 10;
int initalY = 180;
boolean overBox = false;
boolean showError = false;
int startTime;
int itemChoose;
String itemName, itemName2;
float dose;
int strength;
int colour;
int flag;
int tag;
int accuracy;
Container container;

//Visualiz
float clickdose = 0.0;
int dragposY = 0;
Boolean dragable = false;
float dragdose = 0.0;


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
  
  addRecipes();
  println(buildRecipePrompt(recip.get(0)));
}

void draw() {
  background(255);
  if (screenNumber == 0) {
    showMenu();
  }
  else if (screenNumber == 1) {
    Traditional();
  }
  else if (screenNumber == 2) {
    FreeStyle();
  }
  else if (screenNumber == 3) {
    victory(barlevel);
  }
  else if (screenNumber == 4) {
    howToPlay();
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



//Free Style Game Play
void FreeStyle() {
  text("Free Style", width / 2, 100);
}

void setUpNewLiquid(int barlevel) {
  //level 0 cocktail recipes
  if (barlevel == 0) {
    baseL.add(new BaseLiquid("Tequila", 38, 200));
    baseL.add(new BaseLiquid("Vodka", 45, 155));
    accessor.add(new Accessories("orange juice", 2, 100));
    accessor.add(new Accessories("grenadine syrup", 4, 120));
  }
  else if (barlevel == 1)
  {
    baseL.add(new BaseLiquid("Vodka", 45, 155));
    baseL.add(new BaseLiquid("Blue Curacao", 23, 180));
    accessor.add(new Accessories("Sprite", 3, 100));
  }
}

