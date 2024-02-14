
boolean debug;

void setup() {
  size(500,640);
  noLoop();
  smooth();
}

void draw() {
  
  // Default Styles
  background(0);
  stroke(255);
  fill(0,0);
  
  // Sea Fans
  //new Fan(width*0.5, height*0.5, 1.0, 0, 0).draw();

  blendMode(SCREEN);

  new Fan(width*0.48, height*0.18, 0.94, -90, 0).draw();
  new Fan(width*0.418, height*0.18, 1.0, -170, 3).draw();
  new Fan(width*0.94, height*0.16, 0.95, -130, 2).draw();
  new Fan(width*0.95, height*0.34, 0.96, -120, 2).draw();

  new Fan(width*0.555, height*0.85, 0.95, 0, 0).draw();
  new Fan(width*0.293, height*0.88, 0.85, 0, 1).draw();
  new Fan(width*0.74, height*0.96, 0.85, 0, 1).draw();
  
  filter(ERODE);
  
  drawFrameBorder(12); 

  // Guides
  if (debug) {
    stroke(0,128,255,255);
    strokeWeight(1);
    line(width*0.5,0,width*0.5,height);
    line(0,height*0.5,width,height*0.5);
  }

}

void drawFrameBorder(int inset) {
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255);
  rect( width * 0.5
      , height * 0.5
      , width - inset
      , height - inset
      );
}

float stayNegative(float value) {
  if (value >= 0.0) return -1.0;
  else return value;
}

void mouseClicked() {
  redraw();
}

void keyPressed() {
  if (key == 'd') { 
    debug = !debug;
    redraw();
  }
}
