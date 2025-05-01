import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/sura_model.dart';
class SuraScreenDetails extends StatefulWidget {
  static const String routeName ="SuraScreenDetails";

  @override
  State<SuraScreenDetails> createState() => _SuraScreenDetailsState();
}

class _SuraScreenDetailsState extends State<SuraScreenDetails> {
  List<String>verses=[];

  loadfile (int index)async{
String file =await rootBundle.loadString("assets/files/${index+1}.txt");
List<String>lines=file.split("\n");

verses=lines;
print(verses);
setState(() {

});
}

  @override
  Widget build(BuildContext context) {
    SuraModel args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
    loadfile(args.index);}
    return
       SafeArea(
         child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/background.png")
            ,fit: BoxFit.fill)
          ),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(AppLocalizations.of(context)!.title, style: Theme.of(context).textTheme.bodyLarge),
            ),
            body:Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 6,
                  color: Theme.of(context).colorScheme.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("سورة${args.SuraName}",textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,),
                      Divider(color:  Theme.of(context).colorScheme.secondary,thickness: 1,indent: 70,endIndent: 70,),
                      Expanded(
                        child: ListView.separated(itemBuilder: (context,index){
                          return Text("${verses[index]} (${index+1})"
                            ,style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,);
                        }, separatorBuilder: (context,index)=>Divider(
                          thickness: 1,
                          endIndent: 70,
                          indent: 70,
                        ), itemCount: verses.length),
                      )

                    ],

                  ),
                ),
              ),
            ),
          ),
               ),
       );


  }
}
