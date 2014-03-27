void bartenMainView(int barlevel)
{
  showGameChallenge();
    setUpNewLiquid(barlevel);
    int i = 0;
    
    //Empty cup
    pushStyle();
    fill(255);
    rect(600, 350, 55, 100);
    popStyle();
    
    
    pushStyle();
    fill(0);
    rect(600, 450, 55, -clickdose);
    pushStyle();
    fill(0);
    text("Dose:" + nf(clickdose*0.1,1,1) + " oz", 680, 440 - clickdose);
    popStyle();
    popStyle();
    
    if (mouseX > 600 && mouseX < 655 && mouseY > 350 && mouseY < 450 && mousePressed)
    {
      if(clickdose<100){
        clickdose+=1;
      }
    }
    

    //Iterate the Base Liquid
    for (Iterator iterator = baseL.iterator(); iterator.hasNext();) {
      BaseLiquid bsl = (BaseLiquid) iterator.next();
      bsl.show(i);
      iterator.remove();
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
      iterator.remove();
      if (mouseX > (50+ i) && mouseX < (50 + i) + 50 && 
        mouseY > 370 && mouseY < 370+50 && mousePressed) {

        itemName = acs.Name;
        strength = acs.Saccharinity;
        colour = acs.Colour;
        itemChoose = 1;
        tag = i*2 + 1;
        overBox = true;
        //println("tag use:"+tag);
      }
      i += 120;
   }
  mixRect();
  if (mouseX > 720 && mouseX < 770 && mouseY > 435 && mouseY < 485 && mousePressed)
  {
      overBox = true;
      addItem = 1;
      startTime = millis();
  }
}
