import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();


  bool checkPalindrome(String inputString) {
    for (int i = 0; i < inputString.length ~/ 2; i++) {
      if (inputString[i] != inputString[inputString.length - i - 1]) {
        return false;
      }
    }
    return true;
  }

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
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: controller,
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
      ),
            SizedBox(
              child:
              checkPalindrome(controller.text) == false //!state changing
                  ? const Text("it is not polindrome")
                  : const Text("it is polindrome"),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            checkPalindrome(controller.text);
          });
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
