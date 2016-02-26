float[] values;
int index;
int space = 60; //this was important to change space
int y =100; //this is for the bird mouse pressed

void setup() {
  size(600, 250);
  background(0);
  frameRate(50);

  values = new float[width/1];
  index = 0;
}

float maybeRandomHeight() {
  if (space%60==0) {  //changing the speed was key // creates even spacing based the fact that it equals zero
    return random(height/3, 2*height/3);
  } else {
    return 0;
  }
}

void draw() {
  background(154,205,242);
fill(230,242,154);
  ellipse (30, y, 25, 20); //
  ellipse(36, y-2, 3,3); 
  ellipse(18, y, 6,10); 

  y = y + 1; //this is the gravity of the bird falling down
  //the bigger the number you add to Y the faster it will go down
  //
  if (mousePressed) {
    ellipse (30, y, 6, 10);
    y= y - 5; //this is the part that makes the circle go up subtract
  }
  
  //if () { // if the ellipse is out of the gap 
  //} else { // then the ellipse goes to position 250
  //  {
      
  values[index] = maybeRandomHeight();
  index = index + 1;
  if (index >= values.length) {
    index = 0;
  }

  for (int i = 0; i < values.length; ++i) {
    int realIndex = index + i;
    if (realIndex >= values.length) {
      realIndex -= values.length;
    }
   stroke(37,193,56);
    line(i*1, height-values[realIndex], i*1, height);
    if (values[realIndex]!=0) { //
      line(i*1, height-values[realIndex]-65, i*1, 0);
    }
  }
  space++; //and you had to add one in order to get it to work
}

//debug
//abduct: prep for bird placement
//1) change i value to create to 50 result: nothing good
//2) change i value to 3 result: more bad slow feed
//3) change the speed to progress cirlce: from 30 to 38 result: good
//4) change the size of the space for the lines 50 to 65 result: good

//if you want to move the 
