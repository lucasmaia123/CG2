function piramide = Piramide(base, altura, origem)
  b = base/2;
  a = altura/2;
  piramide = [-b -b -a 1;
      b -b -a 1;
      b b -a 1;
      -b b -a 1;
      0 0 a 1];
  piramide = piramide';
  arestas_piramide = [1 2; 2 3; 3 4; 4 1; 1 5; 2 5; 3 5; 4 5];
  faces_piramide = {[1 2 3 4]; [1 2 5]; [2 3 5]; [3 4 5]; [4 1 5]};
  piramide = Poligono('piramide', origem', piramide, arestas_piramide, faces_piramide);
end
