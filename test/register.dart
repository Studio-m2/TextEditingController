import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var width = TextEditingController();
  var feet = TextEditingController();
  var Inch = TextEditingController();
  var displaymessage = "";

  int selectgender = 0;

  var message = "";

  var color = Colors.black45;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Color(0xffc5c5c5),
          onPressed: () {
            var wt = width.text.toString();
            var ft = feet.text.toString();
            var inc = Inch.text.toString();

            if (wt == "" && ft == "" && inc == "") {
              setState(() {
                displaymessage = "please fill all info";
              });
            } else {
              var w = int.parse(wt); //convert into int
              var f = int.parse(ft);
              var i = int.parse(inc);

              var total_inch = (f * 12) * i;

              var total_centimeter = total_inch * 2.53;
              var total_meter = total_centimeter / 100;

              var bmi_formula = w / (total_meter * total_meter); // w/m*m

              if (bmi_formula > 25) {
                message = 'you are overweight';
                color = Colors.amber;
              } else if (bmi_formula < 18) {
                message = 'you are underweight';
                color = Colors.blue;
              } else {
                message = 'you are healthy';
                color = Colors.pink;
              }

              setState(() {
                displaymessage =
                    "$message \n Your BMI IS : ${bmi_formula.toStringAsFixed(3)}";
              });
            }
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('BMI'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Material(
          child: Container(
            color: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectgender = 0;
                            });
                          },
                          icon: Icon(Icons.female),
                          color: selectgender == 0 ? Colors.red : Colors.black,
                          iconSize: 30,
                        ),
                        Text('Female'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectgender = 1;
                            });
                          },
                          icon: Icon(Icons.male),
                          color: selectgender == 1 ? Colors.red : Colors.black,
                          iconSize: 30,
                        ),
                        Text('Male'),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                  child: TextField(
                    controller: width,
                    decoration: InputDecoration(
                      labelText: 'Please Enter your Width',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                  child: TextField(
                    controller: feet,
                    decoration: InputDecoration(
                      labelText: 'Please Enter your Feet',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                  child: TextField(
                    controller: Inch,
                    decoration: InputDecoration(
                      labelText: 'Please Enter your Inch',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  displaymessage.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
