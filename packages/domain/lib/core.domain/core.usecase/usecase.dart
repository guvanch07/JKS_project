abstract class UseCase<Output> {
  Output call();

  void dispose();
}

abstract class UseCaseParms<Parms, Output> {
  Output call(Parms parms);
  void dispose();
}
