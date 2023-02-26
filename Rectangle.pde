public class Rectangle {
  protected Vector position;
  protected Vector size;

  Rectangle(Vector position, Vector size) {
    this.position = position;
    this.size = size;
  }

  public void drawIt() {
    rect(position.getX(), position.getY(), size.getX(), size.getY());
  }

  public float leftEdgePosition() {
    return this.position.getX();
  }

  public float rightEdgePosition() {
    return this.position.getX() + this.size.getX();
  }

  public float topEdgePosition() {
    return this.position.getY();
  }

  public float bottomEdgePosition() {
    return this.position.getY() + this.size.getY();
  }

  /**Get/Set**/
  public Vector getPosition() {
    return this.position;
  }

  public void setPositionX(Vector position) {
    this.position = position;
  }

  public Vector getSize() {
    return this.size;
  }

  public void setSize(Vector size) {
    this.size = size;
  }
}
