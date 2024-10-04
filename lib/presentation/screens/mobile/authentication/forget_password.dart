import 'package:flutter/material.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

//bloc
import 'package:flutter_bloc/flutter_bloc.dart';

//theme
import 'package:truehands/bloc/theme/theme_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeBloc, ThemeState>(
  builder: (context, state) {
    return Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.lock_person_outlined,
                  size: 80,
                  color: state.themeData.primaryColor,
                ),
                const SizedBox(height: 20),
                commonBoldText(
                  text: "Forget Password",
                  fontSize: 27,
                ),
                SizedBox(height: 10),
                commonText(
                    text: "We need your registration email account to send you password reset code!",
                    color: Colors.grey
                ),
                SizedBox(height: 30),
                PrimaryIconInputText(hintText: 'Email', onValidate: (v){}, prefixIcon: Icons.email_outlined, iconColor: Colors.black26, iconSize: 21),
                SizedBox(height: 20),
                fullIconColorButton(title: 'Send',
                  buttonHeight: 50,
                  textColor: Colors.white, buttonColor: state.themeData.primaryColor, context: context, onPressed: (){
                  Navigator.pushNamed(context, '/resetpassword');
                  },
                ),
                SizedBox(height: 15),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded , color: state.themeData.primaryColor , size: 14),
                    SizedBox(width: 2),
                    TextButton(
                      child: commonText(text: 'Back to Login', color: state.themeData.primaryColor, fontSize: 14),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
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
