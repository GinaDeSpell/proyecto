import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
ArrayList <Box> boxes;
int pantalla = 0;
PImage fondo;
PImage belinda1;
PImage belinda2;
Box2DProcessing box2d;    

void setup(){
   size (400,700);
   
   smooth();
   //creando el mundo
   box2d = new Box2DProcessing(this);  
   box2d.createWorld();
   boxes = new ArrayList<Box>();
   
   background(255);
   fondo = loadImage ("fondo.jpg");
   fondo.resize(500,800);
   belinda1 = loadImage ("belinda1.png");
   belinda1.resize(184,104);
   belinda2 = loadImage ("belinda2.png");
   belinda2.resize(183,104);
}

void draw() {
  image(fondo, 200, 400);
  box2d.step();  
  if(pantalla == 0){
    background (#F56CFF);
    textSize(45);
    fill(0);
    text("La nube Belinda", 25,300);
    textSize(30);
    fill(0);
    text("PRESIONA A!", 100,350);
    if (key == 'a' || key == 'A'){
      pantalla = 1;
    }
  } 
  if(pantalla == 1){
    if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
    }
    for (Box b: boxes) {
    b.display();
    }
    fill(255);
    rect(20,10,150,30);
    textSize (15);
    fill(0);
    text("Para jugar, haz clic", 25,30);
    imageMode(CENTER);
    pushMatrix();
    image(belinda1,mouseX,mouseY);
    popMatrix();
    if (mousePressed) {
      image(belinda2,mouseX,mouseY);
    }   
  }
}
