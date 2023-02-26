public class Vector {
  private float x;
  private float y;

  Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Vector(Vector vector) {
    this.x = vector.x;
    this.y = vector.y;
  }

  public void subtract(Vector vector) {
    this.x -= vector.x; 
    this.y -= vector.y;
  }

  public void sum(Vector vector) {
    this.x += vector.x; 
    this.y += vector.y;
  }

  public void addToX (float number) {
    this.x += number;
  }

  public void multiply(float scalar) {
    this.x *= scalar; 
    this.y *= scalar;
  }

  public float distanceSquared() {
    return ((this.x * this.x) + (this.y * this.y));
  }

  public float getX() {
    return x;
  }

  public void setX(float x) {
    this.x = x;
  }

  public float getY() {
    return y;
  }

  public void setY(float y) {
    this.y = y;
  }
}
