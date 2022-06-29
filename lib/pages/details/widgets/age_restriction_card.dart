import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/constants.dart';

class AgeRestrictionCard extends StatelessWidget {
  const AgeRestrictionCard({Key? key, required this.age}) : super(key: key);

  final int age;

  @override
  Widget build(BuildContext context) {
    Color color = (age >= 13) ? Colors.red[400]! : Colors.blue;
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding + 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        width: 45,
        height: 40,
        child: Center(
          child: Text(
            age.toString(),
            style: textStyle.copyWith(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
