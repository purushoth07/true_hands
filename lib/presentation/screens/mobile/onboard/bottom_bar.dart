import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/screens/mobile/Funds/fundList.dart';
import 'package:truehands/presentation/screens/mobile/onboard/dashboard.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

import 'package:truehands/presentation/screens/mobile/service/request.dart';

import 'package:truehands/presentation/screens/mobile/profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    ServiceRequestPage(),
    FundList(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[_currentIndex],
          floatingActionButton: SizedBox(
            width: 58, // Reduced size
            height: 58, // Reduced size
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/emergency');
              },
              child: Icon(Icons.video_call_outlined, size: 28, color: Colors.white,),
              // Slightly reduced icon size
              backgroundColor: state.themeData.focusColor,
              shape: CircleBorder(),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
          bottomNavigationBar: BottomNavBar(
            onTabSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}

class BottomNavBar extends StatefulWidget {
  final Function(int) onTabSelected;

  BottomNavBar({required this.onTabSelected});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.zero,
          height: 60,
          child: BottomAppBar(
            color: state.themeData.primaryColor,
            shape: const CircularNotchedRectangle(
            ),
            notchMargin: 0, // Slightly reduced notch margin
            child: Container(
              height: 45, // Reduced from 56 to 50 (approximately 10% reduction)
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, Icons.home_outlined, 'Home'),
                  _buildNavItem(1, Icons.search_outlined, 'Service'),
                  SizedBox(width: 44), // Slightly reduced space for FAB
                  _buildNavItem(2, Icons.monetization_on_outlined, 'Funds'),
                  _buildNavItem(3, Icons.person, 'Profile'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTabSelected(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        // Reduced padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white54,
              size: 20, // Reduced from 24 to 22
            ),
            SizedBox(height: 1), // Reduced from 2 to 1
            commonBoldText(
                text: label,
                color: isSelected ? Colors.white : Colors.white54,
                fontSize: 10
            ),
          ],
        ),
      ),
    );
  }
}