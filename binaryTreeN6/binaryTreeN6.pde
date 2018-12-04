int [] x = {4,12,9,23,6,91,2,54,37,6,1,5,78,87,25};
int [] Orde;
int posicion;
Node root; //Declarando nodo
Tree arbolito;
void setup(){ 
  posicion = 0; 
  Orde = new int [x.length];
  root = new Node(x[0]); //Inicializar nodo
  arbolito = new Tree(root);
println(x);
println("-----------");
  for(int i = 1; i < x.length; i++){         // Construir arbol
    arbolito.createNode(arbolito.myNodes[0], x[i]);
  }
    arbolito.acomodar(arbolito.myNodes[0]);   // Ordenar numeros de "x" 
  println(Orde);
}
void draw(){
}
