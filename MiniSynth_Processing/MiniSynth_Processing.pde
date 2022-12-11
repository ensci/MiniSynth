import processing.sound.*;

//Oscillateurr, filtre passe-bas et réverb
SawOsc oscillator;
LowPass filter;

void setup() {
  size(900, 500);

  //Configure l'Arduino
  arduinoSetup(7);

  //Créé un oscillateur, amplitude 100%, panning à 0
  oscillator = new SawOsc(this);
  oscillator.play();
  oscillator.amp(1.0);
  oscillator.pan(0.0);
  //Créé un filtre
  filter = new LowPass(this);
  filter.process(oscillator);
}

void draw() {
  //Récupère les infos de l'Arduino
  //Les capteurs sont récupérés dans les variables capteur1, capteur2, capteur3…
  arduinoLoop();

  //Affiche les capteurs sous forme de barres
  arduinoDebug();

  //Fréquences audio entre 80Hz et 880Hz
  float osc_frequency = map(capteur1, 10, 1020, 40, 880);
  //Petit vibrato
  osc_frequency += map(sin(millis() / 25.), -1, 1, -0.25, 0.25);
  oscillator.freq(osc_frequency);

  //Fréquences audio entre 80Hz et 10kHz
  float filter_frequency = map(capteur2, 0, 1024, 80, 10000);
  filter.freq(filter_frequency);
}

//Un capteur a changé de valeur
void capteurChanged() {
  println(millis() + " : Les capteurs ont changé", capteur1, capteur2, capteur3, capteur4, capteur5, capteur6, capteur7, capteur8, capteur9, capteur10, capteur11);
}
//Un capteur a franchis le seuil > 512
void declencheurPressed(int numCapteur) {
  println(millis() + " : Le capteur " + numCapteur + " s'est déclenché");
}
//Un capteur a franchis le seuil < 512
void declencheurReleased(int numCapteur) {
  println(millis() + " : Le capteur " + numCapteur + " s'est relâché");
}
