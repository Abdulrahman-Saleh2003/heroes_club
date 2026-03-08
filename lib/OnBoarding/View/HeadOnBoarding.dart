import 'package:flutter/material.dart';
import 'package:heroes_club/core/constant/AppColor.dart';

class HeadOnBoarding extends StatelessWidget {
  const HeadOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return         Row(

      children: [




        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(" skip",style: TextStyle(color:AppMyColor.greyApp,fontSize: 20 ),),
        ),
        Spacer(),


        Text("نادي الابطال",style: TextStyle(color:AppMyColor.yellowApp,fontSize: 20,fontWeight: FontWeight.bold ),),
        Padding(
          padding: const EdgeInsets.only(left: 7.0,right: 10),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppMyColor.yellowApp,
            child:
            Icon(Icons.fitness_center,color: AppMyColor.blackApp,size: 24,),

          ),
        ),
      ],

    );
  }
}
