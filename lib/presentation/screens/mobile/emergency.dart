import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: commonBoldText(text: 'Emergency', color: Colors.white),
        backgroundColor: state.themeData.primaryColor,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonBoldText(text:
                        'Are you Sure you want Emergency Trigger?',
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: commonBoldText(text: 'Yes', color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: commonBoldText(text: 'No', color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      commonBoldText(text: 'If Yes?'),
                      CheckboxListTile(
                        title: commonText(text: 'Send Notification to Back office team'),
                        value: false,
                        onChanged: (bool? value) {},
                        contentPadding: EdgeInsets.zero,
                      ),
                      CheckboxListTile(
                        title: commonText(text: 'Daily Call to Back office team?'),
                        value: false,
                        onChanged: (bool? value) {},
                        contentPadding: EdgeInsets.zero,
                      ),
                      CheckboxListTile(
                        title: commonText(text: 'Display My Contacts'),
                        value: false,
                        onChanged: (bool? value) {},
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              commonBoldText(text: 'My Contacts?'),
              SizedBox(height: 8),
              _buildContactCard('My Contact 1', '+91 1234567890'),
              SizedBox(height: 8),
              _buildContactCard('My Contact 2', '+91 1234567890'),
            ],
          ),
        ),
      ),
    );
  },
);
  }

  Widget _buildContactCard(String name, String number) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Icon(Icons.check, color: Colors.green),
        ),
        title: commonText(text: name),
        subtitle: commonText(text: number),
      ),
    );
  }
}