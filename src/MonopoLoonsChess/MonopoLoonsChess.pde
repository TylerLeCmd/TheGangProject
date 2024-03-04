boolean lastPressed;
PImage whiterook;
PImage whitequeen;
PFont font;
boolean pressed;
ArrayList<King> kings;
ArrayList<Rook> rooks = new ArrayList<Rook>();
ArrayList<Queen> queens = new ArrayList<Queen>();
String piece;
float money;

void setup() {
  lastPressed = false;
  whiterook = loadImage("whiterook.png");
  whitequeen = loadImage("whitequeen.png");
  pressed = false;
  kings = new ArrayList<King>(0);
  piece = "";
  size(900, 600);
  font = createFont("Montserrat-Bold.ttf", 128);
  textFont(font);
  imageMode(CENTER);
}

void draw() {
  bgDraw();
  pressed = mousePressed;
  if(money<50) {
    tint(255, 128);
  }
  image(whiterook, 750, 200, 50, 50);
  noTint();
  if(money<90) {
    tint(255, 128);
  }
  image(whitequeen, 675, 200, 50, 50);
  noTint();
  if(pressed&&!lastPressed) {
    if(mouseX>725&&mouseX<775&&mouseY>175&&mouseY<225) {
      piece = "rook";
    } else if(mouseX>650&&mouseX<700&&mouseY>175&&mouseY<225) {
      piece = "queen";
    }
  }
  if(mousePressed) {
    if(piece=="rook") {
      PImage wrtemp = loadImage("whiterook.png");
      if(money<50) {
        tint(255, 128);
      }
      image(wrtemp, 50+50*floor((mouseX-25)/50), 600-(50+50*floor((600-(mouseY+25))/50)), 50, 50);
      noTint();
    } else if(piece == "queen") {
      PImage wqtemp = loadImage("whitequeen.png");
      if(money<90) {
        tint(255, 128);
      }
      image(wqtemp, 50+50*floor((mouseX-25)/50), 600-(50+50*floor((600-(mouseY+25))/50)), 50, 50);
      noTint();
    }
  }
  if(lastPressed&&!pressed) {
    if(mouseX>75&&mouseX<525&&mouseY>75&&mouseY<525) {
      if(piece == "rook" && money>=50) {
        rooks.add(new Rook(floor((mouseX-25)/50), floor((600-(mouseY+25))/50), true));
        money -= 50;
      } else if(piece == "queen" && money>=90) {
        queens.add(new Queen(floor((mouseX-25)/50), floor((600-(mouseY+25))/50), true));
        money -= 90;
      }
    }
    piece = "";
  }
  for (Rook r : rooks) {
    r.drawPiece();
  }
  for (Queen q : queens) {
    q.drawPiece();
  }
  Rook rookW1 = new Rook(1, 1, true);
  rookW1.drawPiece();
  Rook rookW2 = new Rook(9, 1, true);
  rookW2.drawPiece();
  Rook rookB1 = new Rook(1, 9, false);
  rookB1.drawPiece();
  Rook rookB2 = new Rook(9, 9, false);
  rookB2.drawPiece();
  King king = new King();
  king.setX(5);
  king.setY(5);
  king.setWhite(true);
  king.drawPiece();
  /*King king2 = new King();
  if (!move) {
    king2.setX(lastX);
    king2.setY(lastY);
  } else {
    king2.setX(floor((mouseX-25)/50));
    king2.setY(floor((600-(mouseY+25))/50));
  }
  king2.setWhite(true);
  king2.drawPiece();*/
  fill(255);
  text(mouseX, 700, 500);
  text(mouseY, 700, 550);
  lastPressed = mousePressed;
  money += 0.1;
  text(floor(money), 800, 500);
}

