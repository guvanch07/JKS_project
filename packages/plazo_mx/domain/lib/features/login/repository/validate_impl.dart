

import 'handle_data.dart';
import 'package:rxdart/rxdart.dart';

abstract class RegistrationBase{
   Stream<String> get email;
   Stream<String> get password;
   Stream<bool> get submitValid;

   Function(String) get setEmail;
   Function(String) get setPassword;

   void dispose();
}

class RegistrationImpl with ValidationImpl implements RegistrationBase{

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
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) => true);


      @override
  void dispose() {
    _email.close();
    _password.close();
    
  }

  
}