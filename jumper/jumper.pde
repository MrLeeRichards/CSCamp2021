float jumpHeight = 0.0;
float jumpSpeed = 0.0;
float fallSpeed = .25;

float characterHeight = 20;
float characterWidth = 15;

int jumpCount = 3;

int score = 0;

float obstacleWidth;
float obstacleHeight;
float obstacleDistance;

boolean cleared = true;

void setup()
{
  size(640, 480);
  noStroke();
  resetObstacle();
}

void draw()
{
  background(0);
  
  //draw ground
  fill(0, 100, 50);
  rect(0, height * .75, width, height);
  
  //Calculate gravity
  jumpHeight = max(jumpHeight + jumpSpeed, 0.0);
  if (jumpHeight == 0.0)
  {
    jumpSpeed = 0.0;
    jumpCount = 3; //Reset jump count when on the ground
  }
  else
  {
    jumpSpeed -= fallSpeed;
  }
  
  //check if character is touching obstacle
  if (height * .75 - jumpHeight > height * .75 - obstacleHeight
      && (obstacleDistance < width * .25 && width * .25 < obstacleDistance + obstacleWidth))
  {
    fill(255,0,0);
    score = 0;
    cleared = false;
  }
  else
  {
    fill(0,255,255);
  }
  
  rect(width * .25, height * .75 - characterHeight - jumpHeight, characterWidth, characterHeight);
  
  //move obstacle
  obstacleDistance -= 5;
  
  //draw obstacle
  fill(255, 50, 0);
  rect(obstacleDistance, height * .75 - obstacleHeight, obstacleWidth, obstacleHeight, 10, 10, 0, 0);
  
  //Check if obstacle has passed the screen
  if (obstacleDistance + obstacleWidth < 0)
  {
    resetObstacle();
  }
  
  //Display score
  fill(255,0,100);
  textSize(16);
  text("Score: " + score, 0, 16);
}

void keyPressed()
{
  if (jumpCount > 0)
  {
    jumpSpeed = 6;
    jumpCount--;
  }
}

void resetObstacle()
{
  obstacleDistance = width;
  
  obstacleHeight = random(10,160);
  obstacleWidth = 200 - obstacleHeight;
  
  if (cleared)
  {
    score += 5;
  }
  
  cleared = true;
}
