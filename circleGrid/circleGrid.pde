void setup()
{
  fullScreen();
  noStroke();
  noiseDetail(1,1);
}

void draw()
{
  background(0);
  for (int x = -20; x < width; x += 40)
  {
    for (int y = -20; y < height; y += 40)
    {
      fill(
        (noise(x * .01 + 300, y * .01 + 300, millis() * 0.0001) * 510) % 256,
        (noise(x * .01 + 100, y * .01 + 100, millis() * 0.0001) * 510) % 256,
        (noise(x * .01 + 200, y * .01 + 200, millis() * 0.0001) * 510) % 256);
      circle(x + noise(x * .005, y * .005, millis() * 0.0001) * 100, y + noise(x * .005, y * .005, millis() * 0.0001) * 100, noise(x * .01 + millis() * 0.0001, y * .01 + millis() * 0.001, millis() * 0.001) * 50);
    }
  }
}
