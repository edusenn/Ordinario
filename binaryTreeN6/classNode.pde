class Node {
  //Atributos
  String id;
  String parent;
  String value;
  String left;
  String right;
  boolean orden;
  boolean izquierda;
  boolean derecha;
  //Constructor para un nodo raíz
  Node(int v) {
    id = "0";
    parent = null;
    value = str(v);
    left = null;
    right = null;   
    orden = false; 
    izquierda = false;
    derecha = false;
  }
  //Constructor para nodo rama

  Node(int i, int p, int v) {
    id = str(i);
    parent = str(p);
    value = str(v);
    left = null;
    right = null;
    orden = false;
    izquierda = false;
    derecha = false;
  }
  //Métodos
}
