

import 'package:domain/features/login/repository/validate_impl.dart';
import 'package:flutter/material.dart';


//! scoped instance

class Provider extends InheritedWidget{
  
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  final RegistrationImpl registrationImpl = RegistrationImpl();

  @override
  bool updateShouldNotify(_) => true;


  static RegistrationImpl of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).registrationImpl;
  }
}