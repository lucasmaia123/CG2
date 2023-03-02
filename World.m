classdef World < handle
  properties
    objects = [];
    camera_R = [1 0 0 0;
                0 1 0 0;
                0 0 1 0;
                0 0 0 1
                ];
    camera_T = [1 0 0 0;
                0 1 0 0;
                0 0 1 0;
                0 0 0 1;
                ];
  endproperties

  methods

    function self = World() % Inicializa a classe
    endfunction

    function add_object(self, obj) % Adiciona um objeto no mundo
      if isempty(self.objects)
        self.objects = obj;
      else
        ind = length(self.objects);
        self.objects(ind+1) = obj;
      endif
    endfunction

    function reset(self) % Restora as configurações padrões
      self.objects = [];
      self.camera_R = [1 0 0 0;
                       0 1 0 0;
                       0 0 1 0;
                       0 0 0 1;
                       ];
      self.camera_T = [1 0 0 0;
                       0 1 0 0;
                       0 0 1 0;
                       0 0 0 1;
                       ];
    endfunction

    function camera_view(self, eye, at, tipo) % Transforma o mundo para a perspectiva da câmera
      if strcmp(tipo, 'classica')
        [v, up, n] = gera_camera(eye, at); % Gera as coordenadas da camera
      elseif strcmp(tipo, 'angular')
        [v, up, n, eye] = gera_camera_angular(eye, at);
      endif
      self.camera_R = [v(1) v(2) v(3) 0;
                    up(1) up(2) up(3) 0;
                    n(1) n(2) n(3) 0;
                    0 0 0 1;
                    ]; % Rotaciona a base do mundo até coincidir com a camera
      self.camera_T = [1 0 0 -eye(1);
                    0 1 0 -eye(2);
                    0 0 1 -eye(3);
                    0 0 0 1;
                    ]; % Move a origem do mundo para a camera (ou move os objetos para que fiquem com
                       % distância equivalente a da camera para a origem)
      self.update();
    endfunction

    function update(self, obj) % atualiza os objetos projetados em relação à câmera
      for i=1:length(self.objects)
        self.objects(i).v_proj = self.camera_R*self.camera_T*self.objects(i).vertices;
        self.objects(i).origem_proj = self.camera_R*self.camera_T*self.objects(i).origem;
      endfor
    endfunction

    function plota_mundo(self, d) % Desenha o mundo com a câmera padrão Octave/Matlab
      for i = 1:length(self.objects)
        plota_arestas3d(self.objects(i).vertices, self.objects(i).arestas)
      end
      view(3);
      axis([-d d -d d -d d], "square");
    endfunction

    function plota_mundo_proj(self, tipo) % Desenha o mundo com a câmera transformada
      if tipo == 3
        for i = 1:length(self.objects)
            plota_arestas3d(self.objects(i).v_proj, self.objects(i).arestas)
        endfor
        view(2);
        axis([-10 10 -10 10 -19 1], "square");
      endif
      if tipo == 2
        for i = 1:length(self.objects)
            if self.objects(i).render
              plota_arestas2d(self.objects(i).v_proj, self.objects(i).arestas, 'b-');
            endif
        endfor
        view(2);
        axis([-1 1 -1 1], "square");
      endif
    endfunction

    function proj_mundo(self, alfa, ratio) % Realiza a projeção dos objetos na câmera
      d = cotd(alfa/2); % Distância da camera para a tela
      T = [d/ratio 0 0 0;
           0 d 0 0;
           0 0 0 0;
           0 0 0 0;
           ]; % Matriz de projeção sem o near/far
      for i = 1:length(self.objects)
          self.objects(i).render = false;
          origem = self.objects(i).origem_proj;
          % Checa se o objeto está no eixo z da camera
          if origem(3) < -d && origem(3) > -20 % distância de visão
              % Checa se o objeto está no eixo y da camera
              if origem(2) <= -origem(3)/d && origem(2) >= origem(3)/d
                  % Checa se o objeto está no eixo x da camera
                  if origem(1) <= -origem(3)*ratio/d && origem(1) >= origem(3)*ratio/d
                      self.objects(i).render = true;
                      for j = 1:length(self.objects(i).v_proj) % z = profundidade de cada vertice
                          z = self.objects(i).v_proj(3, j) * -1;
                          self.objects(i).v_proj(:,j) = (T/z)*self.objects(i).v_proj(:,j);
                      endfor
                  endif
              endif
          endif
      endfor
    endfunction
  endmethods
endclassdef
