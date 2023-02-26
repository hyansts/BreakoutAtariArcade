Paddle paddle; //<>//
Ball ball;
Brick[] bricks;

void setup() {
  size(900, 600);
  colorMode(HSB);
  textAlign(CENTER);
  textSize(74);
  noStroke();

  Vector paddleSize = new Vector(130, 20);
  Vector paddlePosition = new Vector((width-paddleSize.getX())/2, height-(2*paddleSize.getY()));
  paddle = new Paddle(paddlePosition, paddleSize, 5);

  // position, radius, speed, base speed
  ball = new Ball(new Vector(width/2, height/2+150), 15, new Vector(0, 5), new Vector(5, 5));

  bricks = createBrickTemplate(105);
}

void draw() {
  background(20);

  paddle.drawIt();
  ball.drawIt();

  for (Brick brick : bricks) {
    brick.drawIt();
  }

  paddle.move();

  ball.calculateBounce(paddle);
  ball.calculateBounceOffBricks(bricks);
  ball.move();

  checkEndGame();
}

void checkEndGame() {
  if (allBricksBroken()) {
    fill(255);
    text("You Win!", width/2, height/2);
  } else if (ball.hasHitFloor()) {
    fill(255);
    text("You Lose!", width/2, height/2);
  }
}

Brick[] createBrickTemplate(int amount) {
  Brick[] brickTemplate = new Brick[amount];
  Vector size = new Vector(50, 25);
  int spacing = 10;
  int row = 1;
  int col = 0;
  for (int i=0; i< brickTemplate.length; i++) {
    brickTemplate[i] = new Brick(new Vector((size.getX()+spacing)*col + spacing, row * (size.getY() + spacing) + spacing), new Vector(size));
    if (brickTemplate[i].rightEdgePosition() + spacing + size.getX()  > width) {
      row++;
      col = 0;
    } else {
      col++;
    }
  }
  return brickTemplate;
}

boolean allBricksBroken() {
  for (Brick brick : bricks) {
    if (!brick.isBroken()) return false;
  }
  return true;
}

void keyPressed() {
  switch(keyCode) {
  case RIGHT:
    paddle.setMoveRight(true);
    break;

  case LEFT:
    paddle.setMoveLeft(true);
    break;
  }
}

void keyReleased() {
  switch(keyCode) {
  case RIGHT:
    paddle.setMoveRight(false);
    break;

  case LEFT:
    paddle.setMoveLeft(false);
    break;
  }
}
