float r1 = 800;
float r2 = 600;
float r3 = 1000;
float r4 = 800;
int x1 = -500;
int y1 = -500;

int x2 = 1000+100;
int y2 = -200;

int x3 = -500;
int y3 = 1000+200;

int x4 = 1000+400;
int y4 = 1000+400;


void setup() {
  size(1000, 1000);
  noSmooth();
  background(10);
  

  drawHeatMap();

  stroke(150, 50, 50);
  strokeWeight(4);
  noFill();
  ellipse(x1, y1, r1*2, r1*2);
  ellipse(x2, y2, r2*2, r2*2);
  ellipse(x3, y3, r3*2, r3*2);
  ellipse(x4, y4, r4*2, r4*2);
}

float avg_dist(int x, int y) {
  
  float dist1 = abs ( dist(x, y, x1, y1) - r1);
  float dist2 = abs ( dist(x, y, x2, y2) - r2);
  float dist3 = abs ( dist(x, y, x3, y3) - r3);
  float dist4 = abs ( dist(x, y, x4, y4) - r4);
  
  return (dist1+dist2+dist3+dist4)/4;
}
float pt[][] = new float[1000][1000];
void drawHeatMap() {
  
  float max = 0;
  float min = 1000;
  int mx=0,my=0;
  for (int x =0; x< width; x++) {
    for (int y = 0; y< height; y++) {
      pt[x][y] = avg_dist(x, y);
      if(pt[x][y] > max) max = pt[x][y];
      if(pt[x][y] < min) {
        min = pt[x][y];
        mx = x;
        my = y;
      }
    }
  }
  println( "min = " + min);
  println("max = " +max);
  for (int x =0; x< width; x++) {
    for (int y = 0; y< height; y++) {
      
      color c = lerpColor(0xffff7f00, 0xff7f00ff, map( pt[x][y], min, max-260, 0,1.0) );
      stroke( c );
      point(x, y);
    }
  }
  fill(240);
  stroke(250);
  ellipse(mx,my,10,10);
  text(pt[mx] [my], mx,my);
}

void mouseClicked() {
  stroke(250);
  point(mouseX,mouseY);
  fill(250);
  text(pt[mouseX] [mouseY], mouseX,mouseY);
  println (pt[mouseX] [mouseY]);
}

void draw() {
}
