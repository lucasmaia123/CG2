function plota_faces(Vertices, Faces)
  hold on;
  for i=1:length(Faces)
    fill3(Vertices(1, Faces{i}(:)), Vertices(2, Faces{i}(:)), Vertices(3, Faces{i}(:)), 'r')
  endfor
  xlabel('X')
  ylabel('Y')
  zlabel('Z')
endfunction
