function plota_arestas3D(Vertices, Arestas)
    hold on;
    for i=1:length(Arestas)
        plot3(Vertices(1,Arestas(i,:)), Vertices(2,Arestas(i,:)), Vertices(3,Arestas(i,:)), 'b-')
    end
    view(-35,30);
    axis([-5 5 -5 5 -5 5], "equal");
end

function world = add_object(objeto, world)
  ind = length(world);
  if ind == 0
    world = objeto;
  else
    world(ind+1) = objeto;
  end
end

function plota_mundo(world)
  for i = 1:length(world)
    plota_arestas3D(world(i).vertices, world(i).arestas)
  end
end

function cubo = Cubo(base, origem)
  cubo = origem;
  cubo = [cubo; origem(1)+base origem(2) origem(3)];
  cubo = [cubo; origem(1)+base origem(2)+base origem(3)];
  cubo = [cubo; origem(1) origem(2)+base origem(3)];
  cubo = [cubo; origem(1) origem(2) origem(3)+base];
  cubo = [cubo; origem(1)+base origem(2) origem(3)+base];
  cubo = [cubo; origem(1)+base origem(2)+base origem(3)+base];
  cubo = [cubo; origem(1) origem(2)+base origem(3)+base];
  cubo = cubo';
  arestas_cubo = [1 2; 2 3; 3 4; 4 1; 1 5; 5 6; 6 2; 6 7; 7 3; 7 8; 8 4; 8 5];
  cubo = Poligono('cubo', cubo, arestas_cubo)
end

function paralel = Paralelepipedo(largura, altura, prof, origem)
  paralel = origem;
  paralel = [paralel; origem(1)+largura origem(2) origem(3)];
  paralel = [paralel; origem(1)+largura origem(2) origem(3)+altura];
  paralel = [paralel; origem(1) origem(2) origem(3)+altura];
  paralel = [paralel; origem(1) origem(2)+prof origem(3)];
  paralel = [paralel; origem(1)+largura origem(2)+prof origem(3)];
  paralel = [paralel; origem(1)+largura origem(2)+prof origem(3)+altura];
  paralel = [paralel; origem(1) origem(2)+prof origem(3)+altura];
  paralel = paralel';
  arestas_paralel = [1 2; 2 3; 3 4; 4 1; 1 5; 5 6; 6 2; 6 7; 7 3; 7 8; 8 4; 8 5];
  paralel = Poligono('paralelepipedo', paralel, arestas_paralel)
end

function piramide = Piramide(base, altura, origem)
  piramide = origem;
  piramide = [piramide; origem(1)+base origem(2) origem(3)];
  piramide = [piramide; origem(1)+base origem(2)+base origem(3)];
  piramide = [piramide; origem(1) origem(2)+base origem(3)];
  piramide = [piramide; origem(1)+(base/2) origem(2)+(base/2) origem(3)+altura];
  piramide = piramide';
  arestas_piramide = [1 2; 2 3; 3 4; 4 1; 1 5; 2 5; 3 5; 4 5];
  piramide = Poligono('piramide', piramide, arestas_piramide)
end

function tronco = Tronco(base_i, base_s, altura, origem)
  tronco = origem;
  tronco = [tronco; origem(1)+base_i origem(2) origem(3)];
  tronco = [tronco; origem(1)+base_i origem(2)+base_i origem(3)];
  tronco = [tronco; origem(1) origem(2)+base_i origem(3)];
  tronco = [tronco; origem(1)+((base_i-base_s)/2) origem(2)+((base_i-base_s)/2) origem(3)+altura];
  tronco = [tronco; origem(1)+((base_i+base_s)/2) origem(2)+((base_i-base_s)/2) origem(3)+altura];
  tronco = [tronco; origem(1)+((base_i+base_s)/2) origem(2)+((base_i+base_s)/2) origem(3)+altura];
  tronco = [tronco; origem(1)+((base_i-base_s)/2) origem(2)+((base_i+base_s)/2) origem(3)+altura];
  tronco = tronco';
  arestas_tronco = [1 2; 2 3; 3 4; 4 1; 1 5; 5 6; 6 2; 6 7; 7 3; 7 8; 8 4; 8 5];
  tronco = Poligono('tronco', tronco, arestas_tronco)
end

function cilindro = Cilindro(raio, altura, passos, origem)
  passo = 2*pi/passos;
  angulo = 0;
  cilindro = [];
  arestas_cilindro = [];
  for i=1:2:2*passos+2
    cilindro = [cilindro; origem(1)+raio*sin(angulo) origem(2)+raio*cos(angulo) origem(3)];
    cilindro = [cilindro; origem(1)+raio*sin(angulo) origem(2)+raio*cos(angulo) origem(3)+altura];
    if (i > 1)
      arestas_cilindro = [arestas_cilindro; i i+1; i-2 i; i-1 i+1];
    else
      arestas_cilindro = [arestas_cilindro; i i+1];
    endif
    angulo = angulo + passo;
  endfor
  cilindro = cilindro';
  cilindro = Poligono('cilindro', cilindro, arestas_cilindro)
    end
  end
end