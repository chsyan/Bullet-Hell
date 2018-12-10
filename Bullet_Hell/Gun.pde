abstract class Gun {

  float thresh, cd;

  Gun() {
  }

  void update() {
    cd--;
  }

  void shoot(PVector position, PVector rotation, float speed, color col, boolean good) {
    if (cd <= 0) {
      cd = thresh;
      bulletPattern(position.copy(), rotation.copy(), speed, col, good);
    }
  }

  void bulletPattern(PVector position, PVector rotation, float speed, color col, boolean good) {
  }
}

class BasicGun extends Gun {
  BasicGun() {
    thresh = 20;
    cd = thresh;
  }
  void bulletPattern(PVector position, PVector rotation, float speed, color col, boolean good) {
    gameObjects.add(new Bullet(position.copy(), rotation.copy(), speed, col, good));
  }
}

class DoubleGun extends Gun {
  DoubleGun() {
    thresh = 20;
    cd = thresh;
  }
  void bulletPattern(PVector position, PVector rotation, float speed, color col, boolean good) {
    gameObjects.add(new Bullet(new PVector(position.x - 5, position.y), rotation.copy(), speed, col, good));
    gameObjects.add(new Bullet(new PVector(position.x + 5, position.y), rotation.copy(), speed, col, good));
  }
}

class TripleGun extends Gun {
  float angle;
  TripleGun() {
    thresh = 20;
    cd = thresh;
    angle = PI/32;
  }
  void bulletPattern(PVector position, PVector rotation, float speed, color col, boolean good) {
    gameObjects.add(new Bullet(position.copy(), rotation.copy().rotate(-angle), speed, col, good));
    gameObjects.add(new Bullet(position.copy(), rotation.copy(), speed, col, good));
    gameObjects.add(new Bullet(position.copy(), rotation.copy().rotate(angle), speed, col, good));
  }
}
