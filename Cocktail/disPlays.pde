/*
 * This file stores the display for different types of situations
 */


//How to Play
void howToPlay()
{
  pushStyle();
  textAlign(CENTER);
  textFont(f, 20);
  fill(0);
  text("How to Play", width / 2, 100);
  text("STEP 1:Use mouse to add the items(rectangle) of your cocktail", width / 2, height / 2-50);
  text("Each press gives you 0.5oz on the same item", width / 2, height / 2-30);
  text("STEP 2:Click the 'Add' rectangle to add your items into the Shake", width / 2, height / 2+10);
  text("TIPS:Please be careful of the Caculations, it will affect the accuracy :P", width / 2, height / 2+100);
  text("GOOD LUCK~", width / 2, height / 2+130);
  text("Press S to start", width / 2, height / 2 + 200);
  popStyle();
}

//Main Menu
void showMenu() 
{
  textAlign(CENTER);
  textFont(f, 20);
  fill(0);
  text("Bartender", width / 2, 200);
  text("1-Traditional", width / 2, height / 2);
  text("2-Story", width / 2, height / 2 + 40);
  text("Choose a way to start your Bartender career!", width / 2, height / 2 + 80);
}

void peekRecipe()
{
  pushStyle();
  textAlign(LEFT);
  text("Peek", 720, 45);
  fill(200);
  rect(720, 55, 50, 50);
  popStyle();
  
  Recipe recipe = recip.get(barlevel);
  
  if (mousePressed && isPeek)//millis () - startTime < 3000
  {
    text(buildRecipePrompt(recipe), width / 2, 160);
    accuracy--; //too must, can be adjust later...
    print("The accuracy==="+accuracy);
  }
  else
  {
    //print("The accuracy==="+accuracy);
    isPeek = false;
  }
  
}

void mixRect()
{
  pushStyle();
  textAlign(LEFT);
  text("Mix", 720, 420);
  fill(200);
  rect(720, 435, 50, 50);
  popStyle();
}

void victory(int barlevel)
{
  textAlign(CENTER);
  textFont(f, 20);
  fill(0);
  switch(barlevel)
  {
  case 0:
    text("You just make a Sunrise Tequila with " + accuracy + "% correct", width / 2, 200);
    break;
  case 1:
    text("You just make a Blue Lagoon with " + accuracy + "% correct", width / 2, 200);
    break;
  }

  text("Congratulations~", width / 2, height / 2);
  text("Press ESC to exit the game", width / 2, height / 2 + 40);
  text("Press SPACE to continue", width / 2, height / 2 + 80);
}

void showGameChallenge()
{
  text("~~level:" + barlevel + "~~", width / 2, 60);
  text("Please mix them in order mentioned above", width / 2, 50 + 50);

  if (barlevel < recip.size())
  {
    Recipe recipe = recip.get(barlevel);
    text(buildNamePrompt(barlevel, recipe), width / 2, 130);
    text(buildRecipePrompt(recipe), width / 2, 160);
  }
  //  text("", width / 2, 180);
}


void showCustomerNeed()
{
  if (barlevel < recip.size())
  {
    Recipe recipe = recip.get(barlevel);
    text("Customer "+ (orderNum+1) +": A glass of " + recipe.rName + ", Please", width / 2, 50);
  }
}

void showPlayerScore()
{
  text("Score: " + playerscore, 60, 70);
}

void challengeVictory()
{
  textAlign(CENTER);
  textFont(f, 20);
  fill(0);
      text("Time's up! \n Your score: "+ playerscore, width / 2, 200);

  text("Congratulations~", width / 2, height / 2);
  text("Press ESC to exit the game", width / 2, height / 2 + 40);
  text("Press SPACE to continue", width / 2, height / 2 + 80);
}

void showTimerCountdown()
{
  text("Time:" + str((challenge_timeout - millis())/1000), 700, 70);
}

void showCustomerFeedback()
{
  if (scoreRef>90 && scoreRef<=100)
  {
    if (millis () - startTime < 3000) 
    {
      //displaying the customer feeling
      text("It tastes excellent", width / 2, 70);
    }
    else
    {
      isShowFeeling = false;
    }
  }
  else if (scoreRef>80 && scoreRef<=90)
  {
    if (millis () - startTime < 3000) 
    {
      //displaying the customer feeling
      text("It tastes good", width / 2, 70);
    }
    else
    {
      isShowFeeling = false;
    }
  }
  else if (scoreRef>70 && scoreRef<=80)
  {
    if (millis () - startTime < 3000) 
    {
      //displaying the customer feeling
      text("It tastes fair", width / 2, 70);
    }
    else
    {
      isShowFeeling = false;
    }
  }
  else if (scoreRef>=60 && scoreRef<=70)
  {
    if (millis () - startTime < 3000) 
    {
      //displaying the customer feeling
      text("It tastes OK", width / 2, 70);
    }
    else
    {
      isShowFeeling = false;
    }
  }
  else if (scoreRef<60)
  {
    if (millis () - startTime < 3000) 
    {
      //displaying the customer feeling
      text("It tastes sucks :(", width / 2, 70);
    }
    else
    {
      isShowFeeling = false;
    }
  }
}


String buildNamePrompt(int level, Recipe recipe) {
  String s = "Challenge" + barlevel + ": "+recipe.rName +'\n';
  return s;
}

String buildRecipePrompt(Recipe recipe) {
  String s = "You will need: ";
  for (int i = 0; i < recipe.itemName.size() &&  i < recipe.itemName.size(); i++) {
    if (i != 0) {
      s += ", \n";
    }
    if (i < steps) {
      s += "√";
    }
    s += nf(recipe.itemDose.get(i), 1, 1) + "oz " + recipe.itemName.get(i);
  }
  return s;
}
