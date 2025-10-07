import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BMI());
  }
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtControl = TextEditingController();
  var ftControl = TextEditingController();
  var inControl = TextEditingController();
  var result = "Your result will be displayed here";
  var bgClr = Color(0x9c82b2ff);
  var msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "BMI",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: bgClr,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Text(
                  "Calculate your BMI",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: wtControl,
                  decoration: InputDecoration(
                    hintText: "Enter weight (KGs):",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 8),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ftControl,
                  decoration: InputDecoration(
                    hintText: "Enter height (FTs):",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: inControl,
                  decoration: InputDecoration(
                    hintText: "Enter height (Inchs):",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    var wt = wtControl.text.toString();
                    var ft = ftControl.text.toString();
                    var inch = inControl.text.toString();
                    if (wt != "" && ft != "" && inch != "") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iIn = int.parse(inch);

                      var tinch = (ift * 12) + iIn;
                      var mtr = tinch * 0.0254;
                      var bmi = iwt / (mtr * mtr);
                      result = "Your BMI is: ${bmi.toStringAsFixed(4)}";
                      if (bmi < 18) {
                        bgClr = Colors.red.shade200;
                        msg = "You are under weight";
                      } else if (bmi > 25) {
                        bgClr = Colors.red.shade300;
                        msg = "You are over weight";
                      } else {
                        bgClr = Colors.green.shade200;
                        msg = "Your BMI is perfect";
                      }
                      wtControl.clear();
                      ftControl.clear();
                      inControl.clear();
                      setState(() {});
                    } else {
                      result = "Please fill all fields";
                      bgClr = Color(0x9c82b2ff);
                      msg = "";
                      setState(() {});
                    }
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "$result",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  "$msg",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
