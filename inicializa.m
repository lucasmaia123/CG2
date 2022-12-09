world = [];

while true
    clc
    sprintf("1 - Desenhar poligono\n2 - Transformar poligono\n3 - Transformar câmera\n4 - projeção em perspectiva\n5 - Plotar mundo\n6 - Resetar espaço\n7 - Sair")
    x = input("Selecione uma opção: ");
    switch x
        case 1
            clc
            sprintf("1 - Desenhar cubo\n2 - Desenhar paralelepipedo\n3 - Desenhar pirâmide\n4 - Desenhar tronco\n5 - Desenhar cilindro\n6 - Voltar")
            y = input("Selecione uma opção: ");
            switch y
                case 1
                    base = input("Digite a base do cubo: ");
                    origem = input("Digite as coordenadas do cubo: ");
                    if length(origem) == 3
                        origem = [origem 1];
                    end
                    world = add_object(Cubo(base, origem), world);
                case 2
                    base_h = input("Digite a base horizontal: ");
                    base_v = input("Digite a base vertical: ");
                    altura = input("Digite a altura: ");
                    origem = input("Digite as coordenadas do paralelepipedo: ");
                    if length(origem) == 3
                        origem = [origem 1];
                    end
                    world = add_object(Paralelepipedo(base_h, base_v, altura, origem), world);
                case 3
                    base = input("Digite a base da piramide: ");
                    altura = input("Digite a altura da piramide: ");
                    origem = input("Digite as coordenadas da piramide: ");
                    if length(origem) == 3
                        origem = [origem 1];
                    end
                    world = add_object(Piramide(base, altura, origem), world);
                case 4
                    base_i = input("Digite a base inferior: ");
                    base_s = input("Digite a base superior: ");
                    altura = input("Digite a altura: ");
                    origem = input("Digite as coordenadas do tronco: ");
                    if length(origem) == 3
                        origem = [origem 1];
                    end
                    world = add_object(Tronco(base_i, base_s, altura, origem), world);
                case 5
                    raio = input("Digite o raio do cilindro: ");
                    altura = input("Digite a altura do cilindro: ");
                    passos = input("Digite a numero de lados da base: ");
                    origem = input("Digite as coordenadas do cilindro: ");
                    if length(origem) == 3
                        origem = [origem 1];
                    end
                    world = add_object(Cilindro(raio, altura, passos, origem), world);
                otherwise
                    continue;
            end
        case 2
            clc
            for i = 1:length(world)
                disp([num2str(i) ' - tipo: ' world(i).tipo ', origem: ' num2str(world(i).origem(:)).'])
            end
            y = input("Digite o indice do poligono a ser transformado\nDigite 0 para transformar todos os poligonos: ");
            sprintf("1 - Escala\n2 - Translação\n3 - Rotação\n4 - Voltar\n")
            z = input("Selecione o tipo de transformação: ");
            switch z
                case 1
                    fator = input("Digite o fator de escala ([x y z]): ");
                    if y == 0
                        for i = 1:length(world)
                            world(i) = world(i).Escala(fator);
                        end
                    else
                        world(y) = world(y).Escala(fator);
                    end
                case 2
                    desl = input("Digite o vetor de deslocamento ([x y z]): ");
                    if y == 0
                        for i = 1:length(world)
                            world(i) = world(i).Translacao(desl);
                        end
                    else
                        world(y) = world(y).Translacao(desl);
                    end
                case 3
                    eixo = input("Digite o eixo de rotação ('x', 'y' ou 'z'): ");
                    ang = input("Digite quanto deve ser rotacionado em graus: ");
                    if y == 0
                        for i = 1:length(world)
                            world(i) = world(i).Rotacao(eixo, ang);
                        end
                    else
                        world(y) = world(y).Rotacao(eixo, ang);
                    end
                otherwise
                    continue;
            end
        case 3
            eye = input("Digite as coordenadas da câmera([x, y(profundidade), z(altura)]: ");
            at = input("Digite as coordenadas do ponto em que a câmera está apontada: ");
            world = camera_view(eye, at, world);
            plota_mundo_proj(world, 3);
        case 4
            eye = input("Digite as coordenadas da câmera([x, y(profundidade), z(altura)]: ");
            at = input("Digite as coordenadas do ponto em que a câmera está apontada: ");
            world = camera_view(eye, at, world);
            world = proj_mundo(90, 1, world);
            plota_mundo_proj(world, 2);
        case 5
            plota_mundo(world, 10);
        case 6
            world = [];
            input("Mundo resetado!");
        otherwise
            break;
    end
end