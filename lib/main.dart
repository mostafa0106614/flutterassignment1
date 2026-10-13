import 'dart:math';

import 'package:flutter/material.dart';

void main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title : "playDice",
      theme :ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange , brightness: Brightness.dark )

      ),
      home : playDice(),
    );
  }
}

class playDice extends StatefulWidget {
  @override
  State<playDice> createState() => playDiceState();
}

class playDiceState extends State<playDice>{
  int value_1 = 1 ;
  int value_2 = 1 ;
  int total = 2 ;

  void reset() {
    setState(() {
      value_1 = 1;
      value_2 = 1;
      total = 2;
    });
  }
    void roll(){
      setState(() {
        value_1 = Random().nextInt(6) +1;
        value_2 = Random().nextInt(6) +1;
        total = value_1 + value_2 ;
      });
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
          appBar : AppBar(title: Text('Play Dice',
          style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize:22),
          ),
          centerTitle: true,
          backgroundColor:Theme.of(context).colorScheme.primary),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(
              children: [
                SizedBox(height: 10,),
                Text("Total is $total"),
                SizedBox(height: 120,),
                Image.asset(
                  'assets/images/dice_$total.png',
                  width: 240,
                  height: 200,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Container(
                  width: 70,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                   ),
                   child:Text(
                       "$value_1",
                   style: TextStyle(
                     fontSize: 48,
                     fontWeight: FontWeight.bold,
                     color:Colors.black,
                   ),),
                ),
                    SizedBox(width: 10,),
                    Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child:Text(
                          "$value_2",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color:Colors.black,
                      ),),
                    ),

                  ],
                ),
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: ElevatedButton(onPressed: roll, child: Text("roll"))),
                    SizedBox(width: 20,),
                    Expanded(child: ElevatedButton(onPressed: reset, child: Text("reset")))

                  ]),
              ],
            )
          )

      );


    }
  }
