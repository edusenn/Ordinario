

class Population {

  float mutationRate;           
  DNA[] poblacion;             
  ArrayList<DNA> matingPool;    
  String objetivo;                
  int generations;              
  boolean finished;            
  int perfectScore;

  Population(String p, float m, int num) {
    objetivo = p;
    mutationRate = m;
    poblacion = new DNA[num];
    for (int i = 0; i < poblacion.length; i++) {
      poblacion[i] = new DNA(objetivo.length());
    }
    calcFitness();
    matingPool = new ArrayList<DNA>();
    finished = false;
    generations = 0;
    
    perfectScore = 1;
  }

  
  void calcFitness() {
    for (int i = 0; i < poblacion.length; i++) {
      poblacion[i].fitness(objetivo);
    }
  }

  
  void naturalSelection() {
    
    matingPool.clear();

    float maxFitness = 0;
    for (int i = 0; i < poblacion.length; i++) {
      if (poblacion[i].fitness > maxFitness) {
        maxFitness = poblacion[i].fitness;
      }
    }

    
    for (int i = 0; i < poblacion.length; i++) {
      
      float fitness = map(poblacion[i].fitness,0,maxFitness,0,1);
      int n = int(fitness * 100);  
      for (int j = 0; j < n; j++) {              
        matingPool.add(poblacion[i]);
      }
    }
  }

 
  void generate() {
   
    for (int i = 0; i < poblacion.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);
      DNA child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      poblacion[i] = child;
    }
    generations++;
  }


  
  String getBest() {
    float worldrecord = 0.0;
    int index = 0;
    for (int i = 0; i < poblacion.length; i++) {
      if (poblacion[i].fitness > worldrecord) {
        index = i;
        worldrecord = poblacion[i].fitness;
      }
    }
    
    if (worldrecord == perfectScore ) finished = true;
    return poblacion[index].getPhrase();
  }

  boolean finished() {
    return finished;
  }

  int getGenerations() {
    return generations;
  }

  
  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < poblacion.length; i++) {
      total += poblacion[i].fitness;
    }
    return total / (poblacion.length);
  }

  String allPhrases() {
    String everything = "";
    
    int displayLimit = min(poblacion.length,50);
    
    
    for (int i = 0; i < displayLimit; i++) {
      everything += poblacion[i].getPhrase() + "\n";
    }
    return everything;
  }
}
