float XCoord;
float YCoord;

void setup()
{
  size(640,480);
  
  XCoord = width / 2;
  YCoord = height / 2;
}

void draw()
{
  circle(XCoord, YCoord, 10);
}

void keyPressed()
{
  if (keyCode == UP || key == 'w')
  {
    YCoord += -3;
  }
  
  if (keyCode == DOWN || key == 's')
  {
    YCoord += 3;
  }
  
  if (keyCode == LEFT || key == 'a')
  {
    XCoord += -3;
  }
  
  if (keyCode == RIGHT || key == 'd')
  {
    XCoord += 3;
  }
}
