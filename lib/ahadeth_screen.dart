import 'package:flutter/material.dart';
import 'AhadethModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'my_theme_data.dart';
class AhadethScreen extends StatelessWidget {
  static const String routeName = "AhadethScreen";

  @override
  Widget build(BuildContext context) {
    AhadethModel args =
        ModalRoute.of(context)?.settings.arguments as AhadethModel;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.title, style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 8,
              color: Theme.of(context).colorScheme.primary,

              child: Column(
                children: [
                  SizedBox(height: 2,),
                     Text(
                      "${args.title}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  Divider(
                    color: MyThemeData.primaryColor,
                    thickness: 2,
                    endIndent: 80,
                    indent: 80,
                  ),

                  Expanded(
                    
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "${args.content[index]}",
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          indent: 50,
                          endIndent: 50,
                          thickness: 1.5,
                        );
                      },
                      itemCount: args.content.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
