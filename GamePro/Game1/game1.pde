import vsync.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.serial.*;

Maxim maxim;
AudioPlayer Sou;
AudioPlayer SouOver;
AudioPlayer SouWin;
AudioPlayer SouFire;
AudioPlayer SouBob;
AudioPlayer SouAc;
AudioPlayer SouIn;
AudioPlayer SouIn2;
PImage Fon; //pantalla principal del juego
PImage Jt;
PImage Log;
PImage Ps; 
PImage Imgl1;
PImage Imgl2;
PImage Imgd1;
PImage Imgd2;
PImage SaltI;
PImage SalI;
PImage LanI;
PImage LanD; 
PImage Bal;
PImage Bal1;
PImage Bal2;
PImage Piso;
PImage Mpa;
PImage Flo;
PImage Over;
PImage Des;
PImage Win;
PImage Win2;
PImage Toa;
PImage Nuv;
PImage Hmar;
PImage Cbos;
PImage Lui;
PImage Lui1;
PImage Lui2;
PImage Text;
PImage Text2;
PImage Text3;
PImage Text4;
PImage TexC;
PImage TexV;
PImage TexA;
PImage Tec;
PImage Dan;
PImage FDan;
PImage FDan1;
PImage FDan2;
PImage Exp;
PImage Fal;
PImage Fal1;
PImage Bow;
PImage Bow2;
PImage Bob;
PImage Fue;
PImage Boc;
PImage Boc1; 
PImage easy;
PImage mid;
PImage difi;
PImage dificulty;
int Balx = -10;
int Baly = -10;
int x1 = 270;
int y2 = 0;
int xs = 305;
int y = 460;
int X = 0;
int Zx = 0;
int Za = 0;
int XX = 0;
float N = 0;
float M = 0;
int Start = 0;
int start2 = 0;
int facil=0;
int medio=0;
int dificil=0;
boolean dificultad=false;
int Pos = 5;
int Salt = 0;
int Punt = 10;
int Fallos = 3;
int F = 0;
int F1 = 0;
int K = 0;
int G = 0;
int S = 0;
int S1 = 0;
int J = 0;
int J1 = 10;
float AtaCx = 0;
float AtaCy = 0;
float Fuex = 500;
float Fuey = -10; 
float speed = 1;
char valor;
boolean Acer1 = false;
boolean Acer2 = false;
boolean Acer3 = false;
Serial puerto;

