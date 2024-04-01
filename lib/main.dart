import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = ""; //this time string is empty

  TextEditingController t1 = TextEditingController(); //or you can use this
// i am using this method
  var text1 = TextEditingController(); //you can use this
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Material(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: t1,
                  decoration: InputDecoration(
                    hintText: "write your text",
                    labelText: "FullName",
                    border: OutlineInputBorder(),
                  ),
                ),

// i am taking button
//
//
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        name = t1.text.toString();
                        t1.clear();
// i want to remove textfild text by button click.....
// and i want to show textfield text below the button
//
// lets see

                        //miniproject is save in "name"
//user is writing something in text field,
//so name string  is saving the current user's data
                      });
                    },
                    child: Text('click_me')),

                SizedBox(height: 10),

                Text("$name"),

// Displaying data //miniproject
              ],
            ),
          ),
        ),
      ),
    );
  }
}
