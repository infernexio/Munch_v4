import 'package:flutter/material.dart';
import '../res/colors.dart';
import '../res/dimensions.dart';
import 'Icon&text.dart';
import 'app_large_text.dart';
import 'app_text.dart';

class AppFoodInfo extends StatelessWidget {
  final text;
  const AppFoodInfo({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLargeText(text: this.text,size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            AppText(text: "4.5"),
            SizedBox(
              width: Dimensions.width15,
            ),
            AppText(text: "1287"),
            SizedBox(
              width: Dimensions.width5,
            ),
            AppText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(

                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndText(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconAndText(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}
