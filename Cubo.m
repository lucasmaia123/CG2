function cubo = Cubo(base, origem)
  b = base/2;
  cubo = [-b -b -b 1;
      b -b -b 1;
      b b -b 1;
      -b b -b 1;
      -b -b b 1;
      b -b b 1;
      b b b 1;
      -b b b 1;
      ];
  cubo = cubo';
  arestas_cubo = [1 2; 2 3; 3 4; 4 1; 1 5; 5 6; 6 2; 6 7; 7 3; 7 8; 8 4; 8 5];
  faces_cubo = {[1 2 3 4]; [1 2 6 5]; [2 3 7 6]; [3 4 8 7]; [4 1 5 8]; [5 6 7 8]};
  cubo = Poligono('cubo', origem', cubo, arestas_cubo, faces_cubo);
end
