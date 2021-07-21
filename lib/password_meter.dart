class PassWordMeter {

  //additions
  int charNumber=0;
  int uppercaseNumber=0;
  int lowercaseNumber=0;
  int numbersNumber=0;
  int symbolNumber=0;
  int middleNumbersOrSymbols=0;
  int requirements=0;
  //deductions
  int onlyLetter=0;
  int onlyNumber=0;
  int repeatCharacters=0;
  int consecutiveUppercase=0;
  int consecutiveLowercase=0;
  int consecutiveNumber=0;
  int sequentialLetter=0;
  int sequentialNumber=0;
  int sequentialSymbols=0;

  int _rating=0;

  int get rating => _rating;

  String _password='';

  String get password => _password;

  set password(String password) {
    _password = password;
    calculate();
  }

  String upper='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lower='abcdefghijklmnopqrstuvwxyz';
  String numbers='01234567890';
  String symbols='(){}[],.-;:_´¨^`+*¡\'?¿¡!|@#€\"\\ºª·\$%&/=?¿ÇçÑñ';

  void calculate(){
    _password.runes.forEach((int rune) {
  var character=new String.fromCharCode(rune);
  if(upper.contains(character)) uppercaseNumber++;
  else if(lower.contains(character)) lowercaseNumber++;
  else if(numbers.contains(character)) numbersNumber++;
  else  if(symbols.contains(character)) symbolNumber++;
  charNumber= uppercaseNumber + lowercaseNumber+ numbersNumber+symbolNumber;
  print('upper -> $uppercaseNumber');
  print('lower -> $lowercaseNumber');
  print('number -> $numbersNumber');
  print('symbol -> $symbolNumber');
  print('number of chars -> $charNumber');


});
  middleNumbersOrSymbols=numbersNumber+symbolNumber;
  if(numbers.contains(_password[0]) || symbols.contains(_password[0])) middleNumbersOrSymbols--;
   if(numbers.contains(_password[_password.length-1]) || symbols.contains(_password[_password.length-1])) middleNumbersOrSymbols--;
   print('middle numbers or Symbols -> $middleNumbersOrSymbols');
  }


  /*
  int uppercase=0;
  int lowercase=0;
  int number=0;
  int symbol=0;
  int middleNumbersOrSymbols=0;
  int requirements=0; 
*/

}