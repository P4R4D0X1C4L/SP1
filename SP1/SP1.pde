import java.util.Scanner;        // I use the class Scanner to make my project able to make use of inputs (unencrypted message)

String msg;                      // This variable contains the original (unencrypted) message/input
String encMsg;                   // This variable contains the message/input after it has been encrypted;
int shift = 3;                   // This variable determains how may letters a message/input will be shifted.
                                 // Fx. 'a' -> 'd' because 'd' is 3 letters further to the right compared to 'a'

void setup() {
  size(400, 400);                // The size of my window is 400 px along both the X- & Y-axis.
}

void draw() {
}

String getInput(String prompt){  // This method receives the userinput from the terminal. So I can encrypt the message/input later in the encryptMessage method.
  print(prompt);                 // Print the message/input before it gets encrypted
  Scanner scanner= new Scanner(System.in);  // Using the Scanner class I imported in the forst line. 
  String input = scanner.nextLine();
  return input;
}
