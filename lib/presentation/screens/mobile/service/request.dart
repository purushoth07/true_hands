import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

class ServiceRequestPage extends StatefulWidget {
  @override
  _ServiceRequestPageState createState() => _ServiceRequestPageState();
}

class _ServiceRequestPageState extends State<ServiceRequestPage> {
  String? _selectedRequestType;
  String? _selectedPaymentMethod;

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
        title: commonBoldText(text: 'Service Request', color: Colors.white),
        backgroundColor: state.themeData.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownField('Request Type', ['1', '2', '3'], (value) {
              setState(() => _selectedRequestType = value);
            }),
            _buildInputField('Description'),
            _buildInputField('Screen Shot'),
            _buildInputField('Prefered Date & Time'),
            _buildDropdownField('Payment Method', ['COD', 'Online'], (value) {
              setState(() => _selectedPaymentMethod = value);
            }),
            SizedBox(height: 20),
            ElevatedButton(
              child: commonBoldText(text: 'Save', color: Colors.white),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Handle save logic here
              },
            ),
          ],
        ),
      ),
    );
  },
);
  }

  Widget _buildInputField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonBoldText(text: label, fontSize: 16),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonBoldText(text: label, fontSize: 16),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}