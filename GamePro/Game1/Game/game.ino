#define AnaY A1
#define AnaX A0

#define BUTTON_UP 2

#define BUTTON_RIGHT 3

#define BUTTON_DOWN 4

#define BUTTON_LEFT 5

#define BUTTON_E 6

#define BUTTON_F 7

#define BUTTON_G 8
int valorX;
int valorY;
int x;
int y;
const int Top = 10;
const int Rep = Top / 2;
#define DELAY 500



void setup() {
  // to enable pull up resistors first write pin mode

  // and then make that pin HIGH

  pinMode(BUTTON_UP, INPUT);
  digitalWrite(BUTTON_UP, HIGH);

  pinMode(BUTTON_RIGHT, INPUT);
  digitalWrite(BUTTON_RIGHT, HIGH);

  pinMode(BUTTON_DOWN, INPUT);
  digitalWrite(BUTTON_DOWN, HIGH);

  pinMode(BUTTON_LEFT, INPUT);
  digitalWrite(BUTTON_LEFT, HIGH);

  pinMode(BUTTON_E, INPUT);
  digitalWrite(BUTTON_E, HIGH);

  pinMode(BUTTON_F, INPUT);
  digitalWrite(BUTTON_F, HIGH);

  pinMode(BUTTON_G, INPUT);
  digitalWrite(BUTTON_G, HIGH);
  pinMode(AnaY, INPUT);
  pinMode(AnaX, INPUT);
  Serial.begin(9600);
}
void loop() {

  valorX = analogRead(AnaX);
  x = map(valorX, 0, 1024, 0, Top + 1);
 


  if (digitalRead(BUTTON_UP) == LOW) {

    Serial.write("A");
    Serial.println();

    delay(DELAY);

  }

  else if (digitalRead(BUTTON_RIGHT) == LOW) {

    Serial.write("B");
    Serial.println();

    delay(DELAY);

  }

  else if (digitalRead(BUTTON_DOWN) == LOW) {

    Serial.write("C");
    Serial.println();

    delay(DELAY);

  }

  else if (digitalRead(BUTTON_LEFT) == LOW) {

    Serial.write("D");
    Serial.println();

    delay(DELAY);

  }

  else if (digitalRead(BUTTON_E) == LOW) {

    Serial.write("E");
    Serial.println();

    delay(DELAY);

  }

  else if (digitalRead(BUTTON_F) == LOW) {

    Serial.write("F");
    Serial.println();


    delay(DELAY);

  }

  else if (digitalRead(BUTTON_G) == LOW) {

    Serial.write("G");
    Serial.println();

    delay(DELAY);

  }


  if ((x>=0)&&(x<5) ) {
    Serial.write('Y');
    Serial.println();

   delay(30);

  }
  else if ((x>5) && (x<=10)) {
    Serial.write('X');
    Serial.println();

    delay(30);
  }
}
