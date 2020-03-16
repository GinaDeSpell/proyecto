class Box {
  Body drop;      

  float w,h;

  Box(float x, float y) {
    w = 16;
    h = 16;

    // Construyendo el cuerpo
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    drop = box2d.createBody(bd);


    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(1); //cae en una fila pero no va pa'rriba
    float box2dH = box2d.scalarPixelsToWorld(h/2); //cae hacia abajo
    sd.setAsBox(box2dW, box2dH); 
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    fd.density = 1;
    fd.friction = 10;
    fd.restitution = 0.5;

    drop.createFixture(fd);    
    drop.setLinearVelocity(new Vec2(random(-25,25),random(-20,-20)));
    drop.setAngularVelocity(random(-4,4));
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(drop);    
    float a = drop.getAngle();

    //Estas son las gotitas c:
    pushMatrix();
    translate(pos.x,pos.y);   
    rotate(-a);
    fill(#1FFFF2);
    stroke(#4750F2);
    ellipseMode(CENTER);
    ellipse(0,0,w,h);
    popMatrix();
    
    pushMatrix();
    translate(pos.x+20,pos.y-10);   
    rotate(-a);              
    fill(#1FFFF2);
    stroke(#4750F2);
    ellipseMode(CENTER);
    ellipse(0,0,w,h);
    popMatrix();
    
    pushMatrix();
    translate(pos.x+40,pos.y+5);   
    rotate(-a);              
    fill(#1FFFF2);
    stroke(#4750F2);
    ellipseMode(CENTER);
    ellipse(0,0,w,h);
    popMatrix();
    
    pushMatrix();
    translate(pos.x-20,pos.y);   
    rotate(-a);              
    fill(#1FFFF2);
    stroke(#4750F2);
    ellipseMode(CENTER);
    ellipse(0,0,w,h);
    popMatrix();
    
    pushMatrix();
    translate(pos.x-40,pos.y-5);   
    rotate(-a);              
    fill(#1FFFF2);
    stroke(#4750F2);
    ellipseMode(CENTER);
    ellipse(0,0,w,h);
    popMatrix();
    
    pushMatrix();
    translate(pos.x-60,pos.y+10);   
    rotate(-a);              
    fill(#1FFFF2);
    stroke(#4750F2);
    ellipseMode(CENTER);
    ellipse(0,0,w,h);
    popMatrix();
    
    pushMatrix();
    translate(pos.x+60,pos.y);   
    rotate(-a);              
    fill(#1FFFF2);
    stroke(#4750F2);
    ellipseMode(CENTER);
    ellipse(0,0,w,h);
    popMatrix();
  }

}
