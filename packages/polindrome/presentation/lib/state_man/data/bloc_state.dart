
class BlocData<A> {
  bool isloading;
  A? data;
  BlocData(
    this.isloading,
    this.data,
  );
void updateParams({
  bool? isloading,
  A? data,
}) {

  if (isloading != null) this.isloading = isloading;
  if (data != null) this.data = data;
}
BlocData <A?> copy<A>() => BlocData(isloading, data as A?);
factory BlocData.init() => BlocData(false, null);
}


