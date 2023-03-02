function plota_arestas3d(Vertices, Arestas)
    % Adapata a função de plotagem 3d do matlab para funcionar com a nossa estrutura de dados
    hold on;
    for i=1:length(Arestas)
        plot3(Vertices(1,Arestas(i,:)), Vertices(2,Arestas(i,:)), Vertices(3,Arestas(i,:)), 'b-')
    end
    xlabel('x');
    ylabel('y');
    zlabel('z');
end
