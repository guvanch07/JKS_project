import '../repository/base.dart';

class PolindromeImpl extends Polindrome{
  @override
  bool checkPalindrome(String inputString) {
    for (int i = 0; i < inputString.length ~/ 2; i++) {
      if (inputString[i] != inputString[inputString.length - i - 1]) {
        return false;
      }
    }
    return true;
  }
}