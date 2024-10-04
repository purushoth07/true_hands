import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? gender;
  String? day;
  String? month;
  String? year;

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
        title: commonBoldText(text: 'My Profile', color: Colors.white),
        backgroundColor: state.themeData.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField('First Name', Icons.person, 'Mr'),
            SizedBox(height: 16),
            _buildInputField('Last Name', Icons.person, 'Singh'),
            SizedBox(height: 16),
            _buildDropdown('Gender', Icons.group, gender, ['Male', 'Female', 'Other'], (value) => setState(() => gender = value)),
            SizedBox(height: 16),
            commonBoldText(text: 'Date of Birth', fontSize: 12, color: Colors.black26),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildDateDropdown('Day', Icons.calendar_today, day,
                      List.generate(31, (i) => '${i + 1}'),
                          (value) => setState(() => day = value)
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildDateDropdown('Month', Icons.calendar_today, month,
                      ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                          (value) => setState(() => month = value)
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildDateDropdown('Year', Icons.calendar_today, year,
                      List.generate(100, (i) => '${DateTime.now().year - i}'),
                          (value) => setState(() => year = value)
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildInputField('Phone', Icons.phone, '01886***037'),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: fullIconColorButton(title: 'Save Changes', textColor: Colors.white, buttonColor: Colors.blueAccent, context: context, onPressed: (){})
            ),
          ],
        ),
      ),
    );
  },
);
  }

  Widget _buildInputField(String label, IconData icon, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonBoldText(text: label, fontSize: 16),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, IconData icon, String? value, List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonBoldText(text: label, fontSize: 16),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: commonText(text: value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildDateDropdown(String label, IconData icon, String? value, List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonBoldText(text: label, fontSize: 16),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}