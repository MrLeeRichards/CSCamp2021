StringList suspectColors;
StringList suspectShapes;
StringList suspectStatements;

String[] possibleColors = {"red", "green", "blue"};
String[] possibleShapes = {"circle", "square", "triangle"};

int liarNumber;
String liarColor;
String liarShape;

void setup()
{
  size(800, 800);
  
  suspectColors = new StringList();
  suspectShapes = new StringList();
  suspectStatements = new StringList();
  
  // Pick suspect colors
  for (int i = 0; i < possibleColors.length; i++)
  {
    suspectColors.append(possibleColors[i]);
  }
  suspectColors.append(possibleColors[int(random(possibleColors.length))]);
  suspectColors.shuffle();
  
  // Pick suspect shape
  for (int i = 0; i < possibleShapes.length; i++)
  {
    suspectShapes.append(possibleShapes[i]);
  }
  suspectShapes.append(possibleShapes[int(random(possibleShapes.length))]);
  suspectShapes.shuffle();
  
  //Pick the liar
  liarNumber = int(random(4));
  liarColor = suspectColors.get(liarNumber);
  liarShape = suspectShapes.get(liarNumber);
  
  //Create suspect statements
  for (int i = 0; i < 4; i++)
  {
    suspectStatements.append(createStatement(i != liarNumber));
  }
}

void draw()
{
  background(0);
  
  for (int i = 0; i < 4; i++)
  {
    if (suspectColors.get(i).equals("red"))
    {
      fill(255,0,0);
    }
    else if (suspectColors.get(i).equals("green"))
    {
      fill(0,255,0);
    }
    else
    {
      fill(0,0,255);
    }
    
    if (suspectShapes.get(i).equals("circle"))
    {
      circle(100, i * 200 + 100, 180);
    }
    else if (suspectShapes.get(i).equals("square"))
    {
      rect(10, i * 200 + 10, 180, 180);
    }
    else
    {
      beginShape();
      vertex(10, i * 200 + 190);
      vertex(190, i * 200 + 190);
      vertex(100, i * 200 + 10);
      endShape();
    }
    
    fill(255);
    textSize(48);
    text(suspectStatements.get(i), 210, i * 200 + 124);
  }
}

String createStatement(boolean isTruth)
{
  String statement;
  
  if (random(1) > .5) //Flip a coin
  {
    statement = possibleColors[int(random(possibleColors.length))];
    
    if ((isTruth && liarColor.equals(statement)) || (!isTruth && !liarColor.equals(statement)))
    {
      statement = "The liar is " + statement;
    }
    else
    {
      statement = "The liar is not " + statement;
    }
  }
  else
  {
    statement = possibleShapes[int(random(possibleShapes.length))];
    
    if ((isTruth && liarShape.equals(statement)) || (!isTruth && !liarShape.equals(statement)))
    {
      statement = "The liar is a " + statement;
    }
    else
    {
      statement = "The liar is not a " + statement;
    }
  }
  
  return statement;
}
