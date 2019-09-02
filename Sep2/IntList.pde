IntList foo;
foo = new IntList();

for(int i = 0; i<28; i++){
  foo.append(i);
}

foo.shuffle();

for(int i = 0; i<28; i++){
  println(foo.get(i));
}
