
//import java.util.Scanner;

class CaesarCipher {

  // Original besked (user-input) som skal krypteres eller dekrypteres
  private String msg;

  // Antallet af pladser som Caesar-Cipheret, skal rykkes til højre (krpytereing) eller til venstre (dekryptering)
  private int shift;

  // Alfabetet + Tal + Specialtegn
  private String alphabetAndChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+´¨'-.,;:_*^`?(){}[]";

  /*
   Dette er min constructor som initialisere CaesarCipher-klassen.
   Objektet CaesarCipher består af 2 instans-variabler, beskeden som er en string og shift-værdien som er et heltal.
   Shift-værdien er det som jeg har kaldt for krypterings- og dekrypteringsnøglen i min README.md
   Bemærk at hver gang der kaldes et objekt af klasse 'CaesarCipher', så vendes beskeden mens den gemmer en besked.
   */
  public CaesarCipher(String message, int shiftValue) {
    this.msg = reverseString(message);    // Beskeden bliver vendt om.
    this.shift = shiftValue;
  }

  @Override    // Overskriver stam-metoden 'toString',så jeg modtager beskeden fra en instans af CaesarCipher klassen
    String toString () {
    return this.msg;
  }

  // Sætter 'msg' feltet for en instans af CaesarCipher klassen
  public void setMessage(String str) {
    this.msg = str;
  }

  // Returnere beskeden fra objekt-instansen
  public String getMessage() {
    return this.msg;
  }

  // Returnere shift-værdien fra objekt-instansen
  public int getShift() {
    return this.shift;
  }

  // Sætter shift til at være lig n*4
  // Dette er en ekstra sikkerheds for anstaltning, som kryptere shift-værdien
  public void shiftEnc() {
    this.shift *= 4;
  }

  // Sætter shift til at være lig n/4
  // Modsvarenede til 'shiftEnc' så dekryteres shift-værdien
  public void shiftDec() {
    this.shift /= 4;
  }

  String reverseString(String str) {
   String ret = "";
   
   for (int i = 1; i <= str.length(); ++i) {
   ret = ret + str.charAt(str.length()-i);
   }
   return ret;
   }
   
   
  /*  Denne metode bruger jeg til at kryptere en besked.
   Måden den fungere på er at jeg kalder denne metode, til en variable med data-typed CaesarCipher.
   Det kunne se sådan her ud fx. encMsg = CaesarCipher("test", 2).encrypt();
   encMsg == "vguv", fordi 'v' er to pladser til højre i alfabetet i forhold til 't',
   mens 'g' er to plader til højre i alfabetet i forhold til 'e' og 'u' er to pladser til højre i alfabetet i forhold til 's'.
   Så derfor bliver beskeden "test" til "vguv".
   */



  // Krypteringsmetode, som tager en besked og returnerer den krypterede besked
  public String encrypt() {
    String encryptedMessage = ""; // Krypteret besked som String

    // For-loop til at iterere gennem hver karakter i beskeden
    for (int i = 0; i < msg.length(); i++) {
      char currentChar = msg.charAt(i);
      
      // Håndter kun tegn, der er i alphabetAndChars strengen
      int index = alphabetAndChars.indexOf(currentChar);
      if (index != -1) {
        // Hvis tegnet findes i alphabetAndChars, anvend Caesar-shift
        char encryptedChar = alphabetAndChars.charAt((index + shift) % alphabetAndChars.length());
        encryptedMessage += encryptedChar;
      } else {
        // Hvis tegnet ikke er i alphabetAndChars, tilføj det uændret
        encryptedMessage += currentChar;
      }
    }
    return encryptedMessage; // Returner den krypterede besked
  }

  // Dekrypteringsmetode, som tager en besked og returnerer den dekrypterede besked
  public String decrypt() {
    //shiftDec();
    String decryptedMessage = ""; // Dekrypteret besked som String

    // For-loop til at iterere gennem hver karakter i den krypterede besked
    for (int i = 0; i < msg.length(); i++) {
      char currentChar = msg.charAt(i);

      // Håndter kun tegn, der er i alphabetAndChars strengen
      int index = alphabetAndChars.indexOf(currentChar);
      if (index != -1) {
        // Hvis tegnet findes i alphabetAndChars, anvend omvendt Caesar-shift
        char decryptedChar = alphabetAndChars.charAt((index - shift + alphabetAndChars.length()) % alphabetAndChars.length());
        decryptedMessage += decryptedChar;
      } else {
        // Hvis tegnet ikke er i alphabetAndChars, tilføj det uændret
        decryptedMessage += currentChar;
      }
    }
    
    return decryptedMessage; // Returner den dekrypterede besked
  }
}
