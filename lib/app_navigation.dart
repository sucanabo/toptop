import 'package:flutter/material.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black87,
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w400
        ),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black87,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon( Icons.home_outlined), activeIcon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),activeIcon: Icon(Icons.shopping_basket), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),activeIcon: Icon(Icons.chat),label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),activeIcon: Icon(Icons.person) ,label: 'Profile'),
        ],
      ),
    );
  }
}
