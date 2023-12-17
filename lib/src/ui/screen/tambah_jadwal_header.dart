import 'package:flutter/material.dart';

class AddPeminjamanHeader extends StatelessWidget {
  const AddPeminjamanHeader({
    Key? key,
    this.heightBetween,
    required this.title,
    required this.subTitle,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  //Variables -- Declared in Constructor
  final double? heightBetween;
  final String title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}