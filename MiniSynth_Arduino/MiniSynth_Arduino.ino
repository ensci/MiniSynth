//Librairie ResponsiveAnalogRead à ajouter dans Croquis - Inclure une librairie - Gérer les bibliothèques
#include <ResponsiveAnalogRead.h>

//2 capteurs, branchés sur (A0)-A1-(A2) et (A3)-A4-(A5)
ResponsiveAnalogRead fader(A1, true);
ResponsiveAnalogRead potar(A4, true);

void setup() {
  //Début du dialogue USB (S = Serial) avec la carte Arduino et l'ordi
  Serial.begin(9600);

  //Capteur #1 : A0-A1-A2
  pinMode(A0, OUTPUT);
  pinMode(A1, INPUT);
  pinMode(A2, OUTPUT);
  //Capteur #2 : A3-A4-A5
  pinMode(A3, OUTPUT);
  pinMode(A4, INPUT);
  pinMode(A5, OUTPUT);

  //On alimente les capteurs
  digitalWrite(A0, LOW);  //0V - GND - Masse
  digitalWrite(A2, HIGH); //5V

  digitalWrite(A3, LOW);  //0V - GND - Masse
  digitalWrite(A5, HIGH); //5V
}

void loop() {
  //Lecture et lissage des valeurs
  fader.update();
  potar.update();

  //Tranmission et affichage dans la console Arduino ou Processing
  Serial.print(fader.getValue());
  Serial.print(" ");
  Serial.print(potar.getValue());
  Serial.println();

  //Petit délai pour que l'ordi suive bien
  delay(20);
}
