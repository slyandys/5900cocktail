void bartenMainView(int barlevel)
{
  clickdose += dragdose;
  
  showGameChallenge();
    //setUpNewLiquid(barlevel);
    int i = 0;
    
    //Empty cup
    pushStyle();
    fill(255);
    rect(600, 350, 55, 100);
    popStyle();
    
    
    pushStyle();
    fill(colour);
    rect(600, 450, 55, -clickdose/10);
    pushStyle();
    fill(0);
    text("Dose:" + nf(clickdose*0.01,1,2) + " oz", 680, 440 - clickdose/10);
    popStyle();
    popStyle();
    
    if (mouseX > 600 && mouseX < 655 && mouseY > 350 && mouseY < 450 && mousePressed)
    {
      if(clickdose<1000){
        clickdose+=1;
      }
    }
    
    i = 0;
    for(BaseLiquid bsl : baseL){
      bsl.show(i);
      i += 120;
    }
    i = 0;
    for(Accessories acs : accessor){
      acs.show(i);
      i += 120;
    }

  mixRect();

}

void bartenMainViewHitTest(){
  int i = 0;
    //Iterate the Base Liquid
    for (Iterator iterator = baseL.iterator(); iterator.hasNext();) {
      BaseLiquid bsl = (BaseLiquid) iterator.next();
      bsl.show(i);
      //iterator.remove();
      if (mouseX > (50 + i) && mouseX < (50 + i) + 50 && 
        mouseY > 300 && mouseY < 300+50 && mousePressed) {
        itemName = bsl.Name;
        strength = bsl.Strength;
        colour = bsl.Colour;
        itemChoose = 0;
        tag = i;
        overBox = true;
        //println("tag use:"+tag);
      }
      i += 120;
    }

    i = 0;

    //Iterate the Accessories
    for (Iterator iterator = accessor.iterator(); iterator.hasNext();) {
      Accessories acs = (Accessories) iterator.next();
      acs.show(i);
      //iterator.remove();
      if (mouseX > (50+ i) && mouseX < (50 + i) + 50 && 
        mouseY > 370 && mouseY < 370+50 && mousePressed) {

        itemName = acs.Name;
        strength = acs.Strength;
        colour = acs.Colour;
        itemChoose = 1;
        tag = i*2 + 1;
        overBox = true;
        //println("tag use:"+tag);
      }
      i += 120;
   }
  if (mouseX > 720 && mouseX < 770 && mouseY > 435 && mouseY < 485 && mousePressed)
  {
      overBox = true;
      addItem = 1;
      startTime = millis();
      println("overbox");
  }
}
