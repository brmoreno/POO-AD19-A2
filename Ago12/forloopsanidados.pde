size(400,400);
background(255);

for(int i = 0; i<400; i+=10){
  for(int j= 0; j<400; j+=10){
    
    //degradado vertical
    //fill(i);
    
    //degradado horizontal
    //fill(j);
    
    //degradado diegonal
    //fill((i+j)*0.4);
    
    //tablero de ajedrez 
    //if(((i+j)/10)%2==0){
    //  fill(0);
    //}
    //else{
    //  fill(255);
    //}
    
    //aleatorio
    //fill(random(255));
    
    //ruido de perlin
    //fill(noise(i*0.01,j*0.01)*255);
    rect(i,j,10,10);
  }
}
