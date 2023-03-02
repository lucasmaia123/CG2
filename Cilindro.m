function cilindro = Cilindro(raio, altura, passos, origem)
  % Gera o cilindro como uma concatenação de retangulos
  passo = 2*pi/passos;
  angulo = 0;
  cilindro = [];
  arestas_cilindro = [];
  faces_cilindro = {};
  for i=1:2:2*passos+2
    cilindro = [cilindro; raio*sin(angulo) raio*cos(angulo) -altura/2 1];
    cilindro = [cilindro; raio*sin(angulo) raio*cos(angulo) altura/2 1];
    if (i > 1)
      arestas_cilindro = [arestas_cilindro; i i+1; i-2 i; i-1 i+1];
      faces_cilindro = [faces_cilindro; [i-2 i-1 i+1 i]];
    else
      arestas_cilindro = [arestas_cilindro; i i+1];
    end
    angulo = angulo + passo;
  end
  f1 = [];
  f2 = [];
  for i=1:passos
    if rem(i,2) == 0
      f1 = [f1 i];
    else
      f2 = [f2 i];
    endif
  endfor
  faces_cilindro = [faces_cilindro; f1; f2];
  cilindro = cilindro';
  cilindro = Poligono('cilindro', origem', cilindro, arestas_cilindro, faces_cilindro);
end
