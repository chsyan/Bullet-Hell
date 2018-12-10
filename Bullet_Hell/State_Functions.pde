void mainMenu() {
  background(0);

  textFont(font_reg);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(40);

  text("Bullet Hell", width/2, height/2 - 100);

  textSize(25);

  text("Play", width/2, height/2 +50);
  text("Help", width/2, height/2 +100);

  // Switch state
  if (pressed[shootKey]) {
    state = PLAY;
  }
}

void play() {
  background(0);

  renderGameObjects();
  displayUI();

  if (pressed['F']) {
    gameObjects.add(new StationaryEnemy());
    pressed['F'] = false;
  }
}

void pause() {
}

void gameOver() {
}

void win() {
}
