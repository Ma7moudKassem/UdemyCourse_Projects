

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kassem_app/modules/bmi_app/bmi_result/BMIResultScreen.dart';


class BmiScreem extends StatefulWidget {


  @override
  _BmiScreemState createState() => _BmiScreemState();
}

class _BmiScreemState extends State<BmiScreem> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(

                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                 'assets/images/male.png',

                                ),
                              width: 90,
                              height: 90,
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                         color: isMale ? Colors.blue :  Colors.grey[200],


                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale= false;
                        });
                      },
                      child: Container(

                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(image: AssetImage(
                             'assets/images/female.png'
                           ),
                           width: 90,
                           height: 90,
                           ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isMale ?Colors.grey[200] : Colors.blue  ,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize:25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                         '${height.round()}',
                          style: TextStyle(
                            fontSize:40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: height,
                        min: 80.0,
                        max: 220.0,
                        onChanged: (value){

                          setState(() {
                            height = value;
                          });
                        }
                    ),

                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Row(

                children: [
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'AGE',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),

                          ),
                          Text(
                              '$age',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                mini: true,
                              child: Icon(
                                Icons.remove,
                              ),
                              heroTag: 'age--',
                              ) ,
                              SizedBox(width: 15,),
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                mini: true,

                              child: Icon(
                                Icons.add,

                              ),
                                heroTag: 'age--',
                              ),
                            ],
                          )
                        ],

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                                heroTag: 'weight--',
                              ) ,
                              SizedBox(width: 15,),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,

                                child: Icon(
                                  Icons.add,

                                ),
                                heroTag: 'weight++',
                              ),
                            ],
                          )
                        ],

                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Container(
             decoration: BoxDecoration(
               color: Colors.blue,
               borderRadius: BorderRadius.circular(20),
             ),
             width: double.infinity,

             child: MaterialButton(
                 onPressed: (){
                   double result = weight/pow(height/100,2);
                   print(result.round() );
                   Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>BMIScreenResult(
                     result: result.round(),
                     isMale: isMale,
                     age: age,
                   ),
                   ),
                   );
                 },
               child: Text(
                 'CALCULATE',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold

                 ),
               ),

             ),
           ),
         )
        ],
      ),
    );
  }
}
