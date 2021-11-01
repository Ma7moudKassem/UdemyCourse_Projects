import 'package:flutter/material.dart';
import 'package:kassem_app/models/user/user_model.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name:  'mahmoud kassem',
      phone: '01224176035',
    ),
    UserModel(
      id: 2,
      name:  'ahmed kassem',
      phone: '0122422435',
    ),
    UserModel(
      id: 3,
      name:  'mahmoud kassem',
      phone: '01224463636',
    ),
    UserModel(
      id: 4,
      name:  'mahmoud kassem',
      phone: '01224176035',
    ),
    UserModel(
      id: 5,
      name:  'ahmed kassem',
      phone: '0122422435',
    ),
    UserModel(
      id: 6,
      name:  'mahmoud kassem',
      phone: '01224463636',
    ),
    UserModel(
      id: 1,
      name:  'mahmoud kassem',
      phone: '01224176035',
    ),
    UserModel(
      id: 2,
      name:  'ahmed kassem',
      phone: '0122422435',
    ),
    UserModel(
      id: 3,
      name:  'mahmoud kassem',
      phone: '01224463636',
    ),
    UserModel(
      id: 4,
      name:  'mahmoud kassem',
      phone: '01224176035',
    ),
    UserModel(
      id: 5,
      name:  'ahmed kassem',
      phone: '0122422435',
    ),
    UserModel(
      id: 6,
      name:  'mahmoud kassem',
      phone: '01224463636',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'

        ),

      ),
      body:ListView.separated(itemBuilder: (context, index)=>buildUserItem(users[index]),
          separatorBuilder: (context, index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [

        CircleAvatar(
          radius: 25,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(

                '${user.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )

            ),
            Text(
                '${user.phone}'
            )
          ],
        ),

      ],
    ),
  );


}

