import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/social_app/cubit/cubit.dart';
import 'package:kassem_app/layout/social_app/cubit/states.dart';
import 'package:kassem_app/modules/shop_app/settings/settings_screen.dart';
import 'package:kassem_app/modules/social_app/new_post/new_post_screen.dart';
import 'package:kassem_app/modules/social_app/notifications/notifications_screen.dart';
import 'package:kassem_app/modules/social_app/search/search_screen.dart';
import 'package:kassem_app/modules/social_app/settings/settings_screen.dart';
 // import 'package:kassem_app/modules/social_app/social_signup/cubit/cubit.dart';
import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/styles/icons_broken.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {


        var cubit = SocialCubit.get(context);




        return Scaffold(
            appBar: AppBar(

              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
              actions: [

                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(
                      IconBroken.Search,

                    )),
                IconButton(
                    onPressed: () {
                      navigateTo(context, ProfileScreen());
                    },
                    icon:Icon(
                      IconBroken.Profile,
                      size: 25,
                    )),
                SizedBox(width: 10,)
              ],
            ),
            bottomNavigationBar: BubbleBottomBar(
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              opacity: .2,
              currentIndex: cubit.currentIndex,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              elevation: 6,
              fabLocation: BubbleBottomBarFabLocation.end, //new
              hasNotch: true,
              //new
              hasInk: true, //new, gives a cute ink effect
              inkColor: Colors.black12,
              //optional, uses theme color if not specified
              items: <BubbleBottomBarItem>[
                BubbleBottomBarItem(
                    backgroundColor: Color(0xff0148a4),
                    icon: Icon(
                      IconBroken.Home,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(
                      IconBroken.Home,
                      color: Color(0xff0148a4),
                    ),
                    title: Text("Home")),
                BubbleBottomBarItem(
                    backgroundColor: Colors.blue,
                    icon: Icon(
                      IconBroken.Chat,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(
                      IconBroken.Chat,
                      color: Colors.blue,
                    ),
                    title: Text("Chats")),
                BubbleBottomBarItem(
                    backgroundColor: Colors.cyan,
                    icon: Icon(
                      IconBroken.User,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(
                      IconBroken.User,
                      color: Colors.cyan,
                    ),
                    title: Text("Users")),
                BubbleBottomBarItem(
                    backgroundColor: Colors.green,
                    icon: Icon(
                      IconBroken.Notification,
                      color: Colors.black,

                    ),
                    activeIcon:Icon(
                      IconBroken.Notification,
                      color: Colors.green,
                    ),

                    title: Text("Notifications")),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateTo(context, NewPostScreen());
              },
              child: Icon(
                IconBroken.Paper_Plus,
                size: 35,
              ),
              backgroundColor: Color(0xff0148a4),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            body: cubit.screens[cubit.currentIndex]);
      },
    );
  }
}





//ConditionalBuilder(
//             condition: SocialCubit.get(context).model != null,
//             builder: (context)
//             {
//               // var model = FirebaseAuth.instance.currentUser.emailVerified;
//               // print(model);
//
//
//               return  Column(
//                 children: [
//
//                   // if (!model)
//                   // Container(
//                   //   color: Colors.amber.withOpacity(0.7),
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.symmetric(
//                   //         horizontal: 15
//                   //     ),
//                   //     child: Row(
//                   //       children: [
//                   //         Icon(
//                   //           Icons.info_outline,
//                   //         ),
//                   //         SizedBox(
//                   //           width : 15,
//                   //         ),
//                   //         Expanded(child: Text('Please verify your E-mail')),
//                   //         SizedBox(
//                   //           width : 15,
//                   //         ),
//                   //         defaultTextButton(function: (){
//                   //           FirebaseAuth.instance.currentUser.sendEmailVerification()
//                   //               .then((value) {
//                   //                 showToast(text: 'Check your E-mail');
//                   //           })
//                   //               .catchError((error){});
//                   //         }, text:'Send ')
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               );
//             },
//             fallback: (context) => Center(child: CircularProgressIndicator()),
//           ),