function cilindro = Cilindro(raio, altura, passos, origem)
  passo = 2*pi/passos;
  angulo = 0;
  cilindro = [];
  arestas_cilindro = [];
  for i=1:2:2*passos+2
    cilindro = [cilindro; raio*sin(angulo) raio*cos(angulo) -altura/2 1];
    cilindro = [cilindro; raio*sin(angulo) raio*cos(angulo) altura/2 1];
    if (i > 1)
      arestas_cilindro = [arestas_cilindro; i i+1; i-2 i; i-1 i+1];
    else
      arestas_cilindro = [arestas_cilindro; i i+1];
    end
    angulo = angulo + passo;
  end
  cilindro = cilindro';
  cilindro = Poligono('cilindro', origem', cilindro, arestas_cilindro);
end