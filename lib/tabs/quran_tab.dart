import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../my_theme_data.dart';
import '../sura_model.dart';
import '../sura_screen_details.dart';
class QuranTab extends StatelessWidget {
  List<String>suraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children:[
          Image.asset("assets/images/qur2an_screen_logo.png"),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2,
          ),
          Text(AppLocalizations.of(context)!.suraNames,style: Theme.of(context).textTheme.bodyMedium,),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2,
          ),
          Expanded(
            child: ListView.separated(itemBuilder: (context,index){
              return InkWell(
                onTap:(){
                  Navigator.pushNamed(context, SuraScreenDetails.routeName,
                  arguments: SuraModel(index: index,SuraName:suraNames[index]));
                } ,
                child: Text("${suraNames[index]}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight:FontWeight.bold ,
                ),
                  textAlign: TextAlign.center,),
              );
            },
              itemCount: suraNames.length,
              separatorBuilder: (context,index){
                return Divider(color: MyThemeData.primaryColor,
                  thickness: 2,endIndent: 60,indent: 60,);
              },),
          )
        ],
      ),
    );
  }
}
