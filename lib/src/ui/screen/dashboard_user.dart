import 'package:flutter/material.dart';

class DashboardUserInfo extends StatelessWidget{
  const DashboardUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.all(Radius.circular(10),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Selamat Datang,", style: Theme.of(context).textTheme.titleSmall),
          Text("Roy Hairul Anam", style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 10),
          Row(
            children: [
              Text('TRPL 2F', style: Theme.of(context).textTheme.bodySmall),
              Text(' - '),
              Text('362258302016', style: Theme.of(context).textTheme.bodySmall)
            ],
          )
        ]
      ),
     );
  }
}