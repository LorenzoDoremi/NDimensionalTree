class Node {


  int[] values;
  int depth = 0;
  NDimensionalTree tree = new NDimensionalTree();
  int coor; // monodimensional coordinate
  Node left, right;
  Store store;

  public Node(int[] values) {
    this.values = values;
  }

  public Node(int value) {
    this.coor = value;
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

    ellipse(values[0], values[1], 20/(1+depth), 20/(1+depth));
    popStyle();
    //tree.read(tree.root);
  }


  void draw(int coor) {
   ellipse(coor, coor, 20,20);
 } 
  void draw(int[] counter) {
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
      fill(255, 255, 255);    // Does not execute
      break;
    default:             // 
      println("None");   // 
      break;
    }
    ellipse(values[0], values[1], 20/(1+depth), 20/(1+depth));
    //tree.read(tree.root, counter);
  }
}
