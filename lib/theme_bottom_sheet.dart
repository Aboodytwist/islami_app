import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';


class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 25,horizontal: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*.3,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                pro.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.light),
                  Spacer(),
                 pro.appMode==ThemeMode.light? Icon(Icons.done):Container()
                ],
              ),
            ),
            SizedBox(height: 5,),
            Divider(color: Theme.of(context).colorScheme.secondary ,indent: 70,endIndent: 70,),
            SizedBox(height: 3.5,),
            InkWell(
              onTap: (){
                pro.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.dark),
                  Spacer(),
                  pro.appMode==ThemeMode.dark? Icon(Icons.done):Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
