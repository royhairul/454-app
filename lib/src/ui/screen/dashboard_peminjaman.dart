import 'package:flutter/material.dart';

class DashboardPeminjaman extends StatelessWidget{
  const DashboardPeminjaman({
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
        'jadwal_matakuliah': 'Beda',
        'jadwal_jam_mulai': '10:00',
        'jadwal_jam_selesai': '11:40',
      },
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Daftar Peminjaman", style: Theme.of(context).textTheme.bodyMedium),
          Text("Ruang Kelas", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  color: Colors.amber,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.event_note_rounded),
                        title: Text(list[index]['jadwal_matakuliah']!,),
                        subtitle: Text(list[index]['jadwal_matakuliah']!,),
                        // Tambahkan animasi ketika item di-tap
                        onTap: () {
                          print("Clicked");
                        },
                      ),
                );
              }
            )
        ],
    ),
  );
  }
}