import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(


          backgroundColor: Colors.white,

          elevation: 0.0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://img-c.udemycdn.com/user/200_H/124090828_295e.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Chats ',
                  style: TextStyle(

                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[200],
                  child: IconTheme(
                    data: IconThemeData(color: Colors.black),
                    child: Icon(
                      Icons.camera_alt,
                    ),
                  )),
              onPressed: () {},
            ),
            IconButton(
              icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[200],
                  child: IconTheme(
                    data: IconThemeData(color: Colors.black),
                    child: Icon(Icons.edit),
                  )),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Search'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
               Container( height: 135,
                 child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                     itemBuilder: (context, index)=>buildStoryItem(),
                   separatorBuilder: (context, index)=>SizedBox(
                     width: 20,
                   ),

                   itemCount: 10,
                 ),
               ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                    itemBuilder: (context, index)=>buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 20,

                  ),
                  itemCount: 10,

                )
              ],
            ),
          ),
        ));



   }

  Widget buildStoryItem(){
    return    Container(
      width: 70,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://img-c.udemycdn.com/user/200_H/124090828_295e.jpg'),

                backgroundColor: (Colors.grey[200]),
              ),
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 3, bottom: 3),
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Ma7moud Hussien Kassem',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],

        // backgroundImage: NetworkImage('https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      ),
    );
  }

  Widget buildChatItem(){
    return  Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://img-c.udemycdn.com/user/200_H/124090828_295e.jpg'),
              backgroundColor: (Colors.grey[200]),
            ),
            CircleAvatar(
              radius: 11,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding:
              const EdgeInsetsDirectional.only(end: 3, bottom: 3),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 15,

        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mahmoud Kassem',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),

              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'hello my name is mahmoud hussien kassem ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                      '13 Jul'
                  ),
                ],
              )
            ],
          ),

        )
      ],
    );
   }


}
