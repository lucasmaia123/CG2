function world = camera_view(eye, at, world)
    [v, up, n] = gera_camera(eye, at); % Gera as coordenadas da camera
    R = [v(1) v(2) v(3) 0;
        up(1) up(2) up(3) 0;
        n(1) n(2) n(3) 0;
        0 0 0 1;
        ]; % Rotaciona a base do mundo até coincidir com a camera
    T = [1 0 0 -eye(1);
        0 1 0 -eye(2);
        0 0 1 -eye(3);
        0 0 0 1;
        ]; % Move a origem do mundo para a camera (ou move os objetos para que fiquem com
           % distância equivalente a da camera para a origem
    for i = 1:length(world)
        world(i).v_proj = R*T*world(i).vertices;
        world(i).origem_proj = R*T*world(i).origem;
    end
end

