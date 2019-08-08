// declaro variables, indicando el tipo de datos que almacenan
int foo;
long bar;
float baz;
char qux;

// asigno valor a las variables 
foo = 255;
bar = 20000000;
baz = 45.45;
qux = 'c';

//imprime en la consola el valor de foo
print(foo);

//establece el tamaño de mi lienzo
size(400,400);

// establece el color de inicio del lienzo en RGB
background(240,50,126);

//color de relleno de la geometría 
fill(0,150,45,120);

//color de la linea de contorno
stroke(255);
//noFill();
//noStroke();

//ancho de la linea de contorno
strokeWeight(0.3);

//dibuja un rectángulo
rect(100,100,200,50);
fill(255);
noStroke();

//dibuja una elipse
ellipse(200,200,200,200);
stroke(0,255,0);
strokeWeight(5);

//dibuja una linea 
line(0,0,400,400);
noFill();

//dibuja una curva de bezier
bezier(0,200,400,200,45,89,400,200);
