part of 'login.dart';

class _EmailStream extends StatelessWidget {
  const _EmailStream({
    Key? key,
    required this.register,
  }) : super(key: key);
 final RegistrationImpl register;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("login"),
        ),
        StreamBuilder(
          stream: register.email,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return LoginTextField(
              obscure: false,
              text: "email",
              
              onChanged: register.setEmail,
              error: snapshot.hasError ? snapshot.error.toString() : "",
            );
          },
        ),
      ],
    );
  }
}

class _PasswordStream extends StatelessWidget {
  const _PasswordStream({
    Key? key,
    required this.register,
  }) : super(key: key);
 final RegistrationImpl register;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("password"),
        ),
        StreamBuilder(
          stream: register.password,
          builder: (context, snapshot) {
            return LoginTextField(
              obscure: true,
              text: "password",
              onChanged: register.setPassword,
              error: snapshot.hasError ? snapshot.error.toString() : "", 
            );
          },
        ),
      ],
    );
  }
}




class _ButtonStream extends StatelessWidget {
  const _ButtonStream({
    Key? key,
    required this.register,
  }) : super(key: key);
 final RegistrationImpl register;
 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: register.submitValid,
      builder: (context, snapshot) {
        return PrimaryButton(
          onTap: snapshot.hasData ? 
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CardMainPage()),)
          :() =>
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Ups!'),),),
          
          text: "Login");
      },
    );
  }
}
