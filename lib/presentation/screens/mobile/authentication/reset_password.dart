import 'package:flutter/material.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';

//theme
import 'package:truehands/bloc/theme/theme_bloc.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeBloc, ThemeState>(
  builder: (context, state) {
    return Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.lock_open_outlined,
                  size: 80,
                  color: state.themeData.primaryColor,
                ),
                const SizedBox(height: 20),
                commonBoldText(
                  text: "Reset Password",
                  fontSize: 27,
                ),
                SizedBox(height: 10),
                commonText(
                    text: "Enter a new Password",
                    color: Colors.grey
                ),
                SizedBox(height: 30),
                PrimaryIconInputText(hintText: 'New Password', onValidate: (v){}, obscureText: true, prefixIcon: Icons.lock_open_outlined, iconColor: Colors.black26, iconSize: 21),
                SizedBox(height: 20),
                PrimaryIconInputText(hintText: 'Confirm Password', onValidate: (v){}, obscureText: true, prefixIcon: Icons.lock_outline, iconColor: Colors.black26, iconSize: 21),
                SizedBox(height: 20),
                fullIconColorButton(title: 'Login',
                  buttonHeight: 50,
                  textColor: Colors.white, buttonColor: state.themeData.primaryColor, context: context, onPressed: (){},
                ),
              ],
            ),
          ),
        ),
      );
  },
),
    );
  }
}
