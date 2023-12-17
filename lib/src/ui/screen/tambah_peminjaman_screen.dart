import 'package:flutter/material.dart';
import './tambah_peminjaman_header.dart';
import './tambah_peminjaman_form.dart';
import './register_footer.dart';


class AddPeminjaman extends StatelessWidget {
  const AddPeminjaman({Key? key}) : super(key: key);

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
                      title: "Membuat Pengajuan",
                      subTitle: "Pengajuan peminjaman ruang kelas",
                      heightBetween: 40,
                      textAlign: TextAlign.left,
                    ),
                    AddPeminjamanForm()
                  ],
            ),)
        ),
      ),
    );
  }
}