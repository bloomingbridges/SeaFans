
class Fan {

  float posX;
  float posY;
  float scale;
  float rotation;
  int   instabilityLevel;
  
  Fan(float x, float y, float s, float r, int i) {
    posX = x;
    posY = y;
    scale = s;
    rotation = r;
    instabilityLevel = i;
  }
  
  public void draw() {
    
    fill(0,0);
    stroke(255,250);
    strokeWeight( map(scale, 0.8, 1.0, 1.5, 3) );
    
    pushMatrix();
    
      translate(posX, posY);
      scale(scale);
      rotate(radians(rotation));
      
      int stripLength;
      for (int s=-7; s<7; ++s) {
        pushMatrix();
        rotate(radians(glitchFloat(s*6+3,abs(s))));
        stripLength = 32 + glitchInt(8-(abs(s)));
        if (s >= 0) stripLength -= 1;
        if (s == -6 || s == 5) stripLength -= int(random(1,3));
        if (s == -7 || s == 6) stripLength -= int(random(2,abs(s)));
        drawStrip(s, stripLength, false);
        popMatrix();
      }
      
      pushMatrix();
      translate(0,-4);
      rotate(radians(-80+int(random(-2,2))));
      drawStrip(-12,7+int(random(0,3)),true);
      rotate(radians(15+int(random(-2,2))));
      drawStrip(-10,9+int(random(0,3)),true);
      rotate(radians(130+int(random(-2,2))));
      drawStrip(10,9+int(random(0,3)),true);
      rotate(radians(15+int(random(-2,2))));
      drawStrip(12,7+int(random(0,3)),true);
      popMatrix();
      
      //fill(255,250);
      //ellipse(0,-14,36,36);
    
    popMatrix();
    
  }
  
  private void drawStrip(int position, int length, boolean speedUp) {
    pushMatrix();
    float lskew = (position < 0) ? 0.75 : 0;
    float rskew = (position < 0) ? 0 : 0.75;
    float growth = (speedUp) ? 0.8 : 0.3;
    for(int i=1; i<length; ++i) {
      beginShape(QUAD);
      vertex(-i*growth, stayNegative(-6*(i-lskew)));
      vertex(-i*growth, stayNegative(-6*(i-1-lskew)));
      vertex(i*growth, stayNegative(-6*(i-1-rskew)));
      vertex(i*growth, stayNegative(-6*(i-rskew)));
      endShape();
    }

    popMatrix();
  }
  
  private float glitchFloat(float value, int degree) {
    if (instabilityLevel == 0) return value;
    if (instabilityLevel + degree >= 6) {
      float r = random(-degree/2,degree/2);
      return value + r;
    } else {
      return value;
    }
  }
  
  private int glitchInt(int value) {
    float r = random(0,1);
    if (r > 0.5) { return value + int(random(0,instabilityLevel)); }
    else { return value - int(random(0,instabilityLevel)); }
  }

}
