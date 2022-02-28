class HomeData {
   bool? isPalindromeOrNot;
   String palindromeInput = '';
   HomeData(this.isPalindromeOrNot, this.palindromeInput);
   factory HomeData.init() => HomeData(null, 'unselected');
   HomeData copy() => HomeData(isPalindromeOrNot, palindromeInput);
 }