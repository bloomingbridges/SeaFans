
function drawFan( x, y, size, rotation, instability ) {
  fill(0, 0);
  stroke(255, 250);
  strokeWeight(map(size / pixelDensity(), 0.8, 1.0, 1.5, 3));
  
  push();
  
    translate(x, y);
    scale(size);
    rotate(radians(rotation));
    
    let stripLength;
    for ( let s = -7; s < 7; ++s ) {
      push();
        rotate(radians(glitchFloat(s*6+3,abs(s),instability)));
        stripLength = 32 + glitchInt(8-abs(s),instability);
        if (s >= 0) { stripLength -= 1; }
        if (s == -6 || s == 5) { stripLength -= int(random(1,3)); }
        if (s == -7 || s == 6) { stripLength -= int(random(2,abs(s))); }
        drawStrip(s, stripLength, false);
      pop();
    }
    
    push();
      translate(0,-4);
      rotate(radians(-80+int(random(-2,2))));
      drawStrip(-12,7+int(random(0,3)),true);
      rotate(radians(15+int(random(-2,2))));
      drawStrip(-10,9+int(random(0,3)),true);
      rotate(radians(130+int(random(-2,2))));
      drawStrip(10,9+int(random(0,3)),true);
      rotate(radians(15+int(random(-2,2))));
      drawStrip(12,7+int(random(0,3)),true);
    pop();

  pop();
}

function drawStrip( position, length, speedUp ) {
  push();
    var lskew = (position < 0) ? 0.75 : 0;
    var rskew = (position < 0) ? 0 : 0.75;
    var growth = (speedUp) ? 0.8 : 0.3;
    for ( let i = 1; i < length; ++i ) {
      beginShape(QUADS);
        vertex(-i*growth, stayNegative(-6*(i-lskew)));
        vertex(-i*growth, stayNegative(-6*(i-1-lskew)));
        vertex(i*growth, stayNegative(-6*(i-1-rskew)));
        vertex(i*growth, stayNegative(-6*(i-rskew)));
      endShape();
    }
  pop();
}
  
function glitchFloat( value, degree, instabilityLevel ) {
  if (instabilityLevel == 0) return value;
  if (instabilityLevel + degree >= 6) {
    var r = random(-degree/2,degree/2);
    return value + r;
  } else {
    return value;
  }
}
  
function glitchInt( value, instabilityLevel ) {
  if (random() > 0.5) { 
    return value + int(random(0,instabilityLevel)); 
  } else { 
    return value - int(random(0,instabilityLevel)); 
  }
}
  
function stayNegative( value ) {
  return (value >= 0.0) ? -1.0 : value;
}
