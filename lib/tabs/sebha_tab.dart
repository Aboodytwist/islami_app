import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 33;
  int currentThkirIndex = 0;
  List<String> athkar = [
    'سبحان الله',
    'الحمدلله',
    'الله أكبر',
    'سبحان الله وبحمده',
  ];

updateCounter() {
    setState(() {
      if (counter > 1) {
        counter--;
      } else {
        currentThkirIndex = (currentThkirIndex + 1) % athkar.length;
        counter = 33;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/sebha.png",

          ),
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.tasbehatCount,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
              color:Theme.of(context).colorScheme.onPrimary,

          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE5D8C2),
          ),
          child: Text(
            "$counter",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: updateCounter,
          style: ElevatedButton.styleFrom(
            backgroundColor:Theme.of(context).colorScheme.onSurface ,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            athkar[currentThkirIndex],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}