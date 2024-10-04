import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/bloc/theme/theme_data.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 80,
                      color: state.themeData.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    commonBoldText(
                      text: "Let's Sign in",
                      fontSize: 27,
                    ),
                    SizedBox(height: 10),
                    commonText(
                        text: "Welcome Back, You've been missed!",
                        color: Colors.grey
                    ),
                    SizedBox(height: 30),
                    PrimaryIconInputText(hintText: 'Email', onValidate: (v){}, prefixIcon: Icons.email_outlined, iconColor: Colors.black26, iconSize: 21),
                    SizedBox(height: 20),
                    PrimaryIconInputText(hintText: 'Password', onValidate: (v){}, obscureText: true, prefixIcon: Icons.key_outlined, iconColor: Colors.black26, iconSize: 21),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: true,
                            onChanged: (value) {},
                            activeColor: state.themeData.primaryColor,
                          ),
                        ),
                        commonText(text: 'Remember Me'),
                      ],
                    ),
                    SizedBox(height: 20),
                    fullIconColorButton(
                      title: 'Login',
                      buttonHeight: 50,
                      textColor: Colors.white,
                      buttonColor: state.themeData.primaryColor,
                      context: context,
                      onPressed: () {
                        Navigator.pushNamed(context, '/homepage');
                      },
                    ),
                    SizedBox(height: 15),
                    TextButton(
                      child: commonText(text: 'Forget Password?', color: state.themeData.primaryColor, fontSize: 14),
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgetpassword');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: SpeedDial(
            backgroundColor: state.themeData.primaryColor,
            visible: true,
            curve: Curves.bounceIn,
            children: [
              SpeedDialChild(
                child: Icon(Icons.color_lens, color: Colors.white),
                backgroundColor: Color(0xFFf34509),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(AppTheme.theme1));
                },
                label: 'Theme1',
                labelStyle: TextStyle(fontSize: 18.0),
                labelBackgroundColor: Colors.white,
              ),
              SpeedDialChild(
                child: Icon(Icons.color_lens, color: Colors.white),
                backgroundColor: Color(0xFF20053d),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(AppTheme.theme2));
                },
                label: 'Theme2',
                labelStyle: TextStyle(fontSize: 18.0),
                labelBackgroundColor: Colors.white,
              ),
              SpeedDialChild(
                child: Icon(Icons.color_lens, color: Colors.white),
                backgroundColor: Color(0xFF445b4b),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(AppTheme.theme3));
                },
                label: 'Theme3',
                labelStyle: TextStyle(fontSize: 18.0),
                labelBackgroundColor: Colors.white,
              ),
            ],
            child: commonText(text: 'Switch Theme', color: Colors.white, fontSize: 11, textAlign: TextAlign.center),
          ),
        );
      },
    );
  }
}