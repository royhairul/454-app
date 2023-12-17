import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPeminjamanForm extends StatefulWidget {
  const AddPeminjamanForm({super.key});

  @override
  _AddPeminjamanFormState createState() => _AddPeminjamanFormState();
}

class _AddPeminjamanFormState extends State<AddPeminjamanForm> {
  final _peminjamanRuangController = TextEditingController();
  final _peminjamanJamMulaiController = TextEditingController();
  final _peminjamanJamSelesaiController = TextEditingController();
  final _peminjamanTanggalController = TextEditingController();

  List<String> ListRuangKelas = <String> [
    'TRPL', 'TRK', 'BD'
  ];
  late String listRuangSelected = ListRuangKelas.first;

  DateTime selectedDate = DateTime.now();
  String? datePicked;

  TimeOfDay selectedTimeStart = TimeOfDay.now();
  String? timePickedStart;

  TimeOfDay selectedTimeFinish = TimeOfDay.now();
  String? timePickedFinish;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: listRuangSelected,
              items: ListRuangKelas.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value
                );
              }).toList(),
              isExpanded: true,
              isDense: true,
              onChanged: (String? value) {
                setState(() {
                  listRuangSelected = value!;
                });
              },
              decoration: const InputDecoration(
                  label: Text("Ruang Kelas"),
                  prefixIcon: Icon(Icons.meeting_room_outlined),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 50 - 20),
            TextFormField(
              controller: _peminjamanTanggalController,
              onTap: () async{
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2101),
                );

                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                    datePicked = DateFormat('yyyy-MM-dd').format(selectedDate);
                    _peminjamanTanggalController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                  });
                }
              },
              decoration: const InputDecoration(
                  labelText: 'Tanggal Peminjaman',
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                  border: OutlineInputBorder()
              ),
              readOnly: true,
            ),
            const SizedBox(height: 50 - 20),
            Row(
              children: [
                Flexible( child:TextFormField(
                  controller: _peminjamanJamMulaiController,
                  decoration: const InputDecoration(
                      label: Text("Mulai"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.schedule_outlined)
                  ),
                  onTap: () async{
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: selectedTimeStart
                    );

                    if (picked != null && picked != selectedTimeStart) {
                      setState(() {
                        selectedTimeStart = picked;
                        _peminjamanJamMulaiController.text = selectedTimeStart.format(context);
                      });
                    }
                  },
                  readOnly: true,
                )),
                const SizedBox(width: 30),
                Flexible(
                  child: TextFormField(
                  controller: _peminjamanJamSelesaiController,
                  decoration: const InputDecoration(
                      label: Text("Selesai"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.schedule_outlined)
                  ),
                  onTap: () async{
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: selectedTimeFinish
                    );

                    if (picked != null && picked != selectedTimeFinish) {
                      setState(() {
                        selectedTimeFinish = picked;
                        _peminjamanJamSelesaiController.text = selectedTimeFinish.format(context);
                      });
                    }
                  },
                  readOnly: true,
                ),)
              ],
            ),
            const SizedBox(height: 50 - 20),
            DropdownButtonFormField(
              value: listRuangSelected,
              items: ListRuangKelas.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  listRuangSelected = value!;
                });
              },
              decoration: const InputDecoration(
                  label: Text("Mata Kuliah"),
                  prefixIcon: Icon(Icons.local_library_outlined),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 50 - 20),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(maximumSize: Size.fromWidth(MediaQuery.of(context).size.width)),
            //   onPressed: () {},
            //   child: const Text("Masuk"),
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Ajukan"),
              ),
            )
          ],
        )
      );
  }
}