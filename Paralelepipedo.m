function paralel = Paralelepipedo(largura, prof, altura, origem)
  l = largura/2;
  a = altura/2;
  p = prof/2;
  paralel = [-l -p -a 1;
      l -p -a 1;
      l -p a 1;
      -l -p a 1;
      -l p -a 1;
      l p -a 1;
      l p a 1;
      -l p a 1;
      ];
  paralel = paralel';
  arestas_paralel = [1 2; 2 3; 3 4; 4 1; 1 5; 5 6; 6 2; 6 7; 7 3; 7 8; 8 4; 8 5];
  faces_paralel = {[1 2 3 4]; [1 2 6 5]; [2 3 7 6]; [3 4 8 7]; [4 1 5 8]; [5 6 7 8]};
  paralel = Poligono('paralelepipedo', origem', paralel, arestas_paralel, faces_paralel);
end

