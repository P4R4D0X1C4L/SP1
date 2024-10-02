// Beskeden som skal krypteres
String OriginalMsg = "Hej, med dig. Dette er en test ;) 123?[]";

String userInput = "";
boolean isMessageInputComplete = false;
boolean isCaesarInputComplete = false;

// Dette er tallet som bestemmer hvor mange felter hver karakter i 'OriginalMsg' skal rykkes.
int caesarInt = 4;


void setup() {
  size(400, 400);
  background(255);
  textSize(25);
  fill(0);
  println();
  
  
   // Instantiere jeg et objekt fra klassen CaesarCipher og jeg kalder den for cipher.
   CaesarCipher cipher = new CaesarCipher(OriginalMsg, caesarInt);
   
   println("Original besked, før den er krypteret: \n" + OriginalMsg + "\n");
   
   // Initialisere jeg en string og kalder funktionen encrypt(), som kryptere den modtagede besked
   String encryptedMsg = cipher.encrypt();
   println("Krypteret besked: \n" + encryptedMsg + "\n");
   
   // Her initialisere jeg en string som jeg kalder 'decMsg'.
   // Denne string er et produkt at medtoden 'decrypt', som tager beskeden 'encMsg' fra objektet cipher,
   // og den bruger bruger tallet 'caesarfInt' til at dekryptere beskeden.
   // Tallet caesarInt kommer også fra 'encMsg' instansen af objektet .
   
   
   // Instantiere et nyt object af klassen CaesarCipher.
   CaesarCipher decipher = new CaesarCipher(encryptedMsg, caesarInt);
   
   // Erklærer variablen 'decryptMsg'
   String decryptedMsg = decipher.decrypt();
   println("Dekrypteret besked: \n" + decryptedMsg + "\n");
   
   println(cipher.toString());
   String normalMessage = reverseString(cipher.toString());
   println(normalMessage +"\n");
   
   println(cipher.encrypt());
   println(cipher.toString());
   println(decipher.toString());
   println(decipher.decrypt());
  
}


// Denne metode vender en string bagvendt. Jeg valgte at tilføje dette til krypteringen for at gøre den en smule sværre at dekryptere.
String reverseString(String str) {
  String ret = "";

  for (int i = 1; i <= str.length(); ++i) {
    ret = ret + str.charAt(str.length()-i);
  }
  return ret;
}
