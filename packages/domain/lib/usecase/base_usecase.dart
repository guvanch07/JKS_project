abstract class UseCaseParams<Params, Output> {
  Output call(Params params);
  void dispose();
}
