//passwordmeter CLON
//original algorithm created by: Jeff Todnem
//you can see the original algorithm in http://www.passwordmeter.com/js/pwdmeter.js


class PassWordMeter {

  int _score = 0;

  int get score => _score;

  String _password = '';

  set password(String password) {
    _password = password;
    _score = 0;

    int additions = calculateAdd();
    int deductions = calculateDeductions();
    _score=additions-deductions;
  }

  String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lower = 'abcdefghijklmnopqrstuvwxyz';
  String numbers = '01234567890';
  String symbols = '(){}[],.-;:_´¨^`+*¡\'?¿¡!|@#€\"\\ºª·\$%&/=?¿ÇçÑñ';

  int calculateAdd() {
    int charNumber = 0;
    int uppercaseNumber = 0;
    int lowercaseNumber = 0;
    int numbersNumber = 0;
    int symbolNumber = 0;
    int middleNumbersOrSymbols = 0;
    int combinedRequirements = 0;
    int requirements = 0;

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
    if (uppercaseNumber > 0)
      uppercaseNumber = (_password.length - uppercaseNumber) * 2;
    if (lowercaseNumber > 0)
      lowercaseNumber = (_password.length - lowercaseNumber) * 2;
    numbersNumber *= 4;
    symbolNumber *= 6;
    middleNumbersOrSymbols *= 2;
    requirements *= 2;
    int totalAdditions = charNumber +
        uppercaseNumber +
        lowercaseNumber +
        numbersNumber +
        symbolNumber +
        middleNumbersOrSymbols +
        requirements;
    return totalAdditions;
  }

  int calculateDeductions() {
    int totalDeductions = 0;
    int onlyLetter = 0;
    int onlyNumber = 0;
    int repeatCharacters = 0;
    int consecutiveUppercase = 0;
    int consecutiveLowercase = 0;
    int consecutiveNumber = 0;
    int sequentialLetter = 0;
    int sequentialNumber = 0;
    int sequentialSymbols = 0;

    _password.runes.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      if (upper.contains(character.toUpperCase()))
        onlyLetter++;
      else if (numbers.contains(character)) onlyNumber++;
    });
    if (onlyLetter != _password.length) onlyLetter = 0;
    if (onlyNumber != _password.length) onlyNumber = 0;



    repeatCharacters = repeatChars();


    for (int i = 1; i < _password.length; i++) {
      if (upper.contains(_password[i]) && upper.contains(_password[i - 1]))
        consecutiveUppercase++;
      if (lower.contains(_password[i]) && lower.contains(_password[i - 1]))
        consecutiveLowercase++;
      if (numbers.contains(_password[i]) && numbers.contains(_password[i - 1]))
        consecutiveNumber++;
    }
    consecutiveUppercase *= 2;
    consecutiveLowercase *= 2;
    consecutiveNumber *= 2;


    //check sequences
    triplet(_password).forEach((value) {
      if (upper.contains(value.toUpperCase()) ||
          upper.contains(reverseString(value.toUpperCase())))
        sequentialLetter++;
      if (numbers.contains(value) || numbers.contains(reverseString(value)))
        sequentialNumber++;
      if (symbols.contains(value) || symbols.contains(reverseString(value)))
        sequentialSymbols++;
    });
    sequentialLetter *= 3;
    sequentialNumber *= 3;
    sequentialSymbols *= 3;


    totalDeductions = onlyLetter +
        onlyNumber +
        repeatCharacters +
        consecutiveUppercase +
        consecutiveLowercase +
        consecutiveNumber +
        sequentialLetter +
        sequentialNumber +
        sequentialSymbols;

    return totalDeductions;
  }

  String reverseString(String inputString) {
    return inputString.split('').reversed.join();
  }

  List<String> triplet(String inputString) {
    List<String> toReturn = [];
    if (inputString.length < 3)
      toReturn.add(inputString);
    else
      for (int i = 0; i < inputString.length - 2; i++)
        toReturn.add(inputString.substring(i, i + 3));
    return toReturn;
  }

  //from http://www.passwordmeter.com/
  int repeatChars() {

    var nRepetitions = 0;
    var nRepCharacter = 0;
    var nUniqueCharacter = 0;

    for (var a = 0; a < _password.length; a++) {
      var existsChar = false;
      for (var b = 0; b < _password.length; b++) {
        if (_password[a] == _password[b] && a != b) {
          existsChar = true;
          /* 
					Calculate icrement deduction based on proximity to identical characters
					Deduction is incremented each time a new match is discovered
					Deduction amount is based on total password length divided by the
					difference of distance between currently selected match
					*/
          nRepetitions += (_password.length / (b - a)).abs().ceil();
        }
      }
      if (existsChar) {
        nRepCharacter++;
        nUniqueCharacter = _password.length - nRepCharacter;
        nRepetitions = (nUniqueCharacter > 0)
            ? (nRepetitions / nUniqueCharacter).ceil()
            : (nRepetitions).ceil();
      }
    }
    return nRepetitions;
  }
}
