class Tree {
  Node root;
  int height = 0;
  Tree() {
  }
  Tree(Node node) {
    this.root = node;
  }


  void insert(Node node, int index) {

    if (root == null) {
      height++;
      root = new Node(node.values[index]);

      if (index < node.values.length -1) {
        int newindex = index+1;

        root.tree.insert(node, newindex);
      } else {

        root.store = node;
      }
    } else {

      insertCase(node, root, index);
    }
  }

  void insertCase(Node node, Node curr, int index) {


    // vado a destra 
    if (node.values[index] > curr.coor) {

      if (curr.right == null) {

        curr.right = new Node(node.values[index]);

        // creo un nuovo livello
        if (index < node.values.length -1) {
          int newindex = index+1;
          height++;

          curr.right.tree.insert(node, newindex);
        } else {

          curr.right.store = node;
        }
      } else insertCase(node, curr.right, index);
    } 
    // vado a sinistra
    else if (node.values[index] < curr.coor) {
      if (curr.left == null) {

        curr.left = new Node(node.values[index]);

        // creo un nuovo livello
        if (index < node.values.length -1) {
          int newindex = index+1;
          height++;

          curr.left.tree.insert(node, newindex);
        } else {
          curr.left.store = node;
        }
      } else insertCase(node, curr.left, index);
    } 
    // creo nuovo livello
    else {

      if (index < node.values.length -1) {
        int newindex = index+1;

        curr.tree.insert(node, newindex);
      } else {
        curr.right = new Node(node.values[index]);
        curr.right.store = node;
      }
    }
  }

  // handy void function
  void readTree(int[] interactions, int[] bounds) {

    read(root, bounds, interactions, 0);
  }




  void read(Node curr, int[] bounds, int[] interactions, int depth) {
    interactions[0]++;
    // check the left branch
    if (curr.left !=null && curr.coor > bounds[0 + 2*depth]) {

      read(curr.left, bounds, interactions, depth);
    }
    // check the right branch
    if (curr.right != null && curr.coor < bounds[1 + 2*depth]) {

      if (bounds[1+2*depth] < curr.right.coor) {
      }
      read(curr.right, bounds, interactions, depth );
    }

    // draw the last depth level
    if (curr.store != null) {


      curr.store.draw();
    } 
    // check the sub-tree of the node
    if (curr.tree.root != null

      && curr.coor >  bounds[0 + 2*depth]
      && curr.coor <  bounds[1 + 2*depth]) {

      read(curr.tree.root, bounds, interactions, depth + 1);
    }
  }


  // function to check if there are errors in the tree
  void check(Node curr) {

    if (curr!= null && curr.left != null) {

      check(curr.left);
      if ( curr.left.coor > curr.coor) {
        println("error");
      }
    }
    if (curr!= null && curr.right != null) {
      check(curr.right);
      if ( curr.right.coor < curr.coor) {
        println("error");
      }
    }
  }






  boolean search(int[] coords) {



    return  src(root, coords, 0);
  }

  boolean src(Node curr, int[] coords, int depth) {

    if(curr.coor == coords[depth]) {
      }
   
    return false;
  }
}
