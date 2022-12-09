function [v, up, n] = gera_camera(origem, at)
    look_at = origem - at;
    n = look_at/sqrt(look_at*look_at');
    if n(1) == 0 && n(2) == 0
        up = [0 n(3) 0];
    else
        aux = [0 0 1];
        proj = (aux*n'/(n*n'))*n;
        up = aux - proj;
    end
    up = up/sqrt(up*up');
    v = cross(up, n);
    v = v/sqrt(v*v');
end
