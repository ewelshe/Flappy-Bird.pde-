final int maxSegments = 100;
int[] xSegments = new int[maxSegments];
int[] ySegments = new int[maxSegments];

final int gridSize = 20;

void setup() {
  size(500, 500);
  for (int i = 0; i < maxSegments; i += 1) {
    xSegments[i] = ySegments[i] = -1;
 
}
  xSegments[0] = width/2 / gridSize;
  ySegments[0] = width/2 / gridSize;
  snakeLength = 1;
  foodX = 10;
  foodY = 20;
  ellipseMode(CORNER);
}

int lastMove = 0;
int timeBetweenMoves = 300;

int xSpeed = 1;
int ySpeed = 0;
int snakeLength;

int foodX;
int foodY;

void draw() {
  background(255);
  noStroke();

  fill(0);
  for (int i = 0; i < maxSegments; i += 1) {
    rect(xSegments[i]*gridSize, ySegments[i]*gridSize, gridSize, gridSize);

}

  fill(255, 0, 0);
  ellipse(foodX * gridSize, foodY * gridSize, gridSize, gridSize);

  fill(0, 255, 0);
  ellipse(foodX * gridSize/2, foodY * gridSize/2, gridSize, gridSize);

  if (millis() - lastMove > timeBetweenMoves) {
    lastMove = millis();
    int nextX = xSegments[0] + xSpeed;
    int nextY = ySegments[0] + ySpeed;

    for (int i = snakeLength-1; i > 0; i -= 1) {
      xSegments[i] = xSegments[i-1];
      ySegments[i] = ySegments[i-1];
    }
    if (isThereASegmentAtPosition(nextX, nextY)) {
      // snake hit itself! reset the game!
      setup();
    } else {
      xSegments[0] = nextX;
      ySegments[0] = nextY;
      if (nextX == foodX && nextY == foodY) {
        getFood();
      }
    }
  }
}

void getFood() {
  snakeLength += 1;

  while (isThereASegmentAtPosition(foodX, foodY)) {
    foodX = floor(random(width/gridSize));
    foodY = floor(random(width/gridSize));

} 
}

boolean isThereASegmentAtPosition(int x, int y) {
  for (int i = 0; i < snakeLength; i += 1) {
    if (xSegments[i] == x && ySegments[i] == y) {
      return true;
    }
  }
  return false;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ySpeed = -1;
      xSpeed = 0;
    }
    if (keyCode == DOWN) {
      ySpeed = 1;
      xSpeed = 0;
    }
    if (keyCode == RIGHT) {
      ySpeed = 0;
      xSpeed = 1;
    }
    if (keyCode == LEFT) {
      ySpeed = 0;
      xSpeed = -1;
    }
  }
}

//I tried to create a new ellipse for the snake to eat. I tried to make a new variable A,B. it didnt work so i copied the ellipse code and it worked. 
//Now i need to figure out how to move the circle, I changed the grid size and it moved it but now the snake just goes thru the circle and doesnt eati t
