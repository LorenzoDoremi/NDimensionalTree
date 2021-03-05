
Store x;
NDimensionalTree xTree = new NDimensionalTree();
int[] count = {0, 0, 0};
int[] iteractions = {0};
boolean start = true;
int[] bounds =  {550, 600, 0, 600, -1000, 1000};
Store[] pointList = new Store[10];
void setup() {

  size(800, 600, FX2D);


  for (int i = 0; i < pointList.length; i++) {
    int[] randPos = {(int)random(0, 800), (int)random(0, 600), (int)random(-1000, 1000)};
    pointList[i] = new Store(randPos, (int)random(10, 30), (int)random(0, 600) );
  }
  
  xTree.insert(pointList);
}

void draw() {
  
 
  background(0);
  readTree(ArrayList<Store> answer, int[] bounds, Integer omitKey);
  text(frameRate, 100, 100);
  //println(iteractions[0]);
  iteractions[0] = 0;
  /*
  for(int i = 0; i < pointList.length; i++) {
    int[] b = {
    pointList[i].values[0]-300,
    pointList[i].values[0]+300,
    pointList[i].values[1]-300,
    pointList[i].values[1]+300,
    pointList[i].values[2]-300,
    pointList[i].values[2]+300,
    };
    */
   // xTree.readTree(iteractions, b, pointList[i].key);
  }
}

void mouse() {

  bounds[0] = mouseX - 100;
  bounds[1] = mouseX + 100;
  bounds[2] = mouseY - 100;
  bounds[3] = mouseY + 100;
}
