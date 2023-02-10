import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTapController,
  });
  final int currentIndex;
  final Function(dynamic page) onTapController;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.app_registration),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: ''),
      ],
      onTap: widget.onTapController,
    );
  }
}
