function plota_mundo_proj(world, tipo)
    if tipo == 3
        for i = 1:length(world)
            plota_arestas3d(world(i).v_proj, world(i).arestas)
        end
        axis([-10 10 -10 10 -19 1], "square");
    end
    if tipo == 2
        for i = 1:length(world)
            if world(i).render
                plota_arestas2d(world(i).v_proj, world(i).arestas)
            end
        end
        axis([-1 1 -1 1], "square");
    end
end

