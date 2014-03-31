void keyPressed() {
  if (key == '1') {
    if (howtoplay == 0) {
      screenNumber = 4;
      howtoplay++;
    }
    else
    {
      screenNumber = 1;
    }
  } 
  else if (key == '2') {
    screenNumber = 2;
  } 
  else if (key == ' ') {
    screenNumber++;
    setup();
  } 
  else if (key == ESC) {
    exit();
  } 
  else if (key == 's' || key == 'S' ) {
    screenNumber = 1;
  } 
  else {     // if other keys are inputted, give a warning
    //background(255);
    //fill(122);
    //text("Please input a valid options~!", width / 2, 300);
  }
}


void mousePressed()
{
  println("Tag use:"+tag);
  bartenMainViewHitTest();

  if(tag != -1)
  {
    dragposY = mouseY;
    dragdose = 0;
  }
}

void mouseReleased() {
  if (overBox) {
    //fill(255, 255, 255);
    //if(itemName.equals(bsl.Name) && flag == 1 ){
    //         dose += 0.5;
    //}
    println("insight");
    println("Liquid use:"+itemName);
    println("Last Liquid use:"+itemName2);
    println("~Tag use:"+tag);
    dragdose = 0;
    if(!dragable){
      dragposY = mouseY;
      dragable = true;
    }
    

    //if(flag != tag){
    if (addItem == 1) {
      //startTime = millis();
      switch(itemChoose)
      {
      case 0:
        container.addItemBL(itemName2, strength, colour, clickdose*0.01);//dose
        dragdose = 0;
        break;
      case 1:
        container.addItemAc(itemName2, strength, colour, clickdose*0.01);//dose
        dragdose = 0;
        break;
      default:
        println("nothing has added inside the container.");
        break;
      }
      flag = tag;
      clickdose = 0;
      //dose = 0;
      addItem = 0;
    }
    else {
      //dose += 0.5; // each time the player click the rect can get 0.5oz/liquid or other accessories
      println("dose use:" + clickdose*0.01);
    }

    if (!itemName2.equals(itemName))
    {
      itemName2 = itemName;
    }
    //clear dose
    //dose = 0;
    overBox = false;
  }
  else {
    println("outsight");
    //mousedragg tag: use to recognize the liquids
    tag = -1;
    println("tag===" + tag);
  }
}

void mouseDragged(){
  if(dragable)
  {
    //clickdose += (mouseY -dragposY)/10;
    dragdose = (mouseY - dragposY)/10; 
  }
}

