
import 'package:flutter/material.dart';
import 'package:presentation/core/helpers/primary_button.dart';

import '../core/helpers/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Login",style: Theme.of(context).textTheme.headline2,),
          ),
          SearchTextField(obscure: false, text: 'Email',type: TextInputType.emailAddress,),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Password",style: Theme.of(context).textTheme.headline2,),
          ),
          SearchTextField(obscure: true, text: 'Password',
          type: TextInputType.emailAddress,
          widget: IconButton(
          icon: Icon(Icons.remove_red_eye),
          onPressed: (){},),),
          Spacer(),
          Center(child: PrimaryButton(onTap: (){}, text: "Login")),
        ],
      ),)
    );
  }
}

