import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
      Center(
        child: Image.asset("assets/images/radio_image.png"),
      ),
      SizedBox(height: 60,),
      Text(AppLocalizations.of(context)!.radioTitle,
          style: Theme.of(context,).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onPrimary, ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90,),
            Image.asset("assets/images/Group 7.png",color:Theme.of(context).colorScheme.onSurface,),
          ],
        )


      ],
    );
  }
}