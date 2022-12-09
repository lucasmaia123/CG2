function plota_arestas3d(Vertices, Arestas)
    hold on;
    for i=1:length(Arestas)
        plot3(Vertices(1,Arestas(i,:)), Vertices(2,Arestas(i,:)), Vertices(3,Arestas(i,:)), 'b-')
    end
    view(2);
    xlabel('x');
    ylabel('y');
    zlabel('z');
end