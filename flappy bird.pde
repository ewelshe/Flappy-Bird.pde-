float[] values;
int index;
int space = 60; //this was important to change space

void setup() {
  size(600, 250);
  background(0);
  frameRate(40);

  values = new float[width/1];
  index = 0;
}

float maybeRandomHeight() {
  if (space%80==0) {
    return random(height/3, 2*height/3);
  } else {
    return 0;
  }
}

void draw() {
  background(255);

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
   ellipse(60,60,20 ,15);
   ellipse(58,61, 8,10);
   ellipse(67,59,2,2);
    line(i*1, height-values[realIndex], i*1, height);
    if (values[realIndex]!=0) {
      line(i*1, height-values[realIndex]-50, i*1, 0);
    }
  }
  space++; 
}
