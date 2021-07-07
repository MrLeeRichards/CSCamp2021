FloatList missileX;
FloatList missileY;

FloatList asteroidX;
FloatList asteroidY;

int score = 0;
int health = 50;

void setup() {
  size(640,480,P2D);
  smooth(4);
  
  //Set up missile list;
  missileX = new FloatList();
  missileY = new FloatList();
  
  //Set up asteroid list;
  asteroidX = new FloatList();
  asteroidY = new FloatList();
  
  //Create 5 asteroids
  for (int i = 0; i <= 20; i++)
  {
    asteroidX.append(random(5, width - 5));
    asteroidY.append(random(-height, -5));
  }
}

void draw() {
  //Clear last frame
  background(0);
  
  //Draw ship
  fill(255);
  noStroke();
  rect(mouseX - 10, height - 30, 20, 25, 10, 10, 0, 0);
  
  //Draw missiles
  strokeWeight(5);
  strokeCap(ROUND);
  stroke(255,100,0);
  for (int counter = 0; counter < missileX.size(); counter++)
  {
    missileY.sub(counter, 3);
    line(missileX.get(counter), missileY.get(counter), missileX.get(counter), missileY.get(counter) + 10);
  }
  
  //Remove missiles that have gone past the end of the screen
  for (int counter = missileX.size() - 1; counter >= 0; counter--)
  {
    if (missileY.get(counter) < -10)
    {
      missileX.remove(counter);
      missileY.remove(counter);
    }
  }
  
  //Draw asteroids
  noStroke();
  fill(100,100,100);
  for (int counter = 0; counter < asteroidX.size(); counter++) {
    asteroidY.add(counter, 3);
    circle(asteroidX.get(counter), asteroidY.get(counter), 20);
  }
  
  //Remove missiles and asteroids that are colliding
  boolean deleteMissile = false;
  for (int m_counter = missileX.size() - 1; m_counter >= 0; m_counter--)
  {
    deleteMissile = false;
    
    for (int a_counter = asteroidX.size() - 1; a_counter >= 0; a_counter--)
    {
      // If distance between missile and asteroid is 10 or less, remove them
      if (dist(missileX.get(m_counter), missileY.get(m_counter), asteroidX.get(a_counter), asteroidY.get(a_counter)) <= 10)
      {
        deleteMissile = true;
        
        asteroidX.set(a_counter, random(5, width - 5));
        asteroidY.set(a_counter, random(-height, -5));
      }
    }
    
    if (deleteMissile)
    {
      missileX.remove(m_counter);
      missileY.remove(m_counter);
      
      score += 10;
    }
  }
  
  // Remove asteroids that hit ship
  for (int a_counter = asteroidX.size() - 1; a_counter >= 0; a_counter--)
  {
    if (dist(mouseX, height - 10, asteroidX.get(a_counter), asteroidY.get(a_counter)) <= 20)
    {
      asteroidX.set(a_counter, random(5, width - 5));
      asteroidY.set(a_counter, random(-height, -5));
      health -= 5;
    }  
  }
 
  //Reset asteroids that have gone past the end of the screne
  for (int counter = asteroidX.size() - 1; counter >= 0; counter--)
  {
     if (asteroidY.get(counter) > height)
     {
       asteroidX.set(counter, random(5, width - 5));
       asteroidY.set(counter, random(-height, -5));
     }
  }
  
  fill(0,100,255);
  textSize(32);
  text("Score: " + score, 0, 32);
  text("Health: " + health, width - 300, 32);
}

void mouseClicked() {
  missileX.append(mouseX);
  missileY.append(height - 30);
}
