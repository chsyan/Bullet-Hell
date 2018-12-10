abstract class GameObject {

  float hp, w, h, speed, damage;
  color col;
  boolean good;
  PVector position, rotation, velocity;
  PVector[] verticies;

  GameObject() {
  }

  void display() {
  }

  void update() {
  }

  void dead() {
  }

  void takeDamage(float damage) {
    hp -= damage;
  }

  float[] getVerticies() {
    float[] v = new float[verticies.length*2];
    for (int i=0; i<verticies.length; i++) {
      PVector temp = verticies[i].copy().rotate(rotation.copy().heading());
      v[i*2] = temp.copy().x + position.copy().x;
      v[i*2+1] = temp.copy().y + position.copy().y;
    }
    return v;
  }

  boolean isDead() {
    return hp<=0;
  }
}
