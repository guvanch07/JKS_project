import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    Key? key,
    this.globalKey,
    this.focusNode,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final GlobalKey? globalKey;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.globalKey,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: _isPasswordHidden,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(8, 9, 0, 9),
        suffixIcon: IconButton(
          color: const Color(0xFF4C4C4C),
          icon: Icon(
            _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(
              () {
                _isPasswordHidden = !_isPasswordHidden;
              },
            );
          },
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFFD3D2D2),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF9EDC15),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFFFF4B4B),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFFFF4B4B),
          ),
        ),
      ),
    );
  }
}
