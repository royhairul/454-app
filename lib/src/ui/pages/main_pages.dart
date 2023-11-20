import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:upk_454_app/src/ui/pages/rekap_peminjaman/item.dart';


class DataTableDemo extends StatefulWidget {
  const DataTableDemo({super.key});

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}


class _DataTableDemoState extends State<DataTableDemo> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPK Poliwangi'),
      ),
      body: Center(
        child: FutureBuilder<List<PeminjamanModel>>( 
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<PeminjamanModel> data = snapshot.data!;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5, // Tambahkan elevasi untuk efek bayangan
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Tambahkan margin
                    child: ListTile(
                      leading: const Icon(Icons.flight_land),
                      title: Text(data[index].id),
                      subtitle: Text(data[index].namaPeminjam),
                      // Tambahkan animasi ketika item di-tap
                      onTap: () {
                        null;
                      },
                    ),
                  );
                },
              );
            }
          }
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Symbols.home_rounded),
            label: 'Home',
            activeIcon: Icon(Symbols.home_rounded, fill: 1,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.calendar_today_rounded),
            label: 'Jadwal',
            activeIcon: Icon(Symbols.calendar_today_rounded, fill: 1,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.summarize_rounded),
            label: 'Laporan',
            activeIcon: Icon(Symbols.summarize_rounded, fill: 1)
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.settings_rounded),
            label: 'Pengaturan',
            activeIcon: Icon(Symbols.settings_rounded, fill: 1,)
          ),
        ]
      )
    );
  }

  void filterData() {
    // String query = searchController.text.toLowerCase();
    // List<Map<String, dynamic>> filteredData = [];

    // if (query.isNotEmpty) {
    //   filteredData = data.where((item) {
    //     return item['name'].toLowerCase().contains(query) ||
    //         item['id'].toString().contains(query) ||
    //         item['age'].toString().contains(query);
    //   }).toList();
    // } else {
    //   filteredData = List.from(data);
    // }

    // setState(() {
    //   data = filteredData;
    // });
  }
}
