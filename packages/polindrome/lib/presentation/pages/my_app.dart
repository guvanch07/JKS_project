import 'package:flutter/material.dart';
import 'package:polindrome/domain/usecases/base_impl.dart';
import 'package:polindrome/presentation/widgets/text_field.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const _MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class _MyHomePage extends StatefulWidget {

  const _MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
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
