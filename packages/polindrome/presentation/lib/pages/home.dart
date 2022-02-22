

import 'package:domain/usecases/base_impl.dart';
import 'package:flutter/material.dart';
import 'package:presentation/widgets/text_field.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  final PolindromeImpl _polindromeImpl = PolindromeImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldOfPolindrome(controller: _controller),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child:
              _polindromeImpl.checkPalindrome(_controller.text) == false //!state changing
                  ? const Text("it is not polindrome")
                  : const Text("it is polindrome"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            _polindromeImpl.checkPalindrome(_controller.text); //! call back
          });
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
