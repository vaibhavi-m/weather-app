import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: (){
              apicall();
            },child: Text("call api"),),
            FutureBuilder(future: apicall(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data);
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}

Future<String> apicall() async{
  final url=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=bangalore&appid=db8607c33021539def854e36a4afe645");
  final response= await http.get(url);
  print(jsonDecode(response.body)["weather"][0]["description"]);
  String output=jsonDecode(response.body)["weather"][0]["description"];
  return output;
}

