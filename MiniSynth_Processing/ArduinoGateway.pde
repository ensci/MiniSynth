import processing.serial.*; // Import Arduino

Serial arduino = null;
int capteur1 = 0, capteur2 = 0, capteur3 = 0, capteur4 = 0, capteur5 = 0, capteur6 = 0, capteur7 = 0, capteur8 = 0, capteur9 = 0, capteur10 = 0, capteur11 = 0;
boolean declencheur1 = false, declencheur2 = false, declencheur3 = false, declencheur4 = false, declencheur5 = false, declencheur6 = false, declencheur7 = false, declencheur8 = false, declencheur9 = false, declencheur10 = false, declencheur11 = false;

void arduinoSetup(int arduinoPortIndex) {
  //Liste des ports Arduino
  String[] arduinoPortNames = Serial.list();
  println("Ports Arduino disponibles");
  for (int arduinoPortNamesIndex = 0; arduinoPortNamesIndex < arduinoPortNames.length; arduinoPortNamesIndex++) {
    println(arduinoPortNamesIndex + " : " + arduinoPortNames[arduinoPortNamesIndex]);
  }

  try {
    //Choisit le port Arduino
    String arduinoPortName = Serial.list()[arduinoPortIndex];

    //Prépare la communication avec l'Arduino —> équivalent au Serial.begin(9600)
    arduino = new Serial(this, arduinoPortName, 9600);
  }
  catch(Exception e) {
    println("ERREUR DE PORT ARDUINO");
  }
}

void arduinoLoop() {
  //Y a-t-il une Arduino ?
  if (arduino != null) {
    //Y a-t-il des données sur l'Arduino ?
    if (arduino.available() > 0) {
      //Lit la ligne de valeurs
      String arduinoLine = arduino.readStringUntil(10);

      //Il y a bien des valeurs reçues
      if (arduinoLine != null) {
        //Efface les valeurs d'avant
        capteur1 = 0;
        capteur2 = 0;
        capteur3 = 0;
        capteur4 = 0;
        capteur5 = 0;
        capteur6 = 0;
        capteur7 = 0;
        capteur8 = 0;
        capteur9 = 0;
        capteur10 = 0;
        capteur11 = 0;

        //Découpe les valeurs
        String[] arduinoLineItems = arduinoLine.trim().split(" ");
        for (int arduinoLineItemsIndex = 0; arduinoLineItemsIndex < arduinoLineItems.length; arduinoLineItemsIndex++) {
          if (arduinoLineItemsIndex == 0)
            capteur1 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 1)
            capteur2 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 2)
            capteur3 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 3)
            capteur4 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 4)
            capteur5 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 5)
            capteur6 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 6)
            capteur7 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 7)
            capteur8 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 8)
            capteur9 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 9)
            capteur10 = int(arduinoLineItems[arduinoLineItemsIndex]);
          else if (arduinoLineItemsIndex == 10)
            capteur11 = int(arduinoLineItems[arduinoLineItemsIndex]);
        }
        capteurChanged();

        if ((capteur1 > 500) && (declencheur1 == false)) {
          declencheurPressed(1);
          declencheur1 = true;
        } else if ((capteur1 < 500) && (declencheur1 == true)) {
          declencheurReleased(1);
          declencheur1 = false;
        }
        if ((capteur2 > 500) && (declencheur2 == false)) {
          println(capteur2);
          declencheurPressed(2);
          declencheur2 = true;
        } else if ((capteur2 < 500) && (declencheur2 == true)) {
          println(capteur2);
          declencheurReleased(2);
          declencheur2 = false;
        }
        if ((capteur3 > 500) && (declencheur3 == false)) {
          declencheurPressed(3);
          declencheur3 = true;
        } else if ((capteur3 < 500) && (declencheur3 == true)) {
          declencheurReleased(3);
          declencheur3 = false;
        }
        if ((capteur4 > 500) && (declencheur4 == false)) {
          declencheurPressed(4);
          declencheur4 = true;
        } else if ((capteur4 < 500) && (declencheur4 == true)) {
          declencheurReleased(4);
          declencheur4 = false;
        }
        if ((capteur5 > 500) && (declencheur5 == false)) {
          declencheurPressed(5);
          declencheur5 = true;
        } else if ((capteur5 < 500) && (declencheur5 == true)) {
          declencheurReleased(5);
          declencheur5 = false;
        }
        if ((capteur6 > 600) && (declencheur6 == false)) {
          declencheurPressed(6);
          declencheur6 = true;
        } else if ((capteur6 < 600) && (declencheur6 == true)) {
          declencheurReleased(6);
          declencheur6 = false;
        }
        if ((capteur7 > 700) && (declencheur7 == false)) {
          declencheurPressed(7);
          declencheur7 = true;
        } else if ((capteur7 < 700) && (declencheur7 == true)) {
          declencheurReleased(7);
          declencheur7 = false;
        }
        if ((capteur8 > 800) && (declencheur8 == false)) {
          declencheurPressed(8);
          declencheur8 = true;
        } else if ((capteur8 < 800) && (declencheur8 == true)) {
          declencheurReleased(8);
          declencheur8 = false;
        }
        if ((capteur9 > 900) && (declencheur9 == false)) {
          declencheurPressed(9);
          declencheur9 = true;
        } else if ((capteur9 < 900) && (declencheur9 == true)) {
          declencheurReleased(9);
          declencheur9 = false;
        }
        if ((capteur10 > 1000) && (declencheur10 == false)) {
          declencheurPressed(10);
          declencheur10 = true;
        } else if ((capteur10 < 1000) && (declencheur10 == true)) {
          declencheurReleased(10);
          declencheur10 = false;
        }
        if ((capteur11 > 1100) && (declencheur11 == false)) {
          declencheurPressed(11);
          declencheur11 = true;
        } else if ((capteur11 < 1100) && (declencheur11 == true)) {
          declencheurReleased(11);
          declencheur11 = false;
        }
      }
    }
  }
}

void arduinoDebug() {
  //Dessine l'arc en ciel
  background(#323232);
  fill(#e40303);
  rect(0, 500, 100, -capteur1/2);
  fill(#ff8c00);
  rect(100, 500, 100, -capteur2/2);
  fill(#ffed00);
  rect(200, 500, 100, -capteur3/2);
  fill(#008026);
  rect(300, 500, 100, -capteur4/2);
  fill(#004dff);
  rect(400, 500, 100, -capteur5/2);
  fill(#750787);
  rect(500, 500, 100, -capteur6/2);
  fill(#ffffff);
  rect(600, 500, 100, -capteur7/2);
  fill(#ffafc7);
  rect(700, 500, 100, -capteur8/2);
  fill(#73d7EE);
  rect(800, 500, 100, -capteur9/2);
  fill(#613915);
  rect(700, 500, 100, -capteur10/2);
  fill(#000000);
  rect(800, 500, 100, -capteur11/2);
}
