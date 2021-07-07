float[] XCoord;
float[] YCoord;
color[] Color;
float angle;

void setup()
{
  XCoord = new float[10000];
  YCoord = new float[10000];
  Color = new color[10000];
  fullScreen();
  
  noiseDetail(1, 1);
  
  for (int i = 0; i < XCoord.length; i++)
  {
    XCoord[i] = random(0, width);
    YCoord[i] = random(0, height);
    Color[i] = color(noise(XCoord[i] * 0.01, YCoord[i] * 0.01) * 255,
                     noise(XCoord[i] * 0.01 + 1000, YCoord[i] * 0.01) * 255,
                     noise(XCoord[i] * 0.01 + 2000, YCoord[i] * 0.01) * 255);
  }
  
  background(0);
  noStroke();
}

void draw()
{

  for (int i = 0; i < XCoord.length; i++)
  {
    fill(Color[i]);
    circle(XCoord[i], YCoord[i], sin(radians(millis() * 0.01)));
    
    angle = radians(noise(XCoord[i] * 0.01, YCoord[i] * 0.01) * 720);
    
    XCoord[i] += sin(angle);
    YCoord[i] += cos(angle);
    
    if (XCoord[i] < 0 || YCoord[i] < 0 || XCoord[i] > width || YCoord[i] > height)
    {
      XCoord[i] = random(0, width);
      YCoord[i] = random(0, height);
      Color[i] = color(noise(XCoord[i] * 0.01, YCoord[i] * 0.01) * 255,
                       noise(XCoord[i] * 0.01 + 1000, YCoord[i] * 0.01) * 255,
                       noise(XCoord[i] * 0.01 + 2000, YCoord[i] * 0.01) * 255);
    }
  }
}
