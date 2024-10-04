import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.themeData.primaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: commonBoldText(text: 'Notification', color: Colors.white),
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: commonBoldText(
                  text: 'Today ${DateFormat('dd MMM, yyyy').format(
                      DateTime.now())}',
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    NotificationItem(
                      icon: Icons.calendar_today,
                      color: Colors.blue,
                      message: 'Your have appointment with mahuba islam at 9:00 pm today',
                      time: 'Just Now',
                    ),
                    NotificationItem(
                      icon: Icons.person_outline,
                      color: Colors.orange,
                      message: 'Complete your profile to be better health consult.',
                      time: '25 Minutes ago',
                      actionText: 'Complete Profile',
                    ),
                    NotificationItem(
                      icon: Icons.event,
                      color: Colors.amber,
                      message: 'Your have appointment with Kawsar ahmed at 2:00am tomorrow',
                      time: 'Just Now',
                    ),
                    NotificationItem(
                      icon: Icons.check_circle_outline,
                      color: Colors.green,
                      message: 'Your have appointment with islam at 8:00pm sunday',
                      time: 'Just Now',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String message;
  final String time;
  final String? actionText;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.color,
    required this.message,
    required this.time,
    this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(text: message, fontSize: 16),
                if (actionText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: commonBoldText(
                        text: actionText!, color: Colors.blue),
                  ),
                SizedBox(height: 4),
                commonText(text: time, fontSize: 14, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}