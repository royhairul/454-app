import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex: currentIndex,
          fixedColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (item) {
            if (item == 0) Navigator.pushNamed(context, '/dashboard');
            if (item == 1) Navigator.pushNamed(context, '/peminjaman');
            if (item == 2) {
              showModalBottomSheet(
                context: context, 
                builder: (BuildContext context) {
                  return Container(
                      height: 200,
                      padding: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.redAccent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                padding: const EdgeInsets.all(5),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Icon(Icons.close),
                            )),
                            Container(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                  child: const Row( children : [
                                    Icon(Icons.assignment_add, color: Colors.black54),
                                    SizedBox(width: 20),
                                    Text('Buat peminjaman baru')
                                  ])
                                )  
                                ),
                            ),
                            Container(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                  child: const Row( children : [
                                    Icon(Icons.assignment_add, color: Colors.black54),
                                    SizedBox(width: 20),
                                    Text('Buat jadwal baru')
                                  ])
                                )  
                                ),
                            ),
                          ],
                      ),
                    );  
                }
              );
            }
            if (item == 3) Navigator.pushNamed(context, '/jadwal');
            if (item == 4) Navigator.pushNamed(context, '/user');
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              activeIcon: Icon(Icons.assignment),
              label: "Peminjaman"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
              ),
              label: "Tambah"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today),
              label: "Jadwal"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face_outlined),
              activeIcon: Icon(Icons.face),
              label: "User",
            ),
  ]);
  }
} 

