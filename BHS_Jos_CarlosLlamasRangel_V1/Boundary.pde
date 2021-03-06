// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A fixed boundary class

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  float g;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_,float g_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    g = g_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
     Vec2 pos = box2d.getBodyPixelCoord(b);
      float a = b.getAngle();
     pushMatrix();
    translate(pos.x, pos.y);
     rotate(-a);
    fill(10);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    image(hoz, -60, 0);
  hoz.resize(267, 150);
    popMatrix();
  }
  
  void position()
{
  if (keyPressed) {

    println(key);

    if(key == 'z' || key == 'Z'){
     g = g+.1;  
    }
    else if(key == 'x' || key == 'X'){
      g = g-.1;  
    }
  }
    
    b.setTransform(box2d.coordPixelsToWorld(mouseX,mouseY), g);
    // width and height are same as values given to targetBox when it's created
    
}

}