void setup() {
  size(700, 600);
  maxim = new Maxim(this);
  Sou = maxim.loadFile("Super Mario.wav");
  Sou.speed(1);
  SouOver = maxim.loadFile("Game over.wav");
  SouOver.speed(1);
  SouWin = maxim.loadFile("Win.wav");
  SouWin.speed(1);
  SouFire = maxim.loadFile("Fue.wav");
  SouFire.speed(0.3);
  SouBob = maxim.loadFile("Bob.wav");
  SouBob.speed(0.3);
  SouIn = maxim.loadFile("In.wav"); //música de inicio
  SouBob.speed(0.3);
  SouIn2 = maxim.loadFile("In2.wav");
  SouBob.speed(0.3);
  SouAc = maxim.loadFile("Ac.wav");//música cuando presiona start
  SouAc.speed(1);
  Fon = loadImage("Fon.png"); //Pantalla principal del juego
  Jt = loadImage("Jt.png"); 
  Log = loadImage("Log.png");
  Ps = loadImage("Ps.png");
  Bal = loadImage("Bal.png");
  Bal1 = loadImage("Bal1.png");
  Bal2 = loadImage("Bal2.png");
  Piso = loadImage("Piso.png");
  Mpa = loadImage("Mpa.png");
  Flo = loadImage("Flo.png");
  Over = loadImage("Game over.png");
  Des = loadImage("Des.png");
  Win = loadImage("Win.png");
  Win2 = loadImage("Win2.png");
  Toa = loadImage("Toa.png");
  Nuv = loadImage("Nuv.png");
  Lui = loadImage("Lui.png");
  Lui1 = loadImage("Lui1.png");
  Lui2 = loadImage("Lui2.png");
  Text = loadImage("Text.PNG");
  Text2 = loadImage("Text2.PNG");
  Text3 = loadImage("Text3.PNG");
  Text4 = loadImage("Text4.PNG");
  TexC = loadImage("TexC.png");
  TexV = loadImage("TexV.png");
  TexA = loadImage("TexA.png");  
  Tec = loadImage("Tec1.png");
  Imgl1 = loadImage("Img1.png");
  Imgl2 = loadImage("Img2.png");
  Imgd1 = loadImage("Img11.png");
  Imgd2 = loadImage("Img22.png");
  SaltI = loadImage("Salt.png");
  SalI = loadImage("Salt1.png");
  LanD = loadImage("LanD.png");
  LanI = loadImage("LanI.png");
  Exp = loadImage("Exp2.png");
  Fal = loadImage("Fal.png");
  Fal1 = loadImage("Fal1.png");
  Bow = loadImage("Bow.png");
  Bow2 = loadImage("Bow2.png");
  Bob = loadImage("Bob.png");
  Fue = loadImage("Fue.png");
  Hmar = loadImage("Hmar.png");
  Cbos = loadImage("Cbos.png");
  Boc = loadImage("Boc.png");
  Boc1 = loadImage("Boc1.png");
  Dan = loadImage("Dan.png");
  FDan = loadImage("FDan.PNG");
  FDan1 = loadImage("FDan1.PNG");
  FDan2 = loadImage("FDan2.PNG");
  easy = loadImage("Facil.png");
  mid = loadImage("Medio.png");
  difi = loadImage("dificil.png");
  dificulty= loadImage("dificultad.png");
  AtaCx = random(520);
  background(255);
  String COM = Serial.list()[0];
  puerto = new Serial(this, COM, 9600);
}
void draw() {
  background(255);
  //se presionó start?
  if (Start==1) {
    //aquí entra directamente al presionar start
    if (S==0) {
      SouAc.play(); //música de start
      SouIn.stop(); //detiene música de inicio
      image(Fon, 0, 0, 700, 600); //dibuja el fondo de inicio
      image(Jt, 450, 480); //imagen del joystick que indica presionar start
      image(Log, 50, 290); //título del juego
      image(Ps, 30, 420, 380, 180); // dibuja "PUSH START"
    }
    S1 += 1; //contador, aumenta S1 en 1 en cada iteración

    //S1 es mayor que 100?
    if (S1>100) {
      S=1; //indica que ya presiono start y el juego puede empezar
      SouIn2.play();// música de pantalla de instrucciones
      SouAc.stop();//para música de start

      //pregunta si k es igual a 0 pero no hace nada...
      if (K==0) {
      }

      if (!dificultad) {
        image(Piso, 0, 0); //pantalla de juego
        image(Mpa, 550, 50); //imagen paper mario
        image(easy, 150, 200); //imagen paper mario
        image(mid, 150, 300); //imagen paper mario
        image(difi, 150, 400); //imagen paper mario


        if (facil==1) {
          Fallos=5;
          dificultad=true;
          Punt=5;
        } else if (medio==1) {
          dificultad=true;
        } else if (dificil==1) {
          Fallos=2;
          Punt=12;

          dificultad=true;
        }
      } else {


        J+=1; //contador, aumenta J en uno en cada iteración
        //println("Valor: "+J);
        if (J>=0&&J<=400) { //inicia el juego
          image(Piso, 0, 0); //pantalla de juego
          image(Mpa, 550, 50); //imagen paper mario
          image(Bow, AtaCx, 5);//bowser junior
          image(Boc, AtaCx+72, 140);//boca de la planta donde está el bebe bowser
          image(Lui, 50, 400);// imagen de luigi
          image(Text, 190, 250); //texto explica 
          //J es divisible por 40?
          if (J%40==0) {
            J1-=1; //entonces J1 disminuye en 1, cada 40 iteraciones ocurre
          }
          //J es igual a 400
          if (J==400) {
            J1=10;  //J1 es igual a 10, va disminuyendo de 10 hasta cero y vuelve a empezar
          }
          textSize(25);
          fill(0, 102, 153);
          text("Continua en.. "+J1, 450, 580);//temporizador
        } 

        //J está entre 400 y 800?
        else if (J>400&&J<=800) {
          image(Piso, 0, 0);//pantalla de juego
          image(Mpa, 550, 50);//imagen paper mario
          image(Bow, AtaCx, 5);//bowser junior
          image(Boc, AtaCx+72, 140);//boca de la planta donde está el bebe bowser
          image(Lui, 50, 400);// imagen de luigi
          image(FDan2, AtaCx+50, 200); //flecha amarilla diagonal derecha
          image(Text2, 190, 250);//instrucciones de como derrotar a junior

          //J es divisible por 40?
          if (J%40==0) {
            J1-=1;
          }
          //J es igual a 800?
          if (J==800) {
            J1=10; //reinicia J1
          }
          textSize(25);
          fill(0, 102, 153);
          text("Continua en.. "+J1, 450, 580); //temporizador
        } 
        //J está entre 800 y 1200?    
        else if (J>800&&J<=1200) {
          image(Piso, 0, 0);//pantalla de juego
          image(Lui1, 110, 0);// imagen de luigi dirección opuesta
          image(Text3, 280, 100); //texto de las vidas de jr. bowser
          textSize(25);
          fill(0, 102, 153);
          text(" X "+Punt, 60, 45, 10); //texto que muestra las vidas de jr bowser
          fill(0, 102, 153);
          text(" X "+Fallos, 60, 580); //texto que muestra las vidas de mario
          image(Hmar, 10, 540); //hongo verde de vida
          image(Cbos, 10, 10); //caparazón de bowser
          image(TexV, 500, 15); //letrero "VIDAS"

          //J es múltiplo de 40?
          if (J%40==0) {
            J1-=1; //resta 1 a J1
          }

          //J es igual que 1200?
          if (J==1200) {
            J1=10;
          }
          textSize(25);
          fill(0, 102, 153);
          text("Continua en.. "+J1, 450, 580);//temporizador
          //J está entre 1200 y 1600?
        } else if (J>1200&&J<=1600) {
          image(Piso, 0, 0);//pantalla de juego
          image(Lui2, 110, 510);// imagen de luigi apuntando a la izquierda 
          image(Text4, 200, 400);//instrucciones de las vidas de mario
          textSize(25);
          fill(0, 102, 153);
          text(" X "+Punt, 60, 45, 10);//texto que muestra las vidas de jr bowser
          fill(0, 102, 153);
          text(" X "+Fallos, 60, 580);//texto que muestra las vidas de mario
          image(Hmar, 10, 540);//hongo verde de vida
          image(Cbos, 10, 10);//caparazón de bowser
          image(TexV, 500, 15);//letrero "VIDAS"

          //J es múltiplo de 40?
          if (J%40==0) {
            J1-=1;
          }
          //J es igual a 1600?
          if (J==1600) {
            J1=10;
          }
          textSize(25);
          fill(0, 102, 153);
          text("Continua en.. "+J1, 450, 580);//temporizador
        } else if (J>1600&&J<=2000) {
          image(Piso, 0, 0);//pantalla de juego
          image(Tec, 0, 0);//imagen del control
          image(TexC, 15, 15);// texto de "CONTROLES"
          //J es múltiplo de 40?
          if (J%40==0) {
            J1-=1;
          }

          //J es igual a 2000?
          if (J==2000) {
            J1=10;
          }
          textSize(25);
          fill(0, 102, 153);
          text("Continua en.. "+J1, 450, 580);//temporizador
        } else if (J>2000&&J<=2400) {
          image(Piso, 0, 0);//pantalla de juego
          image(TexA, 108, 50);//texto de aviso de inicio de juego
          //J es múltiplo de 40?
          if (J%40==0) {
            J1-=1;
          }
          //J es igual a 2000?
          if (J==2400) {
            J1=10;
          }
          textSize(50);
          fill(0, 102, 153);
          text("En.. "+J1, 250, 300);//temporizador final
        } else {
          if (F>=1) {
            //puerto.stop(); //detiene el puerto serial
            Sou.stop(); //para la música principal
            SouFire.stop();
            SouBob.stop();
            SouIn2.stop();// para la música de pantalla de instrucciones
          } else {
            Sou.play(); // música main del juego
            SouIn2.stop();
          }
          image(Piso, 0, 0);//pantalla de juego
          image(Mpa, 550, 120); // letrero de "PAPER MARIO"
          image(Flo, 100, 480);// imagen de flor
          image(Toa, 590, 5); // imagen de champiñon
          image(Nuv, 575, 60); //nuve

          //Movimientos
          fill(255);
          if (Salt==1) {
            XX = x1 + Zx;
            if (XX<0) {
              x1 = 590;
              Zx = 0;
            } else if (XX>590) {
              x1=0;
              Zx = 0;
            }
            if (y2==0) {
              y = y - 5;
              image(SalI, XX, y);
              if (y==320) {
                y2=1;
              }
            } else if (y2==1) {
              y = y + 5;
              image(SalI, XX, y);
              if (y==460) {
                y2 = 0;
                Salt = 0;
              }
            }
          } else {
            if (!Acer2) {
              XX = x1 + Zx;
              if (XX<0) {
                x1 = 590;
                Zx = 0;
              } else if (XX>590) {
                x1=0;
                Zx = 0;
              }

              if (Zx<=Za) {
                if ((Zx%2)==0) {
                  if (G==0) {
                    image(Imgl1, XX, y);
                  } else if (G==1) {
                    image(LanI, XX, y);
                  } else if (G==2) {
                    image(LanD, XX, y);
                  } else if (G==3) {
                    image(Fal1, XX-37, y+35);
                  }
                } else {
                  if (G==0) {
                    image(Imgl2, XX, y);
                  } else if (G==1) {
                    image(LanI, XX, y);
                  } else if (G==2) {
                    image(LanD, XX, y);
                  } else if (G==3) {
                    image(Fal1, XX-37, y+35);
                  }
                }
              } else if (Zx>Za) {
                if ((Zx%2)==0) {
                  if (G==0) {
                    image(Imgd1, XX, y);
                  } else if (G==1) {
                    image(LanI, XX, y);
                  } else if (G==2) {
                    image(LanD, XX, y);
                  } else if (G==3) {
                    image(Fal, XX, y+35);
                  }
                } else {
                  if (G==0) {
                    image(Imgd2, XX, y);
                  } else if (G==1) {
                    image(LanI, XX, y);
                  } else if (G==2) {
                    image(LanD, XX, y);
                  } else if (G==3) {
                    image(Fal, XX, y+35);
                  }
                }
              }
            }
          }

          //hongitos 
          if (Pos==0) {
            image(Bal, Balx, Baly);
            Baly = Baly-10;
          } else if (Pos==1) {
            image(Bal, Balx, Baly-60);
            Baly = Baly-10;
          } else if (Pos==2) {
            image(Bal1, Balx-50, Baly);
            Balx = Balx - 4;
            Baly = Baly - 10;
          } else if (Pos==3) {
            image(Bal2, Balx+70, Baly);
            Balx = Balx + 4;
            Baly = Baly - 10;
          }
          image(Bob, AtaCx-50, AtaCy+100);
          image(Bow, AtaCx, 5);


          // puntos y fallos del juego
          if (medio==1) //modo medio
          {
            if (Punt<=3) {
              image(Boc1, AtaCx+72, 140);
            } else {
              image(Boc, AtaCx+72, 140);
            }
            if (Punt<=6) {
              image(SaltI, AtaCx+85, 105, 30, 30);
            }
            if (Punt<=4) {
              image(SaltI, AtaCx+42, 125, 30, 30);
            }
            if (Punt<=2) {
              image(SaltI, AtaCx+42, 125, 30, 30);
            }

            if (AtaCy>590) {
              AtaCy=0;
              AtaCx=random(520);
              Acer1 = false;
              Acer2 = false;
              Acer3 = false;
            } else {
              AtaCy=AtaCy+5;
              if (AtaCy<=150) {
                if (F<=1) {
                  SouBob.play();
                } else {
                  SouBob.stop();
                }
              } else {
                SouBob.stop();
              }
            }

            if (Punt<=5) {
              if (Fuex>=-40) {
                Fuey=485;
                image(Bow2, 510, 350);
                image(Fue, Fuex, Fuey);
                Fuex=Fuex-2;
                if (Fuex>=-30) {
                  if (F<=1) {
                    SouFire.play();
                  } else {
                    SouFire.stop();
                  }
                } else {
                  SouFire.stop();
                }
              } else {
                Fuex=500;
              }
            } else if (Punt==6) {
              image(Dan, 500, 260);
              image(FDan, 500, 450);
              N = N + 0.5;
              M = N%2;
              if (M==0) {
                image(FDan1, 580, 400);
                image(FDan2, 580, 520);
              } else {
                image(FDan1, 570, 400);
                image(FDan2, 570, 520);
              }
            }
          }
          
          else if(facil==1)//modo facil
          {
            if (Punt<=2) {
              image(Boc1, AtaCx+72, 140);
            } else {
              image(Boc, AtaCx+72, 140);
            }
            if (Punt<=4) {
              image(SaltI, AtaCx+85, 105, 30, 30);
            }
            if (Punt<=3) {
              image(SaltI, AtaCx+42, 125, 30, 30);
            }
            if (Punt<=1) {
              image(SaltI, AtaCx+42, 125, 30, 30);
            }

            if (AtaCy>590) {
              AtaCy=0;
              AtaCx=random(520);
              Acer1 = false;
              Acer2 = false;
              Acer3 = false;
            } else {
              AtaCy=AtaCy+5;
              if (AtaCy<=150) {
                if (F<=1) {
                  SouBob.play();
                } else {
                  SouBob.stop();
                }
              } else {
                SouBob.stop();
              }
            }

            if (Punt<=2) {
              if (Fuex>=-40) {
                Fuey=485;
                image(Bow2, 510, 350);
                image(Fue, Fuex, Fuey);
                Fuex=Fuex-2;
                if (Fuex>=-30) {
                  if (F<=1) {
                    SouFire.play();
                  } else {
                    SouFire.stop();
                  }
                } else {
                  SouFire.stop();
                }
              } else {
                Fuex=500;
              }
            } else if (Punt==3) {
              image(Dan, 500, 260);
              image(FDan, 500, 450);
              N = N + 0.5;
              M = N%2;
              if (M==0) {
                image(FDan1, 580, 400);
                image(FDan2, 580, 520);
              } else {
                image(FDan1, 570, 400);
                image(FDan2, 570, 520);
              }
            }
          }
          
          else if(dificil==1)//modo dificil
          {
            if (Punt<=4) {
              image(Boc1, AtaCx+72, 140);
            } else {
              image(Boc, AtaCx+72, 140);
            }
            if (Punt<=8) {
              image(SaltI, AtaCx+85, 105, 30, 30);
            }
            if (Punt<=5) {
              image(SaltI, AtaCx+42, 125, 30, 30);
            }
            if (Punt<=3) {
              image(SaltI, AtaCx+42, 125, 30, 30);
            }

            if (AtaCy>590) {
              AtaCy=0;
              AtaCx=random(520);
              Acer1 = false;
              Acer2 = false;
              Acer3 = false;
            } else {
              AtaCy=AtaCy+5;
              if (AtaCy<=150) {
                if (F<=1) {
                  SouBob.play();
                } else {
                  SouBob.stop();
                }
              } else {
                SouBob.stop();
              }
            }

            if (Punt<=4) {
              if (Fuex>=-40) {
                Fuey=485;
                image(Bow2, 510, 350);
                image(Fue, Fuex, Fuey);
                Fuex=Fuex-2;
                if (Fuex>=-30) {
                  if (F<=1) {
                    SouFire.play();
                  } else {
                    SouFire.stop();
                  }
                } else {
                  SouFire.stop();
                }
              } else {
                Fuex=500;
              }
            } else if (Punt==5) {
              image(Dan, 500, 260);
              image(FDan, 500, 450);
              N = N + 0.5;
              M = N%2;
              if (M==0) {
                image(FDan1, 580, 400);
                image(FDan2, 580, 520);
              } else {
                image(FDan1, 570, 400);
                image(FDan2, 570, 520);
              }
            }
          }
          //colisiones
          if ((Balx>=AtaCx-100)&&(Balx<=AtaCx)) {
            if ((Baly>=AtaCy)&&(Baly<=AtaCy+50)) {
              Acer1=true;
            }
          }
          if ((Balx+25>=AtaCx+98)&&(Balx+25<=AtaCx+170)) {
            if ((Baly>=150)&&(Baly<=197)) {
              Acer3=true;
            }
          }
          if ((AtaCx>=XX)&&(AtaCx<=XX+100)) {
            if ((AtaCy>=y-50)&&(AtaCy<=y)) {
              Acer2=true;
            }
          }
          if ((Fuex>=XX-50)&&(Fuex<=XX+50)) {
            if ((Fuey>=y-50)&&(Fuey<=y+50)) {
              Acer2=true;
            }
          }
          if (Acer1) {
            image(Exp, AtaCx-100, AtaCy);

            AtaCx=1000;
            AtaCy=1000;
          }

          if (Acer3) {
            image(Exp, AtaCx+100, 100);

            AtaCx=1000;
            AtaCy=1000;
            Balx=-1000;
            Baly=-1000;
            Punt=Punt-1;
          }
          if (Acer2) {
            G=3;
            AtaCx=1000;
            AtaCy=1000;
            Fallos=Fallos-1;
          }
          textSize(25);
          fill(0, 102, 153);
          text(" X "+Punt, 60, 45, 10);
          fill(0, 102, 153);
          text(" X "+Fallos, 60, 580);
          image(Hmar, 10, 540);
          image(Cbos, 10, 10);

          if (Punt<=0) {
            if (F<=400) {
              SouWin.play();
            } else {
              SouWin.stop();
            }
            image(Piso, 0, 0);
            image(Win, 150, 300);
            image(Des, 400, 10);
            image(Win2, 460, 60);
            Fallos=1000;
            F=F+1;
            Salt=1;
            K = 1;

          }

          if (Fallos<=0) {
            if (F<=400) {
              SouOver.play();
            } else {
              SouOver.stop();
            }
            image(Over, -100, -150, 920, 900);
            image(Fal, 305, 428, 100, 60);
            Punt=1000;
            F=F+1;
            Salt=1;
            K = 1;
          }
        }
      }
    }//aquí va dificultad
  } else {
    SouIn.play();
    image(Fon, 0, 0, 700, 600);//dibuja el fondo de inicio
    image(Jt, 450, 480);//imagen del joystick que indica presionar start
    image(Log, 50, 290);//título del juego
    image(Ps, 60, 430);// dibuja "PUSH START"
  }
  serialRead();
}


