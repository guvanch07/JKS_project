import 'package:data/datadsource/login/datasource_login.dart';
import 'package:domain/repository/login/login_repositoy.dart';
import 'package:rxdart/rxdart.dart';

//*@Singleton(as: RegistrationBase) here would to use singlton
class RegistrationImpl with ValidationImpl implements LoginRepository {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  @override
  Stream<String> get email => _email.transform(validateEmail());

  @override
  Stream<String> get password => _password.transform(validatePasssword());

  @override
  Function(String) get setEmail => _email.sink.add;

  @override
  Function(String) get setPassword => _password.sink.add;

  @override
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  @override
  void dispose() {
    _email.close();
    _password.close();
  }
}
