PVector location;
PVector velocity;
PVector radius;
PVector newLocation;

void setup()
{
  fullScreen();
  background(0);
}

void draw()
{
  strokeWeight(1);
  drawLines();
}

void drawLines()
{
  PVector location = new PVector(width/2, height/2);
  PVector velocity = new PVector (random(-1, 1), random(-1, 1));

  velocity.normalize();
  PVector radius = PVector.mult(velocity, random(50, 60));

  location.add(radius);
  PVector newLocation = PVector.add(location, velocity);

  for (int i = 0; i < 260; i++) 
  {
    float location1 = random(130, 250);
    float location2 = random(-5, 10);

    if (i > location1 || i < location2) 
    {
      stroke(random(0,60), 208, 232, 30);
    } 
    
    else stroke(random(220, 255), 30);
    line(location.x, location.y, newLocation.x, newLocation.y);
    location = newLocation.get();

    if (i > 200 ) 
    {
      velocity.rotate(random(-0.3, 0.3));
    } 
    
    else velocity.rotate(random(-0.04, 0.04));
    newLocation.add(velocity);
  }
}

void keyReleased()
{
 if(key == ' ')
 {
   fullScreen();
   filter(INVERT);
 }
}