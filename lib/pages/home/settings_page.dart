import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_v4/widget/app_icon.dart';
import 'package:munch_v4/widget/settings_widget.dart';

import '../../res/app_constants.dart';
import '../../res/colors.dart';
import '../../res/dimensions.dart';
import '../../widget/app_large_text.dart';
import '../../widget/food_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: AppLargeText(
          text: "Settings",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(children: [
          AppIcon(
            icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            size: Dimensions.height15 * 10,
            iconSize: Dimensions.height45 + Dimensions.height30,
            iconColor: Colors.white,
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SettingsWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconSize: Dimensions.height10 * 5 / 2,
                        iconColor: Colors.white,
                      ),
                      appLargeText: AppLargeText(
                        text: "Person",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  SettingsWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconSize: Dimensions.height10 * 5 / 2,
                        iconColor: Colors.white,
                      ),
                      appLargeText: AppLargeText(
                        text: "Person",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  SettingsWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconSize: Dimensions.height10 * 5 / 2,
                        iconColor: Colors.white,
                      ),
                      appLargeText: AppLargeText(
                        text: "Person",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  SettingsWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconSize: Dimensions.height10 * 5 / 2,
                        iconColor: Colors.white,
                      ),
                      appLargeText: AppLargeText(
                        text: "Person",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  SettingsWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconSize: Dimensions.height10 * 5 / 2,
                        iconColor: Colors.white,
                      ),
                      appLargeText: AppLargeText(
                        text: "Person",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  SettingsWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconSize: Dimensions.height10 * 5 / 2,
                        iconColor: Colors.white,
                      ),
                      appLargeText: AppLargeText(
                        text: "Person",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  SettingsWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height10 * 5,
                        iconSize: Dimensions.height10 * 5 / 2,
                        iconColor: Colors.white,
                      ),
                      appLargeText: AppLargeText(
                        text: "Person",
                      )),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
