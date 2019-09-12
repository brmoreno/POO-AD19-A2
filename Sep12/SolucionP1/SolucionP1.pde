 class Carta{
  int x;
  int y;
  int w;
  int h;
  char cualCartaEs;
  boolean laCartaEstaBocaArriba;
  boolean laCartaYaFueEncontrada;
  boolean estoySobreLaCarta;
  int posicion;
  
  Carta(int posicion_,  char cualCartaEs_){
    this.posicion = posicion_;
    this.cualCartaEs = cualCartaEs_;
    this.w = 50;
    this.h = 100;
    this.laCartaEstaBocaArriba = false;
    this.laCartaYaFueEncontrada = false;
    this.estoySobreLaCarta = false;
    this.x = posicion_ % 7*this.w;
    this.y = floor(posicion/7)*h;
  }
  
 private void display(){
    this.estoySobreLaCarta = this.sobreLaCarta();
    if(laCartaEstaBocaArriba){
      pushMatrix();
      translate(this.x,this.y);
      fill(255);
      stroke(0);
      rect(0,0,this.w,this.h);
      fill(255,0,0);
      text(cualCartaEs,25,50);
      popMatrix();
    }
    else{
      pushMatrix();
      translate(this.x,this.y);
      fill(0);
      stroke(255);
      rect(0,0,this.w,this.h);
      popMatrix();   
    }
  }
  
  boolean sobreLaCarta(){
    boolean resultado = false;
    if(mouseX>this.x&& mouseX<this.x+this.w && mouseY>this.y && mouseY <this.y+this.h){
      resultado = true;
    }
    return (resultado);
  }
  
  void rotarCarta(){
    laCartaEstaBocaArriba = !laCartaEstaBocaArriba;
  }
}

class Jugador{
  int puntos;
  
  Jugador(){
    this.puntos = 0;
  }
  
  void adivino(){
    this.puntos++;
  }  
}

class Partida{
  ArrayList <Carta> cartas;
  ArrayList <Jugador> jugadores;
  int turno; 
  int cartasVolteadas;
  char[] valoresCartasVolteadas = {'v','b'};
  Carta[] lasCartasVolteadas = new Carta[2];
  boolean todasEncontradas;
  
  Partida(){
    this.cartas = new ArrayList<Carta>();
    this.jugadores = new ArrayList<Jugador>();
    this.turno = 0;
    this.cartasVolteadas = 0;
    this.todasEncontradas = false;
    IntList orden = new IntList();
    
    for(int i = 0; i<28; i++){
      orden.append(i);
    }
    orden.shuffle();
    char[] losChars={'a','b','c','d','e','f','g','h','i','j','k','l','m','n'}; 
    for(int i = 0; i<28; i++){
      this.cartas.add(new Carta(orden.get(i),losChars[i%14]));
    }
    jugadores.add(new Jugador());
    jugadores.add(new Jugador()); 
  }
  
  void display(){
    for(Carta c:cartas){
      c.display();
    }
    fill(0);
    text("turno de Jugador " + (turno+1) ,0,420);
    text("puntos J1 " + jugadores.get(0).puntos,0,440);
    text("puntos J2 " + jugadores.get(1).puntos,0,460);
  }
  
  void rotarCartas(){
    for(Carta c:cartas){
      if(!c.laCartaEstaBocaArriba && !c.laCartaYaFueEncontrada && c.estoySobreLaCarta){
        c.rotarCarta();
        this.valoresCartasVolteadas[this.cartasVolteadas] = c.cualCartaEs;
        this.lasCartasVolteadas[this.cartasVolteadas] = c;
        this.cartasVolteadas++;
      }
    }
  }
  
  void evaluar(){
   if(jugadores.get(0).puntos + jugadores.get(1).puntos >13){
     todasEncontradas = true;
   }
    if(this.valoresCartasVolteadas[0] == this.valoresCartasVolteadas[1]){
      jugadores.get(this.turno).adivino();
      this.cartasVolteadas = 0;
      this.valoresCartasVolteadas[0] = '1';
      this.valoresCartasVolteadas[1] = '2';
      this.lasCartasVolteadas[0].laCartaYaFueEncontrada = true;
      this.lasCartasVolteadas[1].laCartaYaFueEncontrada = true;
    }
    else{
      this.turno++;
      if(this.turno>1){
        this.turno = 0;
      }
      this.cartasVolteadas = 0;
      this.valoresCartasVolteadas[0] = '1';
      this.valoresCartasVolteadas[1] = '2';
      this.lasCartasVolteadas[0].rotarCarta();
      this.lasCartasVolteadas[1].rotarCarta();
    }
  }
}

class Juego{
  int estado;
  Partida laPartida;
  
  Juego(){
    this.estado = 0;
  }
  
  void display(){
    fill(0);
    switch(estado){
      case 0:
        text("pantalla de inicio",200,100);
      break;
      case 1:
        text("pantalla de instrucciones",200,100);
      break;
      case 2:
        laPartida.display();
      break;
      case 3:
        String resultado = "";
        if (laPartida.jugadores.get(0).puntos >laPartida.jugadores.get(1).puntos ){
          resultado = "gano jugador 1";
        }
        else if (laPartida.jugadores.get(0).puntos < laPartida.jugadores.get(1).puntos ){
          resultado = "gano jugador 2";
        }
        else{
          resultado = "empate";
        }
        text(resultado,200,100);
      break;  
    }
  }
  
  void funcion(){
    switch(this.estado){
      case 0:
        this.estado++;
      break;
      case 1:
        laPartida = new Partida();
        this.estado++;
      break;
      case 2:
        if(laPartida.cartasVolteadas<2){
          laPartida.rotarCartas();
        }
        else{
          laPartida.evaluar();
        }
        if (laPartida.todasEncontradas){
          this.estado++;
        }
      break;
      case 3:
        this.estado = 0;
      break;      
    }
  }
}
Juego elJuego;

void setup(){
  size(600,600);
  elJuego = new Juego();
}

void draw(){
  background(255);
  elJuego.display();
}

void mousePressed(){
  elJuego.funcion();
}
