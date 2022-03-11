class HomeData {
  String? registrationStep;
  String? email;
  String? password;

  HomeData(this.email, this.password, this.registrationStep);
  factory HomeData.init() => HomeData(null, null, null);
  HomeData copy() => HomeData(email, password, registrationStep);
}
