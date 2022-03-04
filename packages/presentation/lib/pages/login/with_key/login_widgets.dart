part of 'login_key.dart';

class _LoginButtonWithKey extends StatelessWidget {
  const _LoginButtonWithKey({
    Key? key,
    required this.formkey,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        onTap: () {
          if (formkey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CardMainPage()),
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

class _LoginPasswordWithKey extends StatelessWidget {
  const _LoginPasswordWithKey({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      error: '',
      obscure: true,
      onChanged: (String val) {},
      text: 'Login',
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*_)[a-zA-Z0-9_]+$')
                .hasMatch(value)) {
          return "enter correct email";
        } else {
          return null;
        }
      },
    );
  }
}

class _LoginEmailWithKey extends StatelessWidget {
  const _LoginEmailWithKey({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      error: '',
      obscure: false,
      onChanged: (String val) {},
      text: 'Login',
      validator: (value) {
        if (value!.isEmpty || !value.contains("@")) {
          return "enter correct email";
        } else {
          return null;
        }
      },
    );
  }
}
