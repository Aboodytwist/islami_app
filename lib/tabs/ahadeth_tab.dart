import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AhadethModel.dart';
import '../ahadeth_screen.dart';
import '../my_theme_data.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethModel> allAhadeth = [];
  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadFile();
    }
    return Column(

      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(thickness: 5, color: MyThemeData.primaryColor),
        Text(
          "الاحاديث",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),

        Divider(thickness: 5, color: MyThemeData.primaryColor),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AhadethScreen.routeName,
                    arguments: allAhadeth[index],
                  );
                },
                child: Text(
                  "${allAhadeth[index].title}",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: MyThemeData.primaryColor,
                endIndent: 70,
                indent: 70,
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  loadFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        List<String> hadethLine = ahadethList[i].trim().split("\n");
        String title = hadethLine[0];
        hadethLine.removeAt(0);
        List<String> content = hadethLine;
        allAhadeth.add(AhadethModel(title: title, content: content));
      }

      setState(() {});
    });
  }
}
