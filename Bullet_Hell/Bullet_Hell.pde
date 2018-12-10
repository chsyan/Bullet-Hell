// Game state
final int MAINMENU = 0;
final int PLAY = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;
int state;

// Game objects
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

// Player
Player player;

// Font
PFont font_reg, font_bold;

// Input
boolean[] pressed = new boolean[256];
char upKey, leftKey, downKey, rightKey, shootKey;

//UI


void setup() {
  size(800, 800, FX2D);

  // Add player
  player = new Player();
  gameObjects.add(player);

  // Starting game state
  state = MAINMENU;

  // Default input key values
  upKey = 'W';
  leftKey = 'A';
  downKey = 'S';
  rightKey = 'D';
  shootKey = ' ';

  // Font
  font_reg = createFont("pixelmix.ttf", 32);
  font_bold = createFont("pixelmix_bold.ttf", 32);
  textFont(font_bold);
}



void draw() {
  if (state == MAINMENU) {
    mainMenu();
  } else if (state == PLAY) {
    play();
  } else if (state == PAUSE) {
    pause();
  } else if (state == GAMEOVER) {
    gameOver();
  } else if (state == WIN) {
    win();
  }
}


// Input
void keyPressed() {
  if (key==CODED)
    pressed[keyCode] = true;
  else pressed[key] = true;
}

void keyReleased() {
  if (key==CODED)
    pressed[keyCode] = false;
  else pressed[key] = false;
}
