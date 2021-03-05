class Store {
  
   int[] values;
  int depth = 0;
  int key;
  
  
  public Store(int[] values, int key, Object element) {
    this.values = values;
    this.key =  key;
  }
  
  
   void draw() {
    // print(depth);
    pushStyle();
    switch(depth) {
    case 0: 
      fill(255, 0, 0);  
      break;
    case 1: 
      fill(0, 255, 0);   // Does not execute
      break;
    case 2: 
      fill(0, 0, 255);    // Does not execute
      break;
    default:             // 
      println("None");   // 
      break;
    }

    ellipse(values[0], values[1], key,key);
    popStyle();
    //tree.read(tree.root);
  }




}
