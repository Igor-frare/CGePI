// Definir as variáveis para as páginas
int paginaInicial = 0 ;
int pagina1 = 1;
int pagina2 = 2;
int pagina3 = 3;
PFont font;
int tela;
int posicao_coluna;
int x = 0;
int y = 0;
int posicao_linha;
int vazio = 0;
int inicio = 0;
int click = 0;
int ganhador = 0;
int centro_x, centro_y;
int som = 0;
int tabuleiro[][] = { {vazio, vazio, vazio},
  {vazio, vazio, vazio},
  {vazio, vazio, vazio}
};



boolean Aparecer = false;
boolean jogoFinalizado = false;


// VARIAVEIS DO PLACAR
int placarJogador1 = 0;
int placarJogador2 = 0;


int vitoriasJogadorX = 0;
int vitoriasJogadorO = 0;


int melhor3 = 0;
int melhor5 = 2;

import processing.sound.*;
SoundFile file;
SoundFile file2;


void setup() {
  
  


    size(600, 600);
    exibirPaginaInicial();

    file = new SoundFile(this, "som1.mp3");
    file2 = new SoundFile(this, "som2.mp3");
 
  }


  void draw() {
    if (!jogoFinalizado) {
      // Verificar qual página deve ser exibida
      if (paginaInicial == pagina1) {
        exibirPagina1();
      } else if (paginaInicial == pagina2) {
        exibirPagina2();
      } else if (paginaInicial == pagina3) {
        exibirPagina3();
      } else if (paginaInicial == 0) {
        exibirPaginaInicial();
      }
    }
  }

  void exibirPaginaInicial() {
    // Criar a tela inicial
    tela  = 1;

    PImage b;
    b = loadImage("jog.velha.png");
    background(b);

    
    // Desenhar os botões
    fill(255);
    rect(100, 200, 100, 50);
    rect(400, 200, 100, 50);

    // Escrever o texto dos botões
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("CREDITOS", 150, 225);
    text("INICIO", 450, 225);
  }

  // Função para exibir a primeira página
  void exibirPagina1() {


    tela = 3;
    // coloca uma imagem de fundo no botão creditos
    PImage c;
    c = loadImage("pc.png");
    background(c);
    //background(0 , 0, 255);
    fill(0);
    textAlign(CENTER, CENTER);

    textSize(60);
    text("  Criadores ", 300, 50 );
    textSize(30);
    fill(0);



    textLeading(0);
    text("Igor Frare - 002202001075", 300, 120);

    textLeading(0);
    text("Jefferson Roberto S. Santos - 002202003952", 300, 150);
    

    textLeading(0);
    text(" Eloiza Viana Bazetto - 002202001983", 300, 180);
   




    float currentSize = 18;
    String currentText = "\n O Jogo da Velha é um jogo de estratégia simples e popular, \n jogado em um tabuleiro de 3x3. Dois jogadores se alternam para marcar espaços \n com \"X\" ou \"O\" e o objetivo é formar uma linha reta com suas marcas.";
    float currentWidth = textWidth(currentText);

    float targetWidth = 1000; // what width to we want the text to be?
    float ratio = targetWidth / currentWidth; // so how much bigger should the text be?
    currentSize *= ratio; // let's make it exactly that big

    textSize(currentSize);
    textAlign(CENTER, CENTER);
    text(currentText, 0, 0, width, height);

    rect(250, 400, 100, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
        fill(255);

    text("VOLTAR", 300, 420);
  }

  // Função para exibir a segunda página
  void exibirPagina2() {
    tela = 2;
    
    textAlign(CENTER, CENTER);
    textSize(30);
    


    if (Aparecer == false ) {

      background(255);
      Aparecer = true;
    }
    strokeWeight(5);
    //linhas que dão o formato do tabuleiro
    line(200, 0, 200, 800);
    line(400, 0, 400, 800);
    line(0, 200, 600, 200);
    line(0, 400, 600, 400);
    //define o tamanho das letras
    fill(0);

    // EXIBIR PLACAR
    fill(0);
    textSize(20);
    text("Placar:", 60, 20);
    text("Jogador 1 (O): " + placarJogador1, 80, 50);
    text("Jogador 2 (X): " + placarJogador2, 80, 80);

    verifica_ganhador();
    textSize(10);
    fill(0);
    //  text("A1",60,60);
    text("A2", 60, 260);
    text("A3", 60, 460);
    text("B1", 260, 60);
    text("B2", 260, 260);
    text("B3", 260, 460);
    text("C1", 460, 60);
    text("C2", 460, 260);
    text("C3", 460, 460);

    if (ganhador == 1) {
      background(0);
      noStroke();
      fill(255);
      textSize(10);
      text("O JOGADOR DA BOLINHA GANHOU!", mouseX, mouseY);
      jogoFinalizado = true;

      text("APERTE \"R\" PARA RECOMEÇAR OU F para finalizar", 300, 550);
    } else if (ganhador == 2) {
      background(0);
      noStroke();
      fill(255);
      textSize(10);
      text("O JOGADOR DO X GANHOU!", mouseX, mouseY);
      jogoFinalizado = true;

      text("APERTE \"R\" PARA RECOMEÇAR", 300, 550);
    } else if (click >= 9 && ganhador == 0) {
      background(0);
      noStroke();
      fill(255);
      textSize(10);
      text("DEU VELHA!!", mouseX, mouseY);


      jogoFinalizado = true;

      text("APERTE \"R\" PARA RECOMEÇAR", 300, 550);
    }
    if (melhor3 == 1) {
      if(inicio == 0){
        if (vitoriasJogadorX == 2) {
          text("Jogador X venceu a melhor de 3!", 300, 510);
          inicio = 1;
          
        } else if (vitoriasJogadorO == 2) {
          text("Jogador O venceu a melhor de 3!", 300, 510);
          inicio = 1;
        }
      }else {
        if (vitoriasJogadorX == 3) {
          text("Jogador X venceu a melhor de 5!", 300, 510);
          inicio = 1;
        }else if (vitoriasJogadorO == 3) {
          text("Jogador O venceu a melhor de 5!", 300, 510);
          inicio = 1;
        }
      }
      
    }

  }

  int pega_posicao_x_mouse() {
    if (mouseX >= 0 && mouseX < 200)
      posicao_coluna = 0;
    else if (mouseX >= 200 && mouseX < 400)
      posicao_coluna = 1;
    else if (mouseX >= 400 && mouseX <= 600)
      posicao_coluna = 2;

    return posicao_coluna;
  }

  int pega_posicao_y_mouse() {
    if (mouseY >= 0 && mouseY < 200)
      posicao_linha = 0;
    else if (mouseY >= 200 && mouseY < 400)
      posicao_linha = 1;
    else if (mouseY >= 400 && mouseY <= 600)
      posicao_linha = 2;



    return posicao_linha;
  }

  int verifica_ganhador() {
    // Linhas horizontais
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[i][0] != 0 && tabuleiro[i][0] == tabuleiro[i][1] && tabuleiro[i][0] == tabuleiro[i][2]) {
        ganhador = tabuleiro[i][0];
        break; // Encerre o loop assim que encontrar um ganhador
      }
    }

    // Linhas verticais
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[0][i] != 0 && tabuleiro[0][i] == tabuleiro[1][i] && tabuleiro[0][i] == tabuleiro[2][i]) {
        ganhador = tabuleiro[0][i];
        break; // Encerre o loop assim que encontrar um ganhador
      }
    }

    // Diagonal principal
    if (tabuleiro[0][0] != 0 && tabuleiro[0][0] == tabuleiro[1][1] && tabuleiro[0][0] == tabuleiro[2][2]) {
      ganhador = tabuleiro[0][0];
    }

    // Diagonal secundária
    if (tabuleiro[0][2] != 0 && tabuleiro[0][2] == tabuleiro[1][1] && tabuleiro[0][2] == tabuleiro[2][0]) {
      ganhador = tabuleiro[0][2];
    }

    if (melhor3 == 0) {
      if (ganhador == 1) {
        placarJogador1++; // Incrementa o placar do jogador 1
      } else if (ganhador == 2) {
        placarJogador2++; // Incrementa o placar do jogador 2
      }
    } else {
      if (ganhador == 1) {
        placarJogador1++; // Incrementa o placar do jogador 1
        vitoriasJogadorO++;
      } else if (ganhador == 2) {
        placarJogador2++; // Incrementa o placar do jogador 2
        vitoriasJogadorX++;
      }
    }
    
    textSize(20);

    return ganhador;
  }



  int verifica_x_centro(int posicao_x) {
    switch(posicao_x) {
    case 0:
      centro_x = 80;
      break;
    case 1:
      centro_x = 280;
      break;
    case 2:
      centro_x = 480;
      break;
    }

    return centro_x;
  }

  int verifica_y_centro(int posicao_y) {
    switch(posicao_y) {
    case 0:
      centro_y = 120;
      break;
    case 1:
      centro_y = 320;
      break;
    case 2:
      centro_y = 520;
      break;
    }

    return centro_y;
  }



  void exibirPagina3 () {

    if (Aparecer == true ) {

      background(255);
      Aparecer = false;
    }

    // Criar a tela MENU
    tela  = 4;
    PImage c;
    c = loadImage("menu.png");
    background(c);


    // Desenhar os botões
    fill(255);
    rect(100, 330, 100, 50);
    rect(400, 330, 100, 50);
    rect(250, 400, 100, 50);

    // Escrever o texto dos botões
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("UNITARIO", 150, 350);
    textSize(15);
    text("MELHOR DE 3", 450, 350);
    textSize(20);
    text("VOLTAR", 300, 420);
  }


  // Verificar se o botão foi clicado
  void mousePressed() {
    if (tela == 1) {
      if (mouseX > 100 && mouseX < 200 && mouseY > 200 && mouseY < 250) {
        paginaInicial = pagina1;
      } else if (mouseX > 400 && mouseX < 500 && mouseY > 200 && mouseY < 250) {
        paginaInicial = pagina3;
      }
    } else if (tela == 2) {
      posicao_coluna = pega_posicao_x_mouse();
      posicao_linha = pega_posicao_y_mouse();
      if (click % 2 == 0) {
        centro_x = verifica_x_centro(posicao_coluna);
        centro_y = verifica_y_centro(posicao_linha);
        //verifica se a posicao está vazia
        if (tabuleiro[posicao_coluna][posicao_linha] == 0) {
          fill(0);
          textSize(30);
          text("O", centro_x, centro_y);
          file2.play();
          tabuleiro [posicao_coluna][posicao_linha] = 1;
          click += 1;
        }
      } else if (click % 2 != 0) {
        centro_x = verifica_x_centro(posicao_coluna);
        centro_y = verifica_y_centro(posicao_linha);
        if (tabuleiro[posicao_coluna][posicao_linha] == 0) {
          fill(255, 0, 0);
          textSize(30);
          text("X", centro_x, centro_y);
          file.play();
          tabuleiro [posicao_coluna][posicao_linha] = 2;
          click += 1;
        }
      }
    }
    if (tela == 3) {
      if (mouseX >= 250 && mouseX <= 350 && mouseY >= 400 && mouseY <= 450) {
        paginaInicial = 0;

      }
    }
    if (tela == 4) {
      if (mouseX >= 250 && mouseX <= 350 && mouseY >= 400 && mouseY <= 450) {
        paginaInicial = 0;
      } else if (mouseX > 100 && mouseX < 200 && mouseY > 330 && mouseY < 380) {
        // Jogo unitario
        melhor3 = 0;
        paginaInicial = pagina2;
      } else if (mouseX > 400 && mouseX < 500 && mouseY > 330 && mouseY < 380) {
        // Melhor de 3
        melhor3 = 1;
        paginaInicial = pagina2;
      }
    }
  }
  void ReiniciarGame() {
    ganhador = 0;
    placarJogador1 = 0;
    placarJogador2 = 0;
    vitoriasJogadorX = 0;
    vitoriasJogadorO = 0;
    melhor3 = 0;
    inicio = 0;
  }

  // Função para reiniciar o jogo
  void reiniciarJogo() {
    click = 0;
    jogoFinalizado = false;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        tabuleiro[i][j] = vazio;
      }
    }
  }

  void keyPressed() {
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        ganhador = 0;

        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            tabuleiro[i][j] = 0;
            background(255);
            stroke(0);
            strokeWeight(5);
            //linhas que dão o formato do tabuleiro
            line(200, 0, 200, 800);
            line(400, 0, 400, 800);
            line(0, 200, 600, 200);
            line(0, 400, 600, 400);
            //define o tamanho das letras
            textSize(30);
            fill(0);

            click = 0;
          }
        }
        reiniciarJogo();
      }//fim do if tecla pressionada = r
      else if (key == 'f' || key == 'F') {
        
        paginaInicial = pagina3;

        reiniciarJogo();

        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            tabuleiro[i][j] = 0;
            background(255);
            stroke(0);
            strokeWeight(5);
            //linhas que dão o formato do tabuleiro
            line(200, 0, 200, 800);
            line(400, 0, 400, 800);
            line(0, 200, 600, 200);
            line(0, 400, 600, 400);
            //define o tamanho das letras
            textSize(30);
            fill(0);

            click = 0;
          }
        }
        ReiniciarGame();
      }
    }
  }
