class PlayerShot
{
  float xPos, yPos;
  float xSpd, ySpd;
  
  float angle;
  int speed;
  int type;
  
  public PlayerShot( int t )
  {
    xPos = chef.xPos;
    yPos = chef.yPos;
    type = t;
    angle = 0;
    
    speed = speedByType(type);
    //Determine speed based on vector subtraction
    xSpd = mouseX-xPos;
    ySpd = mouseY-yPos;
    
    //Divide speeds based on speed variable
    xSpd /= dist(xPos,yPos,mouseX,mouseY)/speed;
    ySpd /= dist(xPos,yPos,mouseX,mouseY)/speed;
  }
  
  void moveAndDraw()
  {
    angle += speed/50.0;
    
    xPos += xSpd;
    yPos += ySpd;
    
    push();
    translate(xPos,yPos);
    rotate(angle);
    image(shot[type], 0, 0);
    pop();
  }
  
  int speedByType(int t)
  {
    if( t == 0 )
      return 5;
    if( t == 1 )
      return 6;
    if( t == 2 )
      return 3;
    
    return 0;
  }
}
