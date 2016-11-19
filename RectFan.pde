
class RectFan {

  float posX;
  float posY;
  float scale;
  float rotation;
  int segment = 6;
  
  RectFan(float x, float y, float s, float r) {
    posX = x;
    posY = y;
    scale = s;
    rotation = r;
  }
  
  void draw() {
    pushMatrix();
    translate(posX,posY);
    //scale(scale);
    rotate(radians(rotation));
    for (int s=-8; s<8; ++s) {
      pushMatrix();
      rotate((radians(s*segment)));
      strokeWeight(map(scale,0.8,1.0,0.15,1.5));
      drawStrip(32+(8-abs(s)));
      popMatrix();
    }
    popMatrix();
  }
  
  void drawStrip(int length) {
    for (int i=-segment; i<length-segment; ++i) {
      rect(0,i*-segment,24,6); 
    }
  }

}