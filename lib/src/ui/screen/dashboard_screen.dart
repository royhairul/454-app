import 'package:flutter/material.dart';
import 'dashboard_user.dart';
import 'dashboard_jadwal.dart';
import 'dashboard_peminjaman.dart';
import 'package:upk_454_app/src/ui/widgets/bottom_navigation.dart';

class DashboardScreen extends StatelessWidget {
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
          title: Text("UPK Poliwangi", style: Theme.of(context).textTheme.headlineSmall),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.face)),
            )
          ]
        ),
        body: const SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                DashboardUserInfo(),
                DashboardSchedule(),
                DashboardPeminjaman()
              ],
            ),
        ),
        bottomNavigationBar: const CustomBottomNavigation(currentIndex: 0,)
      ),
    );
  }
}