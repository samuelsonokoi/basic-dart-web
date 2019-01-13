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

  listTest();

  mapTest();

  manipulateHtml();

  classTest();

  inheritanceTest();

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

  // Facotorial
  output += "Factorial of 10 is: ${factorial(10)}";


  querySelector("#fOutput").text = output;
}

// Looking at maps
void mapTest(){
  String output = "";

  Map empty = {};

  Map user = {
    "firstName": "Samuelson", 
    "lastName": "Okoi", 
    "gender": "male",
    "email": "hello@samuelsonokoi.com",
    "website": "samuelsonokoi.com",
    "mobileNumbers": {
      "mobile1": "+2348184193891",
      "mobile2": "+2348161142911"
    } 
  };

  output += "$user";

  output += "User's First name is: ${user["firstName"]}, Phone number is: ${user["mobileNumbers"]["mobile1"]}";

  user.addAll({"country": "Nigetia"});
  
  user.remove("gender");
  
  user.forEach((k, v) => output += "$k : $v, ");

  querySelector('#mOutput').text = output;
}

// Manipulating HTML
void manipulateHtml(){
  String output = "";

  Element title = querySelector("#hOutput");

  title.setInnerHtml("This content has been modified.");

  title.style.color = "blue";

  title.classes.add("font-lg");

  title.style.textAlign = "center";

  output += title.innerHtml + '\n';

  // Creating new elements
  Element divBox = querySelector("#divBox");

  DivElement sampleDiv = new DivElement();

  sampleDiv.text = "I'm a new div element";

  divBox.children.add(sampleDiv);

  AnchorElement link = new AnchorElement();

  link.text = "Click to visit Google";

  // Changing attributes of elements
  link.setAttribute("href", "https://google.com");

  link.setAttribute("target", "_blank");

  link.appendText(" right away");

  output += "the link address is: ${link.getAttribute("href")}";

  divBox.children.add(link);

  divBox.children.add(new Element.br());

  Element inputElement = new InputElement();

  inputElement.attributes['id'] = "inputElement";

  inputElement.attributes['placeholder'] = "Enter a text";

  divBox.children.add(inputElement);

  inputElementChanged(Event m) => querySelector("#hOutput").text = output + ' \nInput changed';

  querySelector("#inputElement").onChange.listen(inputElementChanged);

  querySelector("#hOutput").text = output;
} 

// More on List
void listTest(){
  String output = "";

  // List without a specific datatype
  List emptyList = [];
  List randList = ["Samuelson", 30, 'm'];

  output += "is emptyList empty?: ${emptyList.isEmpty}\n\n";

  output += "items in randList: ";

  for (var i = 0; i < randList.length; i++) {
    output += "${randList[i]}, \n\n";
  }

  randList.add("Dart Lang");

  // Looping with foreach loop with list
  randList.forEach((item) => output += "${item}, \n\n");

  randList.remove('m');

  output += "Updated items in randList to remove 'm': ";

  for(var item in randList){
    output += "${item}, \n\n";
  }

  // Defining a list with specific datatypes
  List<String> friends = ["Denis", "Mendie", "Silas", "Conel", "Reagan"];

  output += "My friends are: ";
  
  friends.forEach((f) => output += "$f, ");

  querySelector("#lOutput").text = output;
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

// Factorial function
int factorial(int num){
  if (num <= 1) {
    return 1;
  } else {
    return num * factorial(num - 1);
  }
}

class Animal {
  String name = "No name";
  String sound = "No sound";

  // private variable declaration
  int _weight = 0;

  // getters in dart
  int get weight => _weight;

  // setters in dart
  set weight(int w){
    if (w <= 0) {
      _weight = 0;
    } else {
      _weight = w;
    }
  } 

  // Constructor methods
  Animal(){ numberOfAnimals++; }

  // parameterized constructors
  Animal.three(String name, String sound, int weight){
    this.name = name;
    this.sound = sound;
    this._weight = weight;
    numberOfAnimals++;
  }

  String run(){
    return "${this.name} runs";
  }

  // static variables
  static int numberOfAnimals = 0;

  // static methods
  static String getNumberOfAnimals(){
    return numberOfAnimals.toString();
  }

  String info(){
    return "$name, $sound, $weight";
  }
}

class Dog extends Animal {

  String bite(){
    return "${this.name} bit you";
  }

  Dog(){Animal.numberOfAnimals++;}

  Dog.three(String name, String sound, int weight){
    this.name = name;
    this.sound = sound;
    this._weight = weight;
    Animal.numberOfAnimals++;
  }

  // Overriding a method from the super class
  String info(){
    // return "$name, $sound, $weight";
    return super .info() + " bites";
  }
}

void classTest(){
  String output = "";

  Animal bear = new Animal();
  bear.name = "Coby";
  bear.sound = "Grrrrrr";
  bear.weight = 600;

  output += "${bear.name} said ${bear.sound} and weighs ${bear.weight} pounds.";

  output += "${bear.run()}";

  

  querySelector("#oOutput").text = output;
}

inheritanceTest(){
  String output = "";

  Animal tiger = new Animal.three("Kazar", "Rowwwl", 658);

  output += "${tiger.name} said ${tiger.sound} and weighs ${tiger.weight} pounds.";

  output += "Number of Animals: ${Animal.getNumberOfAnimals()}";

  Dog rover = new Dog.three("Rover", "woooof", 75);

  output += "${rover.name} said ${rover.sound} and weighs ${rover.weight} pounds.";

  output += rover.info();

  querySelector("#iOutput").text = output;
}

