abstract class Enemy extends GameObject {

  Enemy() {
    position = new PVector(0, 0);
    rotation = new PVector(0, 0);
    velocity = new PVector(0, 0);

    hp = 100;

    w = 40;
    h = 40;
    speed = 5;
    good = false;
    col = color(255, 0, 0);
    damage = 50;

    // Verticies
    verticies = new PVector[3];
    verticies[0] = new PVector(w/2, 0);
    verticies[1] = new PVector(-w/2, -h/2);
    verticies[2] = new PVector(-w/2, h/2);
  }

  void display() {
    pushMatrix();

    translate(position.copy().x, position.copy().y);
    rotate(rotation.copy().heading());

    stroke(col);
    fill(0);
    beginShape();
    for (int i=0; i<verticies.length; i++) {
      vertex(verticies[i].copy().x, verticies[i].copy().y);
    }
    endShape(CLOSE);

    line(0, 0, h/2, 0);

    popMatrix();
  }

  void update() {
    position.add(velocity.copy());
  }
}

class StationaryEnemy extends Enemy {
  StationaryEnemy() {
    super();
    position = new PVector(random(width), random(height));
    rotation = new PVector(0, 1);
  }
}
