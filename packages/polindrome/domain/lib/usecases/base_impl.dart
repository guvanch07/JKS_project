import '../repository/base.dart';


import 'usecase.dart';

class PalindromeUseCase implements UseCase<String, Future<bool>> {
   @override
   Future<bool> call(String params) async {
     await Future.delayed(Duration(seconds: 5));
     final isPalindrome = params == params.split('').reversed.toList().join('');
     return Future.value(isPalindrome);
   }

   @override
   void dispose() {
     /// clearing resources
   }
 }



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