import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../language_bootom_sheet.dart';
import '../my_theme_data.dart';
import '../providers/my_provider.dart';
import '../theme_bottom_sheet.dart';
class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap:()=> showBottomSheetLanguage(context),
            child: Container(
              margin:  EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border:Border.all(width: 2,color: MyThemeData.primaryColor)
              ),
              child: Row(
                children: [
                provider.languageCode=="en"? Text(AppLocalizations.of(context)!.english):Text(AppLocalizations.of(context)!.arabic),
                  Spacer(),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(AppLocalizations.of(context)!.appearance),
          InkWell(
            onTap:()=> showBottomSheetTheme(context)
            ,
            child: Container(
              margin:  EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border:Border.all(width: 2,color: MyThemeData.primaryColor)
              ),
              child: Row(
                children: [
                  provider.appMode==ThemeMode.light? Text(AppLocalizations.of(context)!.light):Text(AppLocalizations.of(context)!.dark),
                  Spacer(),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
  showBottomSheetLanguage(context){
    showModalBottomSheet(
      isScrollControlled: false,
        shape:OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )
        ) ,
        context: context,
        builder: (context)=>LanguageBootomSheet());
  }
  showBottomSheetTheme(context){
    showModalBottomSheet(
        isScrollControlled: false,
        shape:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )
        ) ,
        context: context,
        builder: (context)=>ThemeBottomSheet());
  }

}
