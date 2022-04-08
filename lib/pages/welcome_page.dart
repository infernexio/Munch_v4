import 'package:flutter/material.dart';
import 'package:munch_v4/res/colors.dart';
import 'package:munch_v4/widget/app_text.dart';
import 'package:munch_v4/widget/responsive_button.dart';
import '../widget/app_large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List text = [
    "Welcome to Munch \n where you will find you next favorite recipies",
    "Munch will allow you to use your ingridients to filter your results so all of you results will be tailored to your needs",
  ];

  List images = [
    "background1.jpeg",
    "background2.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           AppLargeText(
                              color: Colors.white, text: "Munch", size: 30),
                           AppText(
                              color: Colors.white, text: "Welcome", size: 30),
                           SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text: text[index],
                              color: Colors.white54,
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ResponsiveButton()
                        ],
                      ),
                      Column(
                        //should be images.length instead of 3
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots?25:8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:index ==indexDots?AppColors.mainColor1:AppColors.mainColor1.withOpacity(.3)
                                ),
                          );
                        }),
                      )
                    ],
                  )
                  ),
            );
          }),
    );
  }
}
