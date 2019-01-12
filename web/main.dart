import 'dart:html';

void main() {
  querySelector('#output').text = 'My first Dart application';

  int age = 100;

  querySelector('#age').text = age.toString();

  (querySelector('#num1') as InputElement).value = "10";
  (querySelector('#num2') as InputElement).value = "20";

  querySelector('#calc').onClick.listen(getSum);

  querySelector('#inc').onClick.listen(increment);

  funcTest();

}

void getSum(MouseEvent e){

  String output = "";

  int num1 = int.parse((querySelector('#num1') as InputElement).value );

  int num2 = int.parse((querySelector('#num2') as InputElement).value );

  var sum = (num1 + num2).toString();

  output += "$num1 + $num2 = ${num1 + num2}";


  output += "\n";

  // Conditional statement
  int age = 18;

  if (age > 18) {
    output += "You are not an adult";
  } else if (age >= 18) {
    output += "You are an adult";
  }


  // Switch
  String name = "Samuelson";

  switch (name) {
    case "Samuelson":
      output += "Hello Samuelson\n\n";
      break;
    case "Francis":
      output += "Hello Francis\n\n";
      break;
    case "Daniel":
      output += "Hello Daniel\n\n";
      break;
    default:
  }

  // Array List
  List days = ["Monday", "Tuesday", "Wednessday", "Thursday", "Friday", "Saturday", "Sunday"];

  output += "Days at index 0 is: ${days[0]}\n\n";

  // For Loop
  for (var i = 0; i < days.length; i++) {
    output += "Day: ${days[i]}\n";
  }

  output += "\n\n";

  // While Loop
  int n = 10;

  while (n >= 1) {
    output += "${n}\n";
    n--;
  }

  output += "\n\n";

  // Do while loop
  int a = 5;

  do {
    output += "${a}\n";
    a++;
  } while (a <= 10);

  output += "\n\n";

  // Maps (Objects)
  Map person = {
    "firstName": "Samuelson",
    "lastName": "Okoi",
    "email": "hello@samuelsonokoi.com"
  };

  output += "${person}\n";


  // Strings
  String sWord = "this is a short string";
  String lWord = "This is a really long and boring string with plenty of information that are not needed for the good of the society.";

  output += "The first letter in short word is: ${sWord[0]}";

  output += "\n";

  output += "String equals: ${sWord.compareTo(lWord)}";

  output += "\n";

  output += "String contains: ${lWord.contains("society", 0)}";

  output += "\n";

  output += "Index of society: ${lWord.indexOf("society")}";

  output += "\n";

  output += "Replace all spaces: ${lWord.replaceAll(" ", "-")}";

  output += "\n";

  List words = sWord.split(" ");

  output += "Split strings: ${words}";

  output += "\n";

  output += "String index 0 - 10: ${lWord.substring(0, 20)}";

  output += "\n";

  output += "String Uppercase: ${lWord.toUpperCase()}";

  output += "\n";

  output += "String Trim: ${lWord.trim()}";

  output += "\n";

  output += "String is empty: ${lWord.isEmpty}";


  querySelector('#result').text = output;
}

void increment(MouseEvent e){
  

  int inc = int.parse(querySelector('#age').text);

  inc++;

  querySelector('#age').text = inc.toString();
}

// Playing with functions
void funcTest(){
  String output = "";

  output += "2 * 12 = ${multiply(2, 12)}\n\n";

  times2(num) => num * 2;

  output += "100 * 2 = ${times2(100)}\n\n";

  times3(num) => num * 3;

  output += "100 * 3 = ${times3(100)}\n\n";

  output += addList(1, 10);

  // Passing functions to expressions which also contains a function as a parameter.
  output += "24 * 24 = ${multiplication(50, times2)}\n\n";
  output += "24 * 24 = ${multiplication(50, times3)}\n\n";


  querySelector("#fOutput").text = output;
}

int multiply(int num1, int num2){
  int result = num1 * num2;
  return result;
}

// how to make a function with a default value and also make it optional with the [] symbol
String addList(int start, [int quantity = 1]){
  String strList = "";

  for (var i = 1; i <= quantity; i++) {
    strList += "$i, ";
  }

  return strList + "\n\n";
}

// Making a function that takes an anonymous function as a parameter and returning whatever was enter to that anonymous function.
int multiplication(int num, func){
  return func(num);
}
