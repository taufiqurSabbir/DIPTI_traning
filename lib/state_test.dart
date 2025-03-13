import 'package:flutter/material.dart';
class StateTest extends StatefulWidget {
   StateTest({super.key});

  @override
  State<StateTest> createState() => _StateTestState();
}

class _StateTestState extends State<StateTest> {
  int number = 0;

  plusNumber(){
    setState(() {
      number+=1;
    });

  }

   minusNumber(){
     setState(() {
       number-=1;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(number.toString(),style: TextStyle(
                fontSize: 70,fontWeight: FontWeight.bold
              ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: (){
                        plusNumber();
                      }, child: Text('+',style: TextStyle(fontSize: 25),)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),

                      onPressed: (){
                        minusNumber();
                      }, child: Text('-',style: TextStyle(fontSize: 25),))
                ],
              ),
            ],
        ),
      ),
    );
  }
}
