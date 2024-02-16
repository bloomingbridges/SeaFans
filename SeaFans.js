
function setup() {
  createCanvas(500, 640);
  noLoop();
  smooth();
}

function draw() {
  background(0);
  stroke(255);
  fill(0, 0);
  blendMode(SCREEN);
    drawFan(width*0.48, height*0.18, 0.94, -90, 0);
    drawFan(width*0.418, height*0.18, 1.0, -170, 3);
    drawFan(width*0.94, height*0.16, 0.95, -130, 2);
    drawFan(width*0.95, height*0.34, 0.96, -120, 2);
    drawFan(width*0.555, height*0.85, 0.95, 0, 0);
    drawFan(width*0.293, height*0.88, 0.85, 0, 1);
    drawFan(width*0.74, height*0.96, 0.85, 0, 1);
    filter(ERODE);
  blendMode(BLEND);
  drawFrameBorder(12);
}

function drawFrameBorder( inset ) {
  rectMode(CORNER);
  strokeWeight(inset);
  stroke(0);
  rect(0,0,width,height);
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255);
  rect( width * 0.5
      , height * 0.5
      , width - inset
      , height - inset
      );
}

function mouseClicked() {
  redraw();
}
