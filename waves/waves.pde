float waveHeight;
float waveDistance;

void setup()
{
  fullScreen(P2D);
  blendMode(ADD);
  stroke(0,100,255);
  noFill();
  noiseDetail(3,.5);
  
  waveHeight = height * .15;
  waveDistance = width * .006;
}

void draw()
{
  background(0, 25, 50);
  
  for (float y = -waveHeight; y <= height; y += waveDistance)
  {
    beginShape();
    
    for (float x = -waveDistance; x <= width + waveDistance; x += waveDistance)
    {
      vertex(x, y + noise(x * 0.008, y * 0.008 - millis() * 0.0003, millis() * 0.0003) * waveHeight);
    }
    
    endShape();
  }
}
