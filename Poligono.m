classdef Poligono < handle
  properties
    tipo = 0;
    origem = 0;
    vertices = [];
    arestas = [];
    v_proj = [];
    origem_proj = 0;
    render = true;
  end

  methods
      function p = Poligono(tipo, origem, vertices, arestas)
      p.tipo = tipo;
      p.vertices = vertices;
      p.arestas = arestas;
      p.v_proj = vertices;
      p.origem_proj = origem;
      p.Translacao(origem);
      p.origem = origem;
    end

    function p = Escala(p, fatores)
      T = [fatores(1) 0 0 0; 0 fatores(2) 0 0; 0 0 fatores(3) 0; 0 0 0 1];
      p.vertices = T*p.vertices;
      p.v_proj = T*p.v_proj;
    end

    function p = Translacao(p, deslocamento)
      T = [1 0 0 deslocamento(1); 0 1 0 deslocamento(2); 0 0 1 deslocamento(3); 0 0 0 1];
      p.vertices = T*p.vertices;
      p.origem = T*p.origem;
      p.v_proj = T*p.v_proj;
      p.origem_proj = T*p.origem_proj;
    end

    function [x, y, z] = move_to_center(p)
      x = sum(p.vertices(1,:))/length(p.vertices);
      y = sum(p.vertices(2,:))/length(p.vertices);
      z = sum(p.vertices(3,:))/length(p.vertices);
      p.Translacao([-x -y -z]);
    end

    function p = Rotacao(p, eixo, angulo)
      if eixo == 'z'
        T = [cosd(angulo) -sind(angulo) 0 0; sind(angulo) cosd(angulo) 0 0; 0 0 1 0; 0 0 0 1];
      else if eixo == 'y'
        T = [cosd(angulo) 0 -sind(angulo) 0; 0 1 0 0; sind(angulo) 0 cosd(angulo) 0; 0 0 0 1];
      else if eixo == 'x'
        T = [1 0 0 0; 0 cosd(angulo) -sind(angulo) 0; 0 sind(angulo) cosd(angulo) 0; 0 0 0 1];
      end
      end
      end
      [x, y, z] = p.move_to_center();
      p.vertices = T*p.vertices;
      p.v_proj = T*p.v_proj;
      p.Translacao([x y z]);
    end
  end
end
