



import 'package:flutter/material.dart';

import 'package:kassem_app/layout/social_app/cubit/cubit.dart';

import 'package:kassem_app/shared/styles/icons_broken.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              margin: EdgeInsets.all(8.0),


              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image(
                    image: NetworkImage('https://image.freepik.com/free-photo/beautiful-young-brunette-woman-with-pleasant-appearance-tender-smile_273609-18319.jpg'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Communicate with your friends',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 13,color: Colors.white),),
                  )
                ],
              ),
            ),


            ListView.builder(

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:  (context , index) => buildPostItem(context),

                itemCount: 10)
          ],
        ),
      ),
    );



  }
  Widget buildPostItem (context)=> Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 10,
    margin: EdgeInsets.all(5.0),


    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(

                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/28678377?s=400&u=c999d565f91333a8d9b57917ddd788f5046a3d4d&v=4'),
                    radius: 25,
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Mahmoud Hussien',

                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  height: 1.4
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.blueAccent,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),

                          ],

                        ),
                        Text('October 1, 2021 at 12.00 PM',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              height: 1.4
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 20,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15
                ),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: TextStyle(
                    height: 1.3,
                    fontSize: 15
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10,
                    top: 5
                ),
                child: Container(
                  width: double.infinity,
                  child: Wrap(

                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            end: 6
                        ),
                        child: Container(
                          height: 25,
                          child: MaterialButton(onPressed: (){},
                            minWidth: 1,

                            padding: EdgeInsets.zero,
                            child: Text(
                              '#Software',
                              style: TextStyle(
                                  color: Colors.blue
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            end: 6
                        ),
                        child: Container(
                          height: 25,
                          child: MaterialButton(onPressed: (){},
                            minWidth: 1,

                            padding: EdgeInsets.zero,
                            child: Text(
                              '#Flutter',
                              style: TextStyle(
                                  color: Colors.blue
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage('https://image.freepik.com/free-photo/man-filming-with-professional-camera_23-2149066323.jpg'),
                      fit: BoxFit.cover
                  ),

                ),
                width: double.infinity,
                height: 200,






              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              size: 20,
                              color: Colors.red,

                            ),
                            SizedBox(width: 5,),
                            Text(
                              '1000',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){},
                    ),
                  ),
                  Expanded(
                    child: InkWell(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              IconBroken.Chat,
                              size: 20,
                              color: Colors.amber,

                            ),
                            SizedBox(width: 5,),
                            Text(
                              '120 Comments',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){},
                    ),
                  ),

                ],
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          CircleAvatar(

                            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/28678377?s=400&u=c999d565f91333a8d9b57917ddd788f5046a3d4d&v=4'),
                            radius: 18,
                          ),
                          SizedBox(width: 15,),
                          Text('Write a comment ...',

                              style: Theme.of(context).textTheme.caption
                          ),

                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 25,
                            color: Colors.red,

                          ),
                          SizedBox(width: 5,),
                          Text(
                            'Like',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                  SizedBox(
                    width: 20,
                  ),

                ],
              ),


            ],
          ),
        )
      ],
    ),
  );
}
