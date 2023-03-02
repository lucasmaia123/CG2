function plota_arestas2d(Vertices, Arestas, cor)
    % Adapata a função de plotagem 2d do matlab para funcionar com a nossa estrutura de dados
    hold on;
    for i = 1:length(Arestas)
        plot(Vertices(1,Arestas(i,:)), Vertices(2,Arestas(i,:)), cor)
    end
    xlabel('x');
    ylabel('y');
end

