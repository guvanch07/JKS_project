


import 'package:flutter/material.dart';

class TextFieldOfPolindrome extends StatelessWidget {
  const TextFieldOfPolindrome({
    Key? key,
    required TextEditingController controller,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          contentPadding:  EdgeInsets.all(15),
          focusedBorder:  OutlineInputBorder(
              borderRadius:  BorderRadius.all(Radius.circular(10.0)),
              borderSide:  BorderSide(color: Colors.green)),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.black)),
          border:  OutlineInputBorder(
              borderRadius:  BorderRadius.all(Radius.circular(10.0)),
              borderSide:  BorderSide(color: Colors.black)),
          hintText: 'input',
        ),
      ),
    );
  }
}
