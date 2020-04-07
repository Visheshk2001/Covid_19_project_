PImage coronavirus;
float offset = 0;
float easing = 0.05;

int X= 550;
int Y= 550;

PVector location;  // Location of shape
PVector velocity;  // Velocity of shape
PVector gravity;   // Gravity acts at the shape's acceleration


void setup(){
size(800,800);
  coronavirus = loadImage("coronavirus.jpg"); 
  
  location = new PVector(100,100);
  velocity = new PVector(1.5,2.1);
  gravity = new PVector(0,0.2);

}



void draw()
{
  image( coronavirus, 200, 200);  
  float dx = (mouseX- coronavirus.width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image( coronavirus, offset, 0);
   // Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  // Bounce off edges
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if (location.y > height) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.95; 
    location.y = height;
  }

  // Display circle at location vector
  stroke(255);
  strokeWeight(2);
  fill(127);
  ellipse(location.x,location.y,48,48);
}
