import 'package:flutter/material.dart';

import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';

class JyotisheeSocial extends StatelessWidget {
  const JyotisheeSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: AppStrings.jyotisheeSocial, showProfile: true,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.colorPrimary, onPressed: () {

      },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(15),
                  child: Column(
                  children: [
                    SquareNetworkImageAvatar(
                      radius: 12,
                      height: 80,
                      width: 120,
                      image: "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                    ),
                    6.height,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.colorPrimary,
                          child: CircleNetworkImageAvatar(
                              radius: 12,
                              image:
                              "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                        ),
                      10.width,
                        Text("Ram Yadav",style: AppStyle.black12.copyWith(fontSize: 10,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              ),),
            ),
            Post(type: PostType.text,showSave: true,),
            Post(type: PostType.video,showSave: true,),
            Post(type: PostType.text,showSave: true,),
            Post(type: PostType.image,showSave: true,),
          ],
        ),
      ),
    );
  }
}