void serialRead() {

  if (puerto.available()>0) {

    valor= puerto.readChar();  
    if (valor=='A'||valor=='B'||valor=='C'||valor=='D'||valor=='E'||valor=='F'||valor=='G'||valor=='X'||valor=='Y') {
      buttons(valor);
    }
  }
}

void buttons(char valor) {
  switch(valor) {
  case 'B':
    if (!dificultad) {
      medio=1;
    }
    G=2;
    Pos=3;
    Balx = XX;
    Baly = y;
    break;
  case 'A':
    if (!dificultad) {
      facil=1;
    }

    G=1;
    Pos=1;
    Balx = XX;
    Baly = y;
    break;
  case 'D':
    G=1;
    Pos=2;
    Balx = XX;
    Baly = y;
    J=J+2000;
    break;
  case 'C':
    if (!dificultad) {
      dificil=1;
    }
    Salt=1;
    J=J+2000;
    break;
  case 'E':
    break;
  case 'F':
    break;
  case 'G':
  if(Start==0){
    Start=1;
  }else
  {
    Start=0;
    println("inicio");
  }
    break;
  case 'X':

    X=12;
    X=X-5;
    println("der: "+X);
    // X=X+5;
    Za = Zx;
    Zx += X;
    G=0;

    break;
  case 'Y':
    X=-2;
    X=X-5;
    Za = Zx;
    Zx += X;
    G=0;
    println("der: "+X);

    break;
  }
}

void reinicio(){
 Balx = -10;
 Baly = -10;
 x1 = 270;
 y2 = 0;
 xs = 305;
 y = 460;
 X = 0;
 Zx = 0;
 Za = 0;
 XX = 0;
 N = 0;
 M = 0;
 Start = 0;
 start2 = 0;
 facil=0;
 medio=0;
 dificil=0;
 dificultad=false;
 Pos = 5;
 Salt = 0;
 Punt = 10;
 Fallos = 3;
 F = 0;
 F1 = 0;
 K = 0;
 G = 0;
 S = 0;
 S1 = 0;
 J = 0;
 J1 = 10;
 AtaCx = 0;
 AtaCy = 0;
 Fuex = 500;
 Fuey = -10; 
 speed = 1;
 Acer1 = false;
 Acer2 = false;
 Acer3 = false;
}
