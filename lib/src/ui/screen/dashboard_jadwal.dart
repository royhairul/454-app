import 'package:flutter/material.dart';

class DashboardSchedule extends StatelessWidget{
  const DashboardSchedule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const list = [
      {
        'jadwal_matakuliah': 'Statistika',
        'jadwal_jam_mulai': '10:00',
        'jadwal_jam_selesai': '11:40',
      },
      {
        'jadwal_matakuliah': 'Statistika',
        'jadwal_jam_mulai': '10:00',
        'jadwal_jam_selesai': '11:40',
      },
      {
        'jadwal_matakuliah': 'Statistika',
        'jadwal_jam_mulai': '10:00',
        'jadwal_jam_selesai': '11:40',
      },
      {
        'jadwal_matakuliah': 'Statistika',
        'jadwal_jam_mulai': '10:00',
        'jadwal_jam_selesai': '11:40',
      },
    ];
    return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jadwal Hari Ini,", style: Theme.of(context).textTheme.bodyMedium),
        Text("16 Desember 2023", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: null,
              child: SizedBox(
                  width: 320,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black12),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              list[index]['jadwal_matakuliah']!,
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                list[index]['jadwal_jam_mulai']!,
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(" - "),
                              Text(
                                list[index]['jadwal_jam_selesai']!,
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ]
                      )
                    )
                  )
              )
            )
          )
        )
      ],
    ),
  );
  }
}