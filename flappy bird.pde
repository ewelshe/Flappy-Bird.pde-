float[] values;
int index;
int space = 60; //changes space
int y =100; //mouse pressed for the bird 

void setup() {
  size(600, 250);
  background(0);
  frameRate(50);

  values = new float[width/1];
  index = 0;
}

float maybeRandomHeight() {
  if (space%60==0) {  //changing the speed was key // even spacing
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

  y = y + 1; 
  //the bigger the number you add to Y the faster it will go down
  //
  if (mousePressed) {
    ellipse (30, y, 6, 10);
    y= y - 5; //circle goes up here 
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
//Group: Nathaniel and Hugo
// we added spacing and changed the frame rate to increase speed and space 
// I created different ellipses and put an ellipse underneath mouse pressed so the bird flaps its wings 
// I kind of figured out how to make it so if it is out of the space between the lines it starts over, but I couldnt figure out the correct way to write that. 

