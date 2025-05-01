
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/tabs/ahadeth_tab.dart';
import 'package:islami/tabs/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/sebha_tab.dart';
import 'package:islami/tabs/setting_tab.dart';
import 'package:provider/provider.dart';

import 'my_theme_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  List<Widget>Tabs=[
    QuranTab(),SebhaTab(),AhadethTab(),RadioTab(),SettingTab()
  ];
  Widget build(BuildContext context){
    var pro=Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          pro.changeBackGround(),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.title, style: Theme.of(context).textTheme.bodyLarge),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTab,
            onTap: (index) {

              setState(() {
                currentTab = index;
              });
            },

            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                label: AppLocalizations.of(context)!.quran,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),

              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: AppLocalizations.of(context)!.sebha,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),

              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                label: AppLocalizations.of(context)!.ahadeth,
                backgroundColor:  Theme.of(context).colorScheme.secondary,
              ),

              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: AppLocalizations.of(context)!.radio,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings,
                backgroundColor:  Theme.of(context).colorScheme.secondary,
              ),
            ],


          ),
          body: Tabs[currentTab],
        ),
      ],
    );
  }
}




