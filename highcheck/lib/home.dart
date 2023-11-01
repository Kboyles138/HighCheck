import 'package:flutter/material.dart';
import 'package:help/widgets/palette.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  
    
    Container(
      color: palette['background'],
      child: Center(  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
               'helloworld :) ', 

                style: TextStyle(color: palette['text']),
              ),
            ],
          ),
        ),
    );
  }
}
