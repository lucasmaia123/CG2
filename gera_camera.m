function [v, up, n] = gera_camera(origem, at)
    look_at = origem - at; % Pega o vetor que aponta da camera para o ponto de interesse,
                           % note que por padrão a camera inicia no eixo z,
                           % logo este será o nosso novo z
    n = look_at/sqrt(look_at*look_at'); % Normaliza o vetor

    % Vamos gerar um vetor 'up', ele deve estar apontando diretamente para cima na perspectiva da camera,
    % caso contrário, a imagem sera projetada de forma rotacionada
    % (O sentido de cima do mundo deve ter o mesmo sentido na perspectiva da camera)
    if n(1) == 0 && n(2) == 0
        up = [0 n(3) 0];
    else
        % Gera um vetor de altura ortonormal (Por padrão a camera inicializa no eixo z,
        % mas, no Matlab o eixo z é usado como altura ao invez do y, logo
        % o up equivalente nesta perspectiva é [0 0 1] ou z normal)
        % e o subtrai da projeção que ele faz com o n(novo sentido da base),
        % isso o ajustará para ser o up apropriado para a base.
        aux = [0 0 1];
        proj = (aux*n'/(n*n'))*n;
        up = aux - proj;
    end
    up = up/sqrt(up*up');
    v = cross(up, n); % Gera o novo 'x' apartir do produto vetorial do novo 'y' e 'z'
    v = v/sqrt(v*v');
end
