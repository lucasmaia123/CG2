function plota_arestas2d(Vertices, Arestas, cor)
    hold on;
    for i = 1:length(Arestas)
        plot(Vertices(1,Arestas(i,:)), Vertices(2,Arestas(i,:)), cor)
    end
    xlabel('x');
    ylabel('y');
end

