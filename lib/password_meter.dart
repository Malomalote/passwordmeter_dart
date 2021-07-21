class PassWordMeter {
  //additions
  int charNumber = 0;
  int uppercaseNumber = 0;
  int lowercaseNumber = 0;
  int numbersNumber = 0;
  int symbolNumber = 0;
  int middleNumbersOrSymbols = 0;
  int combinedRequirements = 0;
  int requirements = 0;
  //deductions
  int onlyLetter = 0;
  int onlyNumber = 0;
  int repeatCharacters = 0;
  int consecutiveUppercase = 0;
  int consecutiveLowercase = 0;
  int consecutiveNumber = 0;
  int sequentialLetter = 0;
  int sequentialNumber = 0;
  int sequentialSymbols = 0;

  int _score = 0;

  int get score => _score;

  String _password = '';

  String get password => _password;

  set password(String password) {
    _password = password;
    calculate();
  }

  //TODO solo para pruebas
  String _texto = '';
  String get texto => _texto;
  /////////////////

  String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lower = 'abcdefghijklmnopqrstuvwxyz';
  String numbers = '01234567890';
  String symbols = '(){}[],.-;:_´¨^`+*¡\'?¿¡!|@#€\"\\ºª·\$%&/=?¿ÇçÑñ';

  void calculate() {
    resetValues();

    _password.runes.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      if (upper.contains(character))
        uppercaseNumber++;
      else if (lower.contains(character))
        lowercaseNumber++;
      else if (numbers.contains(character))
        numbersNumber++;
      else if (symbols.contains(character)) symbolNumber++;
      charNumber = _password.length;
    });
    middleNumbersOrSymbols = numbersNumber + symbolNumber;
    if (numbers.contains(_password[0]) || symbols.contains(_password[0]))
      middleNumbersOrSymbols--;
    if (numbers.contains(_password[_password.length - 1]) ||
        symbols.contains(_password[_password.length - 1]))
      middleNumbersOrSymbols--;
    //requirements
    if (_password.length > 7) requirements++;
    if (uppercaseNumber > 0) combinedRequirements++;
    if (lowercaseNumber > 0) combinedRequirements++;
    if (numbersNumber > 0) combinedRequirements++;
    if (symbolNumber > 0) combinedRequirements++;
    if (combinedRequirements >= 3) requirements += combinedRequirements;

    charNumber *= 4;
    uppercaseNumber = (_password.length - uppercaseNumber) * 2;
    lowercaseNumber = (_password.length - lowercaseNumber) * 2;
    numbersNumber *= 4;
    symbolNumber *= 6;
    middleNumbersOrSymbols *= 2;
    requirements *= 2;
    _score = charNumber +
        uppercaseNumber +
        lowercaseNumber +
        numbersNumber +
        symbolNumber +
        middleNumbersOrSymbols +
        requirements;

    print('upper -> $uppercaseNumber');
    _texto += 'upper -> $uppercaseNumber\n';
    print('lower -> $lowercaseNumber');
    _texto += 'lower -> $lowercaseNumber\n';
    print('number -> $numbersNumber');
    _texto += 'number -> $numbersNumber\n';
    print('symbol -> $symbolNumber');
    _texto += 'symbol -> $symbolNumber\n';
    print('number of chars -> $charNumber');
    _texto += 'number of chars -> $charNumber\n';
    print('middle numbers or Symbols -> $middleNumbersOrSymbols');
    _texto += 'middle numbers or Symbols -> $middleNumbersOrSymbols\n';
    print('requirements -> $requirements');
    _texto += 'requirements -> $requirements\n';
        print('score -> $score');
    _texto += 'score -> $score\n';
  }

  void resetValues() {
    //additions
    charNumber = 0;
    uppercaseNumber = 0;
    lowercaseNumber = 0;
    numbersNumber = 0;
    symbolNumber = 0;
    middleNumbersOrSymbols = 0;
    combinedRequirements = 0;
    requirements = 0;
    //deductions
    onlyLetter = 0;
    onlyNumber = 0;
    repeatCharacters = 0;
    consecutiveUppercase = 0;
    consecutiveLowercase = 0;
    consecutiveNumber = 0;
    sequentialLetter = 0;
    sequentialNumber = 0;
    sequentialSymbols = 0;
    _score = 0;

    //TODO solo para pruebas, borrar
    _texto = '';
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
