function plota_mundo(world, d) % Plota os objetos com a camera padrão do matlab
  for i = 1:length(world)
    plota_arestas3d(world(i).vertices, world(i).arestas)
  end
  axis([-d d -d d -d d], "square");
end
