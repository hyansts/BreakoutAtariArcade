public class Paddle extends Rectangle {
  private float speed;
  private boolean moveRight;
  private boolean moveLeft;

  Paddle(Vector position, Vector size, float speed) {
    super(position, size);
    this.speed = speed;
    this.moveRight = false;
    this.moveLeft = false;
  }

  public void move() {
    if (moveRight) position.addToX(speed);
    if (moveLeft) position.addToX(-speed);
    bindToScreen();
  }

  public void drawIt(){
    fill(150 ,240, 240);
    super.drawIt();
  }

  public void bindToScreen() {
    if (position.getX() > width-size.getX()) {
      position.setX(width - size.getX());
    } else if (position.getX() < 0) {
      position.setX(0);
    }
  }

  public void incrementSpeed(float increment) {
    speed += increment;
  }

  public boolean getMoveRight() {
    return this.moveRight;
  }

  public void setMoveRight(boolean moveRight) {
    this.moveRight = moveRight;
  }

  public boolean getMoveLeft() {
    return this.moveLeft;
  }

  public void setMoveLeft(boolean moveLeft) {
    this.moveLeft = moveLeft;
  }
}
