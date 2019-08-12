//init; test; update
for(int i = 0 ; i <400; i++){
  
  //gradación de color y posicion en x
  noStroke();
  fill(i);
  rect(i,50,1,50);
  
  //posicion  en x y tamaño
  fill(0);
  rect(i,150,1,i/5);
  
   //posicion  en x usando sin(i)
  fill(0);
  rect(i,300+ sin(i*0.1)*50,1,6);
  
}
