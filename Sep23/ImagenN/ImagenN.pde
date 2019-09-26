PImage gato;
PImage mascara;
PImage gatoMeme;
PImage gatoRecorte;

void setup(){
  size(970,450);
  //cargar las imágenes;
  gato = loadImage("gato.jpg");
  gatoMeme = loadImage("gatomeme.jpg");
  mascara = loadImage("mascara.tif");
  
  //modificar el tamaño del PImage
  //gato.resize(400,400);
  
  //recortar una parte de la imagen y almacenarla en un PImage
  gatoRecorte = gato.get(200,200,300,200);
  
  //mascara de recorte
  //gato.mask(mascara);
  
  //filtro
  //gato.filter(BLUR,5);
  
  //blends
  //gato.blend(gatoMeme,0,0,gato.width,gato.height,0,0,gatoMeme.width,gatoMeme.height,BURN);

}

void draw(){
  background(0);
  //dibujar la imagen
  image(gato,0,0);
  
}

void keyPressed(){
  saveFrame();
}
