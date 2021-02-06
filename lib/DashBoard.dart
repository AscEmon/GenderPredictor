import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var result;
  TextEditingController name = TextEditingController();

  Future sendName(String genderName) async {
    var baseurl = "https://api.genderize.io/?name=$genderName";
    var res = await http.get(baseurl);
    var body = jsonDecode(res.body);
    result = "Gender: ${body['gender']}, Probability: ${body['probability']}";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "You Can Check Your Gender, So Please Write down your Name",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: name,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    
                    labelText: "Name",
                    hintText: "Enter Your Name",
                    labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.deepOrangeAccent,
                    )),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            ElevatedButton(
              onPressed: () {
                
                 setState(() {
                 String names=name.text;
                 if(names.isEmpty){
                   print("write down your name");
                 }
                 else{
                    sendName(names);
                    name.clear();
                 }
                
                 });
            
                 
              },
              child: Text("Predict",style: TextStyle(fontSize: 24),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.green;
                    return Colors.deepOrangeAccent; // Use the component's default.
                  },
                ),
                minimumSize: MaterialStateProperty.resolveWith<Size>(
                  (Set<MaterialState>states){
                    return Size(140,50
                       );
                  }
                ),
              ),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Center(
              child:
               Text(
              result!=null?result:'',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
