import 'bloc_data.dart';

abstract class BaseBloc<D> {
  Stream<BlocData<D?>> get dataStream;

  void initState();

  void dispose();
}
