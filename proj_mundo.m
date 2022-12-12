function world = proj_mundo(alfa, ratio, world)
    d = cotd(alfa/2);
    for i = 1:length(world)
        world(i).render = false;
        origem = world(i).origem_proj;
        %Checa se o objeto está no eixo z da camera
        if origem(3) < -d && origem(3) > -20
            %Checa se o objeto está no eixo y da camera
            if origem(2) <= -origem(3)/d && origem(2) >= origem(3)/d
                %Checa se o objeto está no eixo x da camera
                if origem(1) <= -origem(3)*ratio/d && origem(1) >= origem(3)*ratio/d
                    world(i).render = true;
                    for j = 1:length(world(i).v_proj)
                        z = world(i).v_proj(3, j) * -1;
                        T = [d/(ratio*z) 0 0 0;
                            0 d/z 0 0;
                            0 0 0 d;
                            0 0 0 1;
                            ];
                        world(i).v_proj(:,j) = T*world(i).v_proj(:,j);
                    end
                end
            end
        end
    end
end

