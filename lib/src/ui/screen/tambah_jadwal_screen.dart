import 'package:flutter/material.dart';
import './tambah_jadwal_header.dart';
import './tambah_jadwal_form.dart';


class AddJadwal extends StatelessWidget {
  const AddJadwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            child: const SingleChildScrollView(
              child: Column(
                  children: [
                    AddPeminjamanHeader(
                      title: "Membuat Jadwal Baru",
                      subTitle: "Menambahkan jadwal peminjaman ruang kelas.",
                      heightBetween: 40,
                      textAlign: TextAlign.left,
                    ),
                    AddJadwalForm()
                  ],
            ),)
        ),
      ),
    );
  }
}