float angle = 0.0;
float rotation = 0.0;
float speed = 0.0;
float deceleration = 0.0;

//float driftAngle = 0.0;
//float driftSpeed = 0.0;

float xNew, yNew, xOld, yOld;

color color1;
color color2;

void setup()
{
  fullScreen();
  background(255);
  reset();
}

void draw()
{
  xOld = xNew;
  yOld = yNew;
  
  xNew += sin(radians(angle)) * speed;
  yNew += cos(radians(angle)) * speed;
  
  //xNew += sin(radians(driftAngle)) * driftSpeed;
  //yNew += cos(radians(driftAngle)) * driftSpeed;
  
  stroke(lerpColor(color1, color2, speed / 500));
  
  line(xOld,yOld,xNew,yNew);
  
  speed -= deceleration;
  angle += rotation;
  
  if (speed <= 0)
  {
    reset();
    noStroke();
    fill(255,5);
    filter(BLUR, 1);
    rect(0,0,width,height);
  }
}

void reset()
{
  angle = random(360);
  rotation = random(60,145);
  speed = random(100,500);
  deceleration = random(2, 7);
  
  //driftAngle = random(360);
  //driftSpeed = random(3,10);
  
  color1 = getRandomColor();
  color2 = getRandomColor();
  
  xNew = random(0,width);
  yNew = random(0,height);
}

color getRandomColor()
{
  float x,y,z;
  color returnColor = color(0);
  
  x = random(1);
  y = random(1) * x;
  z = random(1) * y;
  
  switch (int(random(6)))
  {
    case 0:
      returnColor = color(x * 255, y * 255, z * 255);
      break;
    case 1:
      returnColor = color(x * 255, z * 255, y * 255);
      break;
    case 2:
      returnColor = color(z * 255, y * 255, x * 255);
      break;
    case 3:
      returnColor = color(y * 255, x * 255, z * 255);
      break;
    case 4:
      returnColor = color(y * 255, z * 255, x * 255);
      break;
    case 5:
      returnColor = color(z * 255, x * 255, y * 255);
      break;
  }
  
  return returnColor;
}
