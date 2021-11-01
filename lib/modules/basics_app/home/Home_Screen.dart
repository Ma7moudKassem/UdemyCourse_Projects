import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
              onPressed: () {
              print('Menu');
            },
            icon: Icon(Icons.menu),
          ),
          title: Text('Kassem'),
          actions: [
            IconButton(
                onPressed: () {
                  print('Search');
                },
                icon: Icon(Icons.search)),
            IconButton(
              onPressed: () {
                print('notifiction');
              },
              icon: Icon(
                Icons.notification_important,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                 borderRadius: BorderRadiusDirectional.only(
                   topStart:Radius.circular(20)
                 )

                ) ,
                clipBehavior:Clip.antiAliasWithSaveLayer,   //very imprtant 
                child: Stack(
                  alignment:Alignment.bottomCenter,

                  children: [

                    Image(
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
                      ),
                    ),
                    Container( padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),


                      color: Colors.black.withOpacity(0.6),
                      width: 200,
                      child: Text(
                        'Flowers', textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20, color: Colors.white,

                           ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
