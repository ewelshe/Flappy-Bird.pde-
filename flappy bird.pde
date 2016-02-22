float[] values;
int index;
int space=0; 
int spacing = 10;
void setup() {
  size(600, 400);
  background(0);
  values = new float[width/spacing];
  index = 0;
  frameRate(30);
}

float maybeRandomHeight() {
  if (space%10==0) {
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
    line(i*spacing, height-values[realIndex], i*spacing, height);
    if(values[realIndex]!=0) {
    line(i*spacing, height-values[realIndex]-60, i*spacing,0);
   }
}
space++;
}
