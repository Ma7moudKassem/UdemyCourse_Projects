
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kassem_app/modules/news_app/webview/web_view.dart';
import 'package:kassem_app/shared/cubit/cubit.dart';
import 'package:kassem_app/shared/styles/icons_broken.dart';

Widget defaultButton({
  double width: double.infinity,
  Color background: Colors.blue,
  bool isUpperCase = true,
  @required double height,
  @required String text,
  @required Function function,
  @required double radius,
}) =>
    Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),

      //width: double.infinity,

      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );


Widget defaultTextButton ({
  @required Function function,
  @required String text,

})=> TextButton(onPressed: function, child: Text(text.toUpperCase()));

Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required IconData prefix,
  @required String lapelText,
  Function onSubmitted,
  Function onChanged,
  Function onTap,
  @required Function validate,
  bool isPassword = false,
  IconData suffix,
  Function suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      obscureText: isPassword,
      validator: validate,
      keyboardType: type,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        labelText: lapelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

Widget buildTaskItem(Map model, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Dismissible(
        key: Key(model['id'].toString()),
        onDismissed: (direction) {
          AppCubit.get(context).deleteDatabase(id: model['id']);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 40,
                child: Text(
                  '${model['time']} ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model['title']}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${model['date']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updateDatabase(
                      status: 'done',
                      id: model['id'],
                    );
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updateDatabase(
                      status: 'archive',
                      id: model['id'],
                    );
                  },
                  icon: Icon(
                    Icons.archive,
                    color: Colors.black45,
                  ))
            ],
          ),
        ),
      ),
    );

Widget tasksBuilder({
  @required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );

Widget buildArticleItem(article , context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              width: 120,
  
              height: 120,
  
              decoration: BoxDecoration(
  
                  borderRadius: BorderRadius.circular(10),
  
                  image: DecorationImage(
  
                      image: NetworkImage('${article['urlToImage']}'),
  
                      fit: BoxFit.cover)),
  
            ),
  
            SizedBox(
  
              width: 20,
  
            ),
  
            Expanded(
  
              child: Container(
  
                height: 120,
  
                child: Column(
  
                  // mainAxisSize: MainAxisSize.min,
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  children: [
  
                    Expanded(
  
                      child: Text(
  
                        '${article['title']}',
  
                        style: Theme.of(context).textTheme.bodyText1,
  
                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text('${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
);

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 30),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        height: 1,
      ),
    );

Widget articleBuilder(list, context,{isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 10),
      fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void navigateTo(context , widget) =>  Navigator.push(context, MaterialPageRoute(
builder: (context)=>widget,
),
);

void navigateAndFinish(context , widget) =>  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
builder: (context)=>widget,
),
    (Route<dynamic> route)=>false,
);

void showToast ({
  @required String text,
})=> Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0
);

Widget defaultAppBar({
  @required BuildContext context ,
  Widget title,
  List<Widget> actions ,
  double titleSpacing,
})=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(IconBroken.Arrow___Left_2),
  ),
  title: title,
  titleSpacing: titleSpacing,
  actions: actions,
);