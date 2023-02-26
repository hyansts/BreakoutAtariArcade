public class Brick extends Rectangle {
  private boolean broken;

  Brick(Vector position, Vector size) {
    super(position, size);
    this.broken = false;
  }

  public void drawIt() {
    float colorValue = map(position.getY(), 0, height, 0, 255);
    color c = color(colorValue, 230, 230);
    fill(c);
    if (!broken) {
      super.drawIt();
    } else if (size.getX() > 1 && size.getY() > 1) {
      shrink(2);
      super.drawIt();
    }
  }

  public void shrink(float shrinkingFactor) {
    float ratio = size.getX() / size.getY();
    size.subtract(new Vector(shrinkingFactor*ratio, shrinkingFactor));
    position.sum(new Vector(shrinkingFactor*ratio/2, shrinkingFactor/2));
  }

  public void breakIt() {
    this.broken = true;
  }

  public boolean isBroken() {
    return this.broken;
  }
}
