void renderGameObjects() {

  for (int i = gameObjects.size() - 1; i >= 0; i--) {
    GameObject obj = gameObjects.get(i);
    obj.display();
    obj.update();
    if (obj.isDead()) {
      obj.dead();
      gameObjects.remove(i);
    }
  }
}

void displayUI() {
  // Player hp / shield
  noStroke();
  rectMode(CORNER);

  // Back bit
  fill(100);
  rect(150, height-50, width-300, 20);
  rect(150, height-65, width-295, 10);

  // Hp
  float hue = map(player.hp, 0, 100, -5, 100);
  float rx = map(player.hp, 0, 100, 0, width-300);
  colorMode(HSB);
  fill(hue, 255, 255);
  colorMode(RGB);
  rect(150, height-50, rx, 20);

  // Shield
  rx = map(player.shield, 0, 100, 0, width-302.5);
  fill(#249EFF);
  rect(155, height-65, rx, 10);

  // Shapers (HP)
  fill(0);
  stroke(0);
  beginShape();
  vertex(width-150, height-50);
  vertex(width-155, height-40);
  vertex(width-400, height-40);
  vertex(width-405, height-30);
  vertex(width-150, height-30);
  endShape(CLOSE);

  beginShape();
  vertex(150, height-30);
  vertex(155, height-50);
  vertex(150, height-50);
  endShape(CLOSE);

  // Shapers (Shield)

  beginShape();
  vertex(155, height-55);
  vertex(158, height-65);
  vertex(150, height-65);
  vertex(150, height-55);
  endShape(CLOSE);

  beginShape();
  vertex(width-145, height-65);
  vertex(width-150, height-55);
  vertex(width-145, height-55);
  endShape();
}
