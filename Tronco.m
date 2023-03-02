function tronco = Tronco(base_i, base_s, altura, origem)
  bi = base_i/2;
  bs = base_s/2;
  a = altura/2;
  tronco = [-bi -bi -a 1;
      bi -bi -a 1;
      bi bi -a 1;
      -bi bi -a 1;
      -bs -bs a 1;
      bs -bs a 1;
      bs bs a 1;
      -bs bs a 1;
      ];
  tronco = tronco';
  arestas_tronco = [1 2; 2 3; 3 4; 4 1; 1 5; 5 6; 6 2; 6 7; 7 3; 7 8; 8 4; 8 5];
  faces_tronco = {[1 2 3 4]; [1 2 6 5]; [2 3 7 6]; [3 4 8 7]; [4 1 5 8]; [5 6 7 8]};
  tronco = Poligono('tronco', origem', tronco, arestas_tronco, faces_tronco);
end
