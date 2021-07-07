float CENTERX;
float CENTERY;
color currentColor;

void setup()
{
  size(640, 480);
  
  CENTERX = width * .5;
  CENTERY = height * .5;
  
  colorMode(HSB, 360, 100, 100);
  background(0);
  stroke(255);
}

void draw()
{
  
}

void mouseDragged()
{
  currentColor = color((noise(mouseX * 0.01, mouseY * 0.01) * 720) % 360, 100, 100);
  
  stroke(currentColor);
  line(CENTERX, CENTERY, mouseX, mouseY);
  line(CENTERX, CENTERY, -mouseX + width, -mouseY + height);
  line(CENTERX, CENTERY, mouseX, -mouseY + height);
  line(CENTERX, CENTERY, -mouseX + width, mouseY);
}
