class NDimensionalTree {
  Node root;
  int height = 0;
  NDimensionalTree() {
  }
  NDimensionalTree(Node node) {
    this.root = node;
  }

  // classic insert but recursive in multiple dimensions
  void insert(Store[] stores) {
    for (int i = 0; i < stores.length; i++) {
      insert(stores[i], 0);
    }
  }

  // classic insert but recursive in multiple dimensions
  void insert(Store node, int index) {

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
  // insert core function
  void insertCase(Store node, Node curr, int index) {


    // go right
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
    // go left
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
    // nest inside the same node
    else {

      if (index < node.values.length -1) {

        int newindex = index+1;

        curr.tree.insert(node, newindex);
      } else {

        /** EDIT LAST FILL WITH STORE KEY **/
        curr.right = new Node(node.values[index]);
        curr.right.store = node;
      }
    }
  }

  // handy void function to read parts of the tree
  // interactions is used to keep track of how optimized the tree is
  // bounds is the range of coords you want
  // omitKey is used if you want to omit a store from its neighbors
  // (example if you need neighboring store in a store's range
  void readTree(ArrayList<Store> answer, int[] bounds, Integer omitKey) {

    read(root, bounds, answer, 0,  omitKey);
  }



  // find clouds of nodes inside a bound. bound.length must be double the coords number
  void read(Node curr, int[] bounds, ArrayList<Store> answer, int depth, Integer omitKey) {
    
    // check the left branch
    if (curr.left !=null && curr.coor > bounds[0 + 2*depth]) {
      if (depth == 2) { 
      
      }
      read(curr.left, bounds, answer, depth, omitKey);
    }
    // check the right branch
    if (curr.right != null && curr.coor < bounds[1 + 2*depth]) {


      read(curr.right, bounds, answer, depth, omitKey );
    }
    // check the sub-tree of the node
    if (curr.tree.root != null

      && curr.coor >  bounds[0 + 2*depth]
      && curr.coor <  bounds[1 + 2*depth]
      && curr.store == null ) {

      read(curr.tree.root, bounds, answer, depth + 1, omitKey);
    }
    // draw only the last depth level
    if (curr.store != null &&
      curr.coor >  bounds[0 + 2*depth]
      && curr.coor <  bounds[1 + 2*depth]
      ) {

      if(omitKey == null || omitKey != curr.store.key)
      curr.store.draw();
      answer.push(curr.store);
      }
      
   
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





// search for a single store with determined key and coords
  boolean search(int[] coords, int key) {



    return  src(root, coords, key, 0);
  }

   boolean src(Node curr, int[] coords, int key, int depth) {

    if (curr!=null && curr.store != null && curr.store.key == key) {
      print("vero");
      return true;
    } else {
      if (curr != null && 
        depth == coords.length -1) {
        return src(curr.right, coords, key, depth);
      }
      // down a depth level
      else if (curr != null &&
        curr.coor == coords[depth]) {
        return src(curr.tree.root, coords, key, depth+1);
        // go left
      } else if ( curr != null && curr.left != null && coords[depth] < curr.coor) {
        return src(curr.left, coords, key, depth);
      } else if ( curr != null && curr.right != null && coords[depth] > curr.coor) {
        return src(curr.right, coords, key, depth);
      }
      print("end");
      return false;
    }
  }
}
