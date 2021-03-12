
class Bone {
 
  // properties?
  
  // relative direction the bone points, in radians
  // if direction is zero, then this bone points the same way as the parent
  float dir = 0;
  
  // the length of the bone, in pixels
  float mag = 100;  
  
  // cashed / derived values:
  PVector worldStart; // start of the bone in world-space 
  PVector worldEnd; // end of the bone in world-space 
  float worldDir = 0; // world-space angle of the bone 
  
  void draw() {
     calc();
    
    line(worldStart.x, worldStart.y, worldEnd.x, worldEnd.y);
    
  }
  void calc(){
   // calc bone start (bs)
   
   // if there's a parent, then 'worldStart' = 'parent.worldEnd'
   // else:
   worldStart = new PVector (100, 100);
   
   // if there's a parent, the 'worldDir' = 'parent.worldDir' + 'dir'
   // else:
   worldDir = dir;
   
    // calc bone end (be)
    PVector localEnd = PVector.fromAngle(worldDir); //new PVector(mag * cos(worldDir), mag * sin(worldDir));
    localEnd.mult(mag);
    
    worldEnd = PVector.add(worldStart,localEnd);
    
  }
  
}
