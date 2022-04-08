
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_v4/controllers/ingredients_controller.dart';
import 'package:munch_v4/pages/home/main_food_page.dart';
import 'package:munch_v4/pages/home/scanner_page.dart';
import 'package:munch_v4/pages/home/settings_page.dart';
import 'package:munch_v4/pages/ingredients/ingredients_page.dart';
import '../../res/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key,}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _selectedindex = 0;
List pages = [
  MainFoodPage(),
  IngredientsPage(),
  ScannerPage(),
  SettingsPage(),
];

void onTaped(int index){
  setState(() {
    _selectedindex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _selectedindex,
        onTap: onTaped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste_outlined),
            label: "Ingredients",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
