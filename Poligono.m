classdef Poligono < handle
  properties
    tipo = 0; % Tipo de poligono
    origem = 0; % Centro do objeto
    vertices = []; % Lista dos vertices
    arestas = []; % Pares de vertices que formam arestas
    faces = []; % Conjuntos de vertices que formam faces
    v_proj = []; % Lista dos vertices na perspectiva da camera
    origem_proj = 0; % Centro do poligono na perspectiva da camera
    render = true; % O poligono precisa ser desenhado? (Usado para otimização da camera)
  end

  methods
      % Inicializa os parametros do poligono
      function p = Poligono(tipo, origem, vertices, arestas, faces)
      p.tipo = tipo;
      p.vertices = vertices;
      p.arestas = arestas;
      p.faces = faces;
      p.v_proj = vertices;
      p.origem_proj = origem;
      p.Translacao(origem);
      p.origem = origem;
    end

    % Leva o poligono para a origem e aplica a transformação de escala
    function p = Escala(p, fatores)
      T = [fatores(1) 0 0 0; 0 fatores(2) 0 0; 0 0 fatores(3) 0; 0 0 0 1];
      [x, y, z] = p.move_to_center();
      p.vertices = T*p.vertices;
      p.v_proj = T*p.v_proj;
      p.Translacao([x, y, z]);
    end

    % Transformação de translação
    function p = Translacao(p, deslocamento)
      T = [1 0 0 deslocamento(1); 0 1 0 deslocamento(2); 0 0 1 deslocamento(3); 0 0 0 1];
      p.vertices = T*p.vertices;
      p.origem = T*p.origem;
      p.v_proj = T*p.v_proj;
      p.origem_proj = T*p.origem_proj;
    end

    % Move o poligono para a origem
    function [x, y, z] = move_to_center(p)
      x = sum(p.vertices(1,:))/length(p.vertices);
      y = sum(p.vertices(2,:))/length(p.vertices);
      z = sum(p.vertices(3,:))/length(p.vertices);
      p.Translacao([-x -y -z]);
    end

    % Leva o poligono para a origem e aplica a transformação de rotação
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