void bgDraw() {
  background(144, 238, 144);
  textAlign(CENTER);
  colorMode(RGB, 255);
  rectMode(CORNER);
  fill(144, 238, 144);
  rect(0, 0, 600, 600);
  rect(0, 0, 75, 75);
  rect(525, 0, 75, 75);
  rect(0, 525, 75, 75);
  rect(525, 525, 75, 75);
  for (int i = 0; i<9; i++) {
    rect(75+50*i, 0, 50, 75);
    rect(75+50*i, 525, 50, 75);
    rect(0, 75+50*i, 75, 50);
    rect(525, 75+50*i, 75, 50);
  }
  colorMode(HSB, 360);
  fill(0, 360, 360);
  rect(475, 525, 50, 25);
  rect(375, 525, 50, 25);
  fill(45, 360, 360);
  rect(225, 525, 50, 25);
  rect(125, 525, 50, 25);
  rect(75, 525, 50, 25);
  fill(90, 360, 360);
  rect(50, 475, 25, 50);
  rect(50, 375, 25, 50);
  rect(50, 325, 25, 50);
  fill(135, 360, 360);
  rect(50, 225, 25, 50);
  rect(50, 125, 25, 50);
  rect(50, 75, 25, 50);
  fill(180, 360, 360);
  rect(75, 50, 50, 25);
  rect(175, 50, 50, 25);
  rect(225, 50, 50, 25);
  fill(225, 360, 360);
  rect(325, 50, 50, 25);
  rect(375, 50, 50, 25);
  rect(475, 50, 50, 25);
  fill(270, 360, 360);
  rect(525, 75, 25, 50);
  rect(525, 125, 25, 50);
  rect(525, 225, 25, 50);
  fill(315, 360, 360);
  rect(525, 375, 25, 50);
  rect(525, 475, 25, 50);
  textSize(80);
  stroke(111, 17, 111);
  colorMode(RGB, 255);
  noStroke();
  for (int i = 0; i < 4; i++) {
    fill (118, 154, 82);
    rect((i*100)+75, 75, 50, 50);
    fill (228, 234, 193);
    rect((i*100)+125, 75, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (118, 154, 82);
    rect((i*100)+75, 175, 50, 50);
    fill (228, 234, 193);
    rect((i*100)+125, 175, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (118, 154, 82);
    rect((i*100)+75, 275, 50, 50);
    fill (228, 234, 193);
    rect((i*100)+125, 275, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (118, 154, 82);
    rect((i*100)+75, 375, 50, 50);
    fill (228, 234, 193);
    rect((i*100)+125, 375, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (118, 154, 82);
    rect((i*100)+75, 475, 50, 50);
    fill (228, 234, 193);
    rect((i*100)+125, 475, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (228, 234, 193);
    rect((i*100)+75, 125, 50, 50);
    fill (118, 154, 82);
    rect((i*100)+125, 125, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (228, 234, 193);
    rect((i*100)+75, 225, 50, 50);
    fill (118, 154, 82);
    rect((i*100)+125, 225, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (228, 234, 193);
    rect((i*100)+75, 325, 50, 50);
    fill (118, 154, 82);
    rect((i*100)+125, 325, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (228, 234, 193);
    rect((i*100)+75, 425, 50, 50);
    fill (118, 154, 82);
    rect((i*100)+125, 425, 50, 50);
  }
  for (int i = 0; i < 4; i++) {
    fill (118, 154, 82);
    rect(475, (i*100)+75, 50, 50);
    fill (228, 234, 193);
    rect(475, (i*100)+125, 50, 50);
  }
  fill (118, 154, 82);
  rect (475, 475, 50, 50);
  stroke(1);
  noFill();
  rect (75, 75, 450, 450);
  textAlign(RIGHT, BOTTOM);
  textSize(12);
  fill (228, 234, 193);
  text("i", 475, 475, 47, 47);
  text("g", 375, 475, 47, 47);
  text("e", 275, 475, 47, 47);
  text("c", 175, 475, 47, 47);
  text("a", 75, 475, 47, 47);
  fill (118, 154, 82);
  text("h", 425, 475, 47, 47);
  text("f", 325, 475, 47, 47);
  text("d", 225, 475, 47, 47);
  text("b", 125, 475, 47, 47);
  textAlign(LEFT, TOP);
  fill (228, 234, 193);
  text("9", 78, 77, 47, 47);
  text("7", 78, 177, 47, 47);
  text("5", 78, 277, 47, 47);
  text("3", 78, 377, 47, 47);
  text("1", 78, 477, 47, 47);
  fill (118, 154, 82);
  text("8", 78, 127, 47, 47);
  text("6", 78, 227, 47, 47);
  text("4", 78, 327, 47, 47);
  text("2", 78, 427, 47, 47);
  fill(30);
  stroke(30);
  /*rect(330, 495, 30, 30);
  strokeWeight(2);
  line(345, 475, 345, 495);
  line(335, 485, 355, 485);
  strokeWeight(1);*/
}
