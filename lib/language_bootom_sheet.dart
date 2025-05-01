import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'my_theme_data.dart';
class LanguageBootomSheet extends StatelessWidget {
  const LanguageBootomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of<MyProvider>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 25,horizontal: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*.3,
        child: Column(
          children: [
            InkWell(
              onTap:(){
                provider.changeLanguage("en");
                Navigator.pop(context);
              } ,
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.english),
                  Spacer(),
                provider.languageCode=="en"? Icon(Icons.done):Container()
                ],
              ),
            ),
            SizedBox(height: 5,),
            Divider(color:MyThemeData.primaryColor ,indent: 70,endIndent: 70,),
            SizedBox(height: 3.5,),
            InkWell(
              onTap:(){
                provider.changeLanguage("ar");
                Navigator.pop(context);
              } ,
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.arabic),
                  Spacer(),
                  provider.languageCode=="en"? Container():Icon(Icons.done)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
