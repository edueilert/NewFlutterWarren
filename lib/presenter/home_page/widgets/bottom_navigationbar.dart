import 'package:flutter/material.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int selectedIndex = 0;

  void onTappedIten(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.house,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on_outlined,
            ),
            label: 'Carteiras'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.equalizer_outlined,
            ),
            label: 'Movimentações'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(
        255,
        224,
        43,
        87,
      ),
      onTap: onTappedIten,
    );
  }
}
