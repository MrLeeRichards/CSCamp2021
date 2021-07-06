float radius = 10;
float ballX = radius;
float ballY = radius;

float Xdirection = 2;
float Ydirection = 2;

float paddleWidth = 60;
float paddleHeight = 10;

int score = 0;

void setup()
{
  size(640, 480);
  noStroke();
  changeColor();
  textSize(32);
}

void draw()
{
  background(0);
  circle(ballX, ballY, radius * 2);
  text("Score: " + score,0,32);
  ballX = ballX + Xdirection;
  ballY = ballY + Ydirection;
  
  
  //Ball bouncing
  if (ballX >= width - radius)
  {
    Xdirection = -Xdirection;
    changeColor();
  }
  
  if (ballX <= radius)
  {
    Xdirection = -Xdirection;
    changeColor();
  }
  
  if (ballY <= radius)
  {
    Ydirection = -Ydirection;
    changeColor();
  }
  
  //Paddle
  rect(mouseX - paddleWidth / 2, height - paddleHeight, paddleWidth, paddleHeight);
  
  
  //Hits the paddle
  if (ballY + radius >= height - paddleHeight 
      && ballX >= mouseX - paddleWidth / 2
      && ballX <= mouseX + paddleWidth / 2)
  {
    Ydirection = -Ydirection;
    changeColor();
    
    score = score + 10;
    Xdirection = Xdirection * 1.3;
    Ydirection = Ydirection * 1.3;
  }
}

void changeColor()
{
  fill(random(0,255), random(0,255), random(0,255));
}
