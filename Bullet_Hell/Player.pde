class Player extends GameObject {

  float shield, lastTimeDamageTaken;

  Gun gun;

  Player() {
    position = new PVector(width/2, height-100);
    rotation = new PVector(0, -1);
    velocity = new PVector(0, 0);

    hp = 100;
    shield = 100;

    w = 40;
    h = 40;
    speed = 5;
    good = true;
    col = color(0, 255, 0);
    damage = 100;

    gun = new BasicGun();

    lastTimeDamageTaken = 0;


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
    velocity = new PVector(0, 0);
    getInput();
    position = position.add(velocity.copy());

    gun.update();
    updateShield();
    collisions();
  }

  void getInput() {
    if (pressed[upKey]) {
      velocity.y = -speed;
    }
    if (pressed[downKey]) {
      velocity.y = speed;
    }
    if (pressed[leftKey]) {
      velocity.x = -speed;
    }
    if (pressed[rightKey]) {
      velocity.x = speed;
    }
    if (pressed[shootKey]) {
      gun.shoot(new PVector(position.copy().x, position.copy().y - h/2), rotation.copy(), 15, col, good);
    }
  }

  void takeDamage(float damage) {
    lastTimeDamageTaken = 0;
    shield -= damage;
    if (shield < 0) {
      hp += shield;
      shield = 0;
    }
  }

  void updateShield() {
    lastTimeDamageTaken++;
    if (lastTimeDamageTaken > 120) {
      shield = lerp(shield, 120, 0.003);
    }
    if (shield > 100)
      shield = 100;
  }

  void collisions() {
    for (GameObject e : gameObjects) {
      if (e instanceof Enemy) {
        float[] myVerticies = getVerticies();
        float[] eVerticies = e.getVerticies();
        for (int i=0; i<myVerticies.length; i+=2) {
          if (contains(myVerticies[i], myVerticies[i+1], eVerticies)) {
            this.takeDamage(e.damage);
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
