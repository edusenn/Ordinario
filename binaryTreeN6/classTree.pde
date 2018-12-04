class Tree {
  //Atributos
  Node [] myNodes; //Declarando Array de nodos
  //Constructor
  Tree(Node n) {
    myNodes = new Node[1];
    myNodes[0] = n;
  }
  //Métodos
  String checkSide(Node n, int val) {
    String res;
    if (val >= int(n.value)) {
      res = "left";
    } else {
      res = "right";
    }
    return res;
  }
  boolean checkEmpty(Node n, String side) {
    boolean empty = false;
    if (side == "left") {
      if (n.left == null) {
        empty = true;
      }
    }
    if (side == "right") {
      if (n.right == null) {
        empty = true;
      }
    }
    return empty;
  }
  void addLeftChild(Node n) {
    n.left = str(myNodes.length);
  }
  void addRightChild(Node n) {

    n.right = str(myNodes.length);
  }
  void createNode(Node n, int val){
    String lado;
    lado = checkSide(n, val);
    if(lado == "left"){
      boolean vacio;
      vacio = checkEmpty(n, lado);
      if(vacio == true){
        addLeftChild(n);
        Node nuevo;
        nuevo = new Node(myNodes.length,int(n.id),val);
        myNodes = (Node []) append(myNodes, nuevo);
      }
      else{
        createNode(myNodes[int(n.left)],val);
      }
    }
    if(lado == "right"){
      boolean vacio;
      vacio = checkEmpty(n, lado);
      if(vacio == true){
        addRightChild(n);
        Node nuevo;
        nuevo = new Node(myNodes.length,int(n.id),val);
        myNodes = (Node []) append(myNodes, nuevo);
      }
      else{
        createNode(myNodes[int(n.right)],val);
      }
    }
  }

  void printData(int i) {
    println(arbolito.myNodes[i].id);
    println(arbolito.myNodes[i].parent);
    println(arbolito.myNodes[i].value);
    println(arbolito.myNodes[i].left);
    println(arbolito.myNodes[i].right);
    println(arbolito.myNodes[i].orden);    
    println(arbolito.myNodes[i].izquierda);   
    println(arbolito.myNodes[i].derecha);
  }
void acomodar(Node n){
if (n.left != null){                 //Hijo izquierdo
    if (n.izquierda == true){        //orden izquierda
       if (n.orden == false){        //revisar orden
       Ordenar(n);
       }
  } else {
  aIzquierda(n);
  }
} else {
n.izquierda=true;
}

if (n.orden==false){     //empieza a ordenar
   Ordenar(n);
}
if (n.right == null){    //revisa hijos a la derecha
 n.derecha=true;
 irArriba(n);
} 
  if(n.derecha==false){          // revisa a la derecha
   aDerecha(n); 
  }
  if(n.parent!=null){ 
   irArriba(n); 
  } 

} 

void aIzquierda(Node n){
  n.izquierda=true;
acomodar(myNodes[int(n.left)]);
}

void aDerecha(Node n){
  n.derecha=true;
acomodar(myNodes[int(n.right)]);
}

void Ordenar(Node n){
  Orde[posicion]=int (n.value);
  n.orden= true;
  posicion++;
}

void irArriba(Node n){
 acomodar(myNodes[int(n.parent)]);
}
}
