function world = camera_view(eye, at, world)
    [v, up, n] = gera_camera(eye, at);
    R = [v(1) v(2) v(3) 0;
        up(1) up(2) up(3) 0;
        n(1) n(2) n(3) 0;
        0 0 0 1;
        ];
    T = [1 0 0 -eye(1);
        0 1 0 -eye(2);
        0 0 1 -eye(3);
        0 0 0 1;
        ];
    for i = 1:length(world)
        world(i).v_proj = R*T*world(i).vertices;
        world(i).origem_proj = R*T*world(i).origem;
    end
end

