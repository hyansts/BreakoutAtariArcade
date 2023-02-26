public class Ball { //<>//
  private Vector position;
  private Vector speed; // current speed
  private Vector baseSpeed; // base speed calculated after bounce
  private float baseSpeedIncrement;
  private float maxSpeed;
  private float radius;
  private CircleCollider collider;

  public Ball(Vector position, float radius, Vector speed, Vector baseSpeed) {
    this.position = position;
    this.radius = radius;
    this.speed = speed;
    this.baseSpeed = baseSpeed;
    this.collider = new CircleCollider(position, radius);
    this.baseSpeedIncrement = 0.2;
    this.maxSpeed = 15;
  }

  public void drawIt() {
    fill(240);
    circle(position.getX(), position.getY(), radius*2);
  }

  public void move() {
    if (!hasHitFloor()) {
      this.position.sum(this.speed);
    }
  }

  public void calculateBounce(Paddle paddle) {
    if (collider.hasCollidedWithWall()) {
      this.speed.setX(this.speed.getX() * -1);
    }
    if (collider.hasCollidedWithCeiling()) {
      this.speed.setY(this.speed.getY() * -1);
    }
    if (collider.hasCollidedWithRect(paddle)) {
      bounceOffPaddle(paddle);
    }
  }

  public void calculateBounceOffBricks(Brick[] bricks) {
    for (Brick brick : bricks) {
      if (!brick.isBroken() && collider.hasCollidedWithRect(brick)) {
        bounceOffBrick(brick);
        brick.breakIt();
        break;
      }
    }
  }

  public void bounceOffBrick(Brick brick) {
    Vector edge = collider.closestRectEdge(brick);
    Vector positionDifference = new Vector(position);
    positionDifference.subtract(edge);
    float absoluteXDiff = abs(positionDifference.getX());
    float absoluteYDiff = abs(positionDifference.getY());

    // vertical bounce
    if ( absoluteXDiff <= absoluteYDiff) {
      this.speed.setY(this.speed.getY() * -1);
    }

    // horizontal bounce
    if (absoluteXDiff >= absoluteYDiff) {
      this.speed.setX(this.speed.getX() * -1);
    }
  }

  public void bounceOffPaddle(Paddle paddle) {
    float angle = bounceAngle(paddle);
    speed.setX(baseSpeed.getX() * cos(angle));
    speed.setY(baseSpeed.getY() * sin(angle) * -1);
    if (baseSpeed.getX() <= maxSpeed) {
      baseSpeed.sum(new Vector(baseSpeedIncrement, baseSpeedIncrement));
      paddle.incrementSpeed(baseSpeedIncrement);
    }
  }

  public float bounceAngle(Paddle paddle) {
    // bounce angle based on where the ball hits
    return (paddle.rightEdgePosition()-this.position.getX()) / (paddle.getSize().getX()/2) * (PI/2);
  }

  public boolean hasHitFloor() {
    return collider.hasCollidedWithFloor();
  }

  /**Get/Set**/
  public Vector getPosition() {
    return this.position;
  }

  public void setPosition(Vector position) {
    this.position = position;
  }

  public Vector getSpeed() {
    return this.speed;
  }

  public void setSpeed(Vector speed) {
    this.speed = speed;
  }

  public float getRadius() {
    return this.radius;
  }

  public void setRadius(float radius) {
    this.radius = radius;
  }
}
