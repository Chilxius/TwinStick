//Twinstick shooter test

Chef chef;

PImage shot[] = new PImage[3];
ArrayList<PlayerShot> playerShots = new ArrayList<PlayerShot>();

void setup()
{
  size(900,750);
  imageMode(CENTER);
  rectMode(CENTER);
  
  chef = new Chef();
  
  shot[0] = loadImage("spatula.png");   shot[0].resize(30,0);
  shot[1] = loadImage("pan.png");       shot[1].resize(30,0);
  shot[2] = loadImage("forkSpoon.png"); shot[2].resize(30,0);
}

void draw()
{
  background(255);
  chef.moveAndDraw();
  for(PlayerShot ps: playerShots)
    ps.moveAndDraw();
}

void mousePressed()
{
  playerShots.add( new PlayerShot( 2 ) );
}

void keyPressed()
{
  if( key == 'a' || key == 'A' )
    chef.accelerate("left",true);
  if( key == 'd' || key == 'D' )
    chef.accelerate("right",true);
  if( key == 'w' || key == 'W' )
    chef.accelerate("up",true);
  if( key == 's' || key == 'S' )
    chef.accelerate("down",true);
}

void keyReleased()
{
  if( key == 'a' || key == 'A' )
    chef.accelerate("left",false);
  if( key == 'd' || key == 'D' )
    chef.accelerate("right",false);
  if( key == 'w' || key == 'W' )
    chef.accelerate("up",false);
  if( key == 's' || key == 'S' )
    chef.accelerate("down",false);
}
