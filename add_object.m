function world = add_object(objeto, world)
  if isempty(world)
    world = objeto;
  else
    ind = length(world);
    world(ind+1) = objeto;
  end
end