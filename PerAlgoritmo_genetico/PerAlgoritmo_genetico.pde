
String objetivo;
int mxp;
float mutacion;
Population POP;

void setup() {
  size(420, 120);
  objetivo = "1640914/1633500";
  mxp = 150;
  mutacion = 0.01;


  POP = new Population(objetivo, mutacion, mxp);
}

void draw() {

  POP.naturalSelection();

  POP.generate();

  POP.calcFitness();
  Informacion();


  if (POP.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

void Informacion() {
  background(255);
  String respuesta = POP.getBest();
  textFont(createFont("Arial", 32, true));
  textAlign(LEFT);
  fill(0);
  textSize(40);
  text(respuesta, 20, 80);
}
