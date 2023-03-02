function [v, up, n, eye] = gera_camera_angular(distancia, ang)
  look_at = [0 distancia 0];
  look_at = look_at * [1 0 0; 0 cosd(ang(1)) -1*sind(ang(1)); 0 sind(ang(1)) cosd(ang(1))];
  look_at = look_at * [cosd(ang(2)) -1*sind(ang(2)) 0; sind(ang(2)) cosd(ang(2)) 0; 0 0 1];
  eye = look_at;
  n = look_at/sqrt(look_at*look_at');
  if n(1) == 0 && n(2) == 0
    up = [0 n(3) 0];
  else
    aux = [0 0 1];
    proj = (aux*n')/(n*n')*n;
    up = aux - proj;
  endif
  up = up/sqrt(up*up');
  v = cross(up, n);
  v = v/(v*v');
endfunction
