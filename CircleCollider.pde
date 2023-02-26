public class CircleCollider {
  Vector position;
  float radius;

  CircleCollider(Vector position, float radius) {
    this.position = position;
    this.radius = radius;
  }

  public boolean hasCollidedWithWall() {
    return (position.getX()+radius > width || position.getX()-radius < 0);
  }

  public boolean hasCollidedWithFloor() {
    return (position.getY()+radius > height);
  }

  public boolean hasCollidedWithCeiling() {
    return (position.getY()-radius < 0);
  }

  public boolean hasCollidedWithRect(Rectangle rect) {
    Vector edge = closestRectEdge(rect);

    // distance from closest edge
    Vector positionDifference = new Vector(position);
    positionDifference.subtract(edge);
    float distanceSquared = positionDifference.distanceSquared();

    return (distanceSquared <= radiusSquared());
  }

  public float radiusSquared() {
    return this.radius*this.radius;
  }

  public Vector closestRectEdge(Rectangle rect) {
    Vector edge = new Vector(this.position);

    if (this.position.getX() < rect.leftEdgePosition()) {
      edge.setX(rect.leftEdgePosition());
    } else if (this.position.getX() > rect.rightEdgePosition()) {
      edge.setX(rect.rightEdgePosition());
    }

    if (this.position.getY() < rect.topEdgePosition()) {
      edge.setY(rect.topEdgePosition());
    } else if (this.position.getY() > rect.bottomEdgePosition()) { //<>//
      edge.setY(rect.bottomEdgePosition());
    }

    return edge;
  }
}
