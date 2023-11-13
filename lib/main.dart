import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "454 App",
      home: DataTableDemo(),
      debugShowCheckedModeBanner: false
    );
  }
}

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({super.key});

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}


class _DataTableDemoState extends State<DataTableDemo> {
  List<Map<String, dynamic>> data = [
    {'id': 1, 'kelas': 'TRPL 2F', 'matkul': "Metode dan Model Pengembangan Perangkat Lunak", 'ruang': 'C2.1'},
    {'id': 2, 'kelas': 'TRPL 1E', 'matkul': "Matematikan Diskrit", 'ruang': 'C3.2'},
    {'id': 3, 'kelas': 'TRPL 2A', 'matkul': "Analisa Rekayasa Kebutuhan Perangkat Lunak", 'ruang': 'C2.3'},
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPK Poliwangi'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Implement search functionality here
                      filterData();
                    },   
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Kelas')),
                    DataColumn(label: Text('Mata Kuliah')),
                    DataColumn(label: Text('Ruang')),
                  ],
                  rows: data
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(Text(item['id'].toString())),
                          DataCell(Text(item['kelas'])),
                          DataCell(Text(item['matkul'])),
                          DataCell(Text(item['ruang'])),
                        ],
                      ),
                    )
                    .toList(),
                ),
              ),
            )
          ]
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
    String query = searchController.text.toLowerCase();
    List<Map<String, dynamic>> filteredData = [];

    if (query.isNotEmpty) {
      filteredData = data.where((item) {
        return item['name'].toLowerCase().contains(query) ||
            item['id'].toString().contains(query) ||
            item['age'].toString().contains(query);
      }).toList();
    } else {
      filteredData = List.from(data);
    }

    setState(() {
      data = filteredData;
    });
  }
}
