import 'package:domain/usecases/base_impl.dart';
import 'base_bloc.dart';
import 'home_data.dart';

abstract class HomeBloc extends BaseBloc{

  factory HomeBloc (
    PalindromeUseCase palindromeUseCase
  ) => _HomeBloc(palindromeUseCase);

  void checkPalindrome();

   void setPalindromeString(String palindrome);

}

class _HomeBloc extends BlocImpl implements HomeBloc{

  final PalindromeUseCase _palindromeUseCase;

  _HomeBloc(this._palindromeUseCase);

  final _screenData = HomeData.init();

  bool _isLoading = false;


  //! emmitting
  void updateData(){
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy()
    );
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void dispose() {
    _palindromeUseCase.dispose();
    super.dispose();
  }

  @override
  void checkPalindrome() async{
    _isLoading = true;
    updateData();

    _screenData.isPalindrome = await _palindromeUseCase(
      _screenData.palindromeInput
    );

    _isLoading = false;
    updateData();
  }

  @override
  void setPalindromeString(String palindrome) {
    _screenData.palindromeInput = palindrome;
  }
  
}