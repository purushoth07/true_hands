import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonBoldText(text: 'Mr Rakesh Kumar', color: Colors.white),
                    commonText(text: 'User',
                        color: Colors.orangeAccent,
                        fontSize: 14),
                  ],
                ),
              ],
            ),
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image.png'),
                // Replace with actual image
                radius: 20,
              ),
              SizedBox(width: 20)
            ],
            backgroundColor: state.themeData.primaryColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _buildPersonalInfoCard(context: context),
                SizedBox(height: 20),
                _buildOptionCard('My Appointment'),
                _buildOptionCard('History'),
                _buildOptionCard('Favorite Doctor'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPersonalInfoCard({required BuildContext context}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonBoldText(text: 'Personal Info', fontSize: 18),
                SizedBox(height: 16),
                _buildInfoRow('Name', 'Mr Singh'),
                _buildInfoRow('Date of Birth', '11 Jan 2000'),
                _buildInfoRow('Gender', 'Male'),
                _buildInfoRow('Phone', '018868**37'),
                _buildInfoRow('Email', 'singh@gmail.com'),
                _buildInfoRow('Location', 'India'),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(text: label, color: Colors.grey, fontSize: 16),
          commonText(text: value, fontSize: 16),
        ],
      ),
    );
  }

  Widget _buildOptionCard(String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: commonBoldText(text: title, fontSize: 16),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          // Handle option tap
        },
      ),
    );
  }
}