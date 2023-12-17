import 'package:flutter/material.dart';
import 'dashboard_jadwal.dart';
import 'package:upk_454_app/src/ui/widgets/bottom_navigation.dart';

class JadwalScreen extends StatelessWidget {
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
          title: Text("Jadwal", style: Theme.of(context).textTheme.headlineSmall)
        ),
        body: const SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                DashboardSchedule()
              ],
            ),
        ),
        bottomNavigationBar: const CustomBottomNavigation(currentIndex: 3)
      ),
    );
  }
}