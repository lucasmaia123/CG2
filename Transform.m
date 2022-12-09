function object = Transform(tipo, ind, fatores, world)
    if ind == 0
        if tipo == 1
            for i = 1:length(world)
                world(i).Escala(fatores)
            else if tipo == 2
                

