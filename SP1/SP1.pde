int [] numbers = {1, 2, 3, 4};
int circleSize  =  44;
int r  =  1;
int g  =  1;
int b  =  1;


void setup(){
size(400,400);

}

void draw(){
background(127);
if (mouseX == width || mouseY == height ){
  
} else if (mouseX == 0 || mouseY == 0){
  
}
fill(r, g, b);
circle(mouseX, mouseY, circleSize);

}
