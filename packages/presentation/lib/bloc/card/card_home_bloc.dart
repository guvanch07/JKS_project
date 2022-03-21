import 'package:presentation/bloc/card/home_bloc.dart';
import 'package:presentation/core/base_bloc_const/base_bloc.dart';
import 'package:domain/usecase/card/card_usecase.dart';

abstract class CardHomeBloc extends BaseBloc {
  factory CardHomeBloc(GetCardUseCase _cardUseCase) =>
      _CardHomeBloc(_cardUseCase);

  void getCards();
}

class _CardHomeBloc extends BlocImmpl implements CardHomeBloc {
  final GetCardUseCase _cardUseCase;

  _CardHomeBloc(this._cardUseCase);

  final _screenData = CardHomeData.init();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getCards() async {
    _isLoading = true;
    _updateData();

    _screenData.cardModel = await _cardUseCase();

    _isLoading = false;
    _updateData();
  }

  void _updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void dispose() {
    _cardUseCase.dispose();
    super.dispose();
  }
}
