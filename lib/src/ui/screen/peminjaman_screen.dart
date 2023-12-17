import 'package:flutter/material.dart';
import 'dashboard_peminjaman.dart';
import 'package:upk_454_app/src/ui/widgets/bottom_navigation.dart';

class PeminjamanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text("Peminjaman", style: Theme.of(context).textTheme.headlineSmall)
        ),
        body: const SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                DashboardPeminjaman()
              ],
            ),
        ),
        bottomNavigationBar: const CustomBottomNavigation(currentIndex: 1)
      ),
    );
  }
}