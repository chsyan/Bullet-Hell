class Bullet extends GameObject {
  Bullet(PVector position, PVector rotation, float speed, color col, boolean good) {

    this.speed = speed;

    this.position = position.copy();
    this.rotation = rotation.copy();
    velocity = rotation.copy().mult(this.speed);

    hp = 1;
    w = 5;
    h = 5;
    this.col = col;
    this.good = good;

    verticies = new PVector[4];
    verticies[0] = new PVector(w/2, w/2);
    verticies[1] = new PVector(-w/2, h/2);
    verticies[2] = new PVector(-w/2, -h/2);
    verticies[3] = new PVector(w/2, -h/2);
  }

  void display() {
    pushMatrix();

    translate(position.x, position.y);
    rotate(rotation.copy().heading());

    stroke(col);
    fill(col);
    beginShape();
    vertex(w/2, w/2);
    vertex(-w/2, h/2);
    vertex(-w/2, -h/2);
    vertex(w/2, -h/2);

    endShape(CLOSE);

    popMatrix();
  }

  void update() {
    position.add(velocity.copy());
    collisions();
  }

  void collisions() {
    for (GameObject e : gameObjects) {
      if (e instanceof Enemy) {
        float[] myVerticies = getVerticies();
        float[] eVerticies = e.getVerticies();
        for (int i=0; i<myVerticies.length; i+=2) {
          if (contains(myVerticies[i], myVerticies[i+1], eVerticies)) {
            gameObjects.remove(this);
            e.takeDamage(this.damage);
          }
        }
      }
    }
  }

  boolean contains(float x, float y, float[] v) {
    final float[] vertices = v; 
    final int numFloats = vertices.length;           
    int intersects = 0;                                

    for (int i = 0; i < numFloats; i += 2) {
      float x1 = vertices[i];                   
      float y1 = vertices[i + 1];               
      float x2 = vertices[(i + 2) % numFloats];  
      float y2 = vertices[(i + 3) % numFloats];   
      if (((y1 <= y && y < y2) || (y2 <= y && y < y1)) 
        && x < ((x2 - x1) / (y2 - y1) * (y - y1) + x1)) intersects++;
    }
    return (intersects & 1) == 1;
  }
}
