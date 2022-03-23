part of 'login_key.dart';

class _LoginButtonWithKey extends StatelessWidget {
  const _LoginButtonWithKey({
    Key? key,
    required this.formkey,
    required this.textField,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;
  final Map<String, String> textField;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        onTap: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState?.save();
            //! send to data

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Greate!!!'),
              ),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ups!'),
            ),
          );
        },
        text: "Login");
  }
}

String login = 'Login';
String password = 'Password';

class _LoginPasswordWithKey extends StatelessWidget {
  const _LoginPasswordWithKey({
    Key? key,
    required this.textField,
  }) : super(key: key);

  final Map<String, String> textField;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      obscure: true,
      onChanged: (String val) {},
      text: login,
      validator: (value) => validateEmail(value ?? ""),
      onSaved: (val) => textField[login] = val ?? "",
    );
  }

  String? validateEmail(String formEmail) {
    if (formEmail.isEmpty) return "E-mail is requried.";

    String pattern = r'\w+@\W+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(formEmail)) return "Invalid E-mail Adress format";
    return null;
  }
}

class _LoginEmailWithKey extends StatelessWidget {
  const _LoginEmailWithKey({
    Key? key,
    required this.textField,
  }) : super(key: key);

  final Map<String, String> textField;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      obscure: false,
      onChanged: (String val) {},
      text: password,
      validator: (value) => validatePassword(value ?? ""),
      onSaved: (val) => textField[password] = val ?? "",
    );
  }

  String? validatePassword(String formPassword) {
    if (formPassword.isEmpty) return "E-mail is requried.";

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(formPassword)) return "Invalid E-mail Adress format";
    return null;
  }
}
