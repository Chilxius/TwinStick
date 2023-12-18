class Chef
{
  PImage image;
  
  float xPos, yPos;
  float xSpd, ySpd;
  
  float angle;
  
  boolean movingRight, movingLeft, movingUp, movingDown;
  
  public Chef()
  {
    xPos = width/2;
    yPos = height/2;
    image = loadImage("chef.png");
    image.resize(30,0);
  }
  
  void moveAndDraw()
  {
    //Move
    if( movingRight ) xSpd++;
    if( movingLeft )  xSpd--;
    if( movingUp )    ySpd--;
    if( movingDown )  ySpd++;

    xPos += xSpd;
    yPos += ySpd;
    
    if( xPos > width || xPos < 0 )
    {
      xSpd = -xSpd;
      xPos += xSpd;
    }
    if( yPos > height || yPos < 0 )
    {
      ySpd = -ySpd;
      yPos += ySpd;
    }
    
    //Friction
    xSpd *= 0.80;
    ySpd *= 0.80;
    
    //Draw
    angle = atan2(mouseY-yPos, mouseX-xPos);
    push();
    translate(xPos,yPos);
    rotate(angle-HALF_PI);
    image(image,0,0);
    pop();
  }
  
  void accelerate( String direction, boolean spdUp )
  {
    if( spdUp )
      if     ( direction.equals( "right" ) ) movingRight = true;
      else if( direction.equals( "left" ) )  movingLeft = true;
      else if( direction.equals( "up" ) )    movingUp = true;
      else                                   movingDown = true;
    else
      if     ( direction.equals( "right" ) ) movingRight = false;
      else if( direction.equals( "left" ) )  movingLeft = false;
      else if( direction.equals( "up" ) )    movingUp = false;
      else                                   movingDown = false;
  }
}
