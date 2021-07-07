float CoordX;
float CoordY;

float aimX;
float aimY;

float speed = 1;

void setup()
{
  size(640,480);
  CoordX = random(0,width);
  CoordY = random(-height,0);
  
  aimX = width / 2;
  aimY = height / 2;
  
  fill(0,255,0);
}

void draw()
{
  background(0);
  
  noStroke();
  fill(0,255,0);
  circle(CoordX, CoordY, 100);
  
  stroke(255,255,0);
  noFill();
  circle(aimX, aimY, 20);
  
  CoordY += speed;
}

void keyPressed()
{
  if (key == ' ')
  {
    stroke(255, 0, 0);
    strokeWeight(10);
    line(0,height,aimX,aimY);
    line(width,height,aimX,aimY);
  }
  
  if (dist(aimX, aimY, CoordX, CoordY) < 50)
  {
    CoordX = random(0,width);
    CoordY = random(-height,0);
    
    speed += 1;
  }
  
  if (keyCode == UP)
  {
    aimY += -5;
  }
  
  if (keyCode == DOWN)
  {
    aimY += 5;
  }
  
  if (keyCode == LEFT)
  {
    aimX += -5;
  }
  
  if (keyCode == RIGHT)
  {
    aimX += 5;
  }
}
