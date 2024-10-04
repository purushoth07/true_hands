part of 'main_widgets.dart';

Widget fullIconColorButton(
    {required String title,
      required Color textColor,
      required Color buttonColor,
      Color? iconColor,
      double? buttonHeight,
      required BuildContext context,
      required VoidCallback onPressed,
      String? iconUrl}) {
  return SizedBox(
    height: buttonHeight ?? 45,
    width: MediaQuery.of(context).size.width * 1,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(iconUrl, color: iconColor,),
          Text(
            title,
            style: GoogleFonts.lexend(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),

    ),
  );
}

Widget fullIconCurveColorButton(
    {required String title,
      required Color textColor,
      required Color buttonColor,
      Color? iconColor,
      required BuildContext context,
      required VoidCallback onPressed,
      String? iconUrl,
      IconData? materialIcon,
      double? materialIconSize
    }) {
  return SizedBox(
    height: 45,
    width: MediaQuery.of(context).size.width * 1,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
        elevation: MaterialStateProperty.all(4),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconUrl != null ? SvgPicture.asset(iconUrl, color: iconColor,):
          Icon(materialIcon, size: materialIconSize ?? 16),
          Text(
            title,
            style: GoogleFonts.lexend(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),

    ),
  );
}

class GradientButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Function(Offset) onPressed;
  final IconData? materialIcon;
  final List<Color> buttonColors;
  final Color? iconColor;
  final double? materialIconSize;
  final double? buttonHeight;

  GradientButton({super.key, this.buttonHeight,  required this.buttonColors,this.iconColor, this.materialIconSize, required this.title,required this.textColor, required this.onPressed, this.materialIcon});

  final GlobalKey _buttonPositionKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: _buttonPositionKey,
      onPressed: () {
        RenderBox? renderBox = _buttonPositionKey.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          Offset offset = renderBox.localToGlobal(Offset.zero);
          onPressed(offset);
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(4),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
        elevation: MaterialStateProperty.all<double>(0),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 12),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        minimumSize: MaterialStateProperty.all<Size>(const Size(0, 48)),
      ),
      child: Ink(
        height: buttonHeight ?? 40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          gradient: LinearGradient(
            colors: buttonColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (materialIcon != null)
              Row(
                children: [
                  const SizedBox(width: 5),
                  Icon(
                    materialIcon,
                    color: iconColor ?? Colors.white,
                    size: materialIconSize ?? 16,
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 12, 0),
              child: commonBoldText(text: title, color: textColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

Widget fullIconGradientCurveColorButton(
    {required String title,
      required Color textColor,
      required List<Color> buttonColors,
      Color? iconColor,
      double? buttonHeight,
      required BuildContext context,
      required VoidCallback onPressed,
      String? iconUrl,
      IconData? materialIcon,
      double? materialIconSize,
      void Function(TapUpDetails)? tapUp,
    }) {
  return Container(
    height: buttonHeight ?? 45,
    width: double.infinity,
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(21),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
      ],
      gradient: LinearGradient(
        colors: buttonColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: GestureDetector(
      onTap: onPressed,
      onTapUp: tapUp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconUrl != null ? SvgPicture.asset(iconUrl, color: iconColor,):
          materialIcon == null ? const SizedBox(width: 0):Icon(materialIcon, size: materialIconSize ?? 16, color: Colors.white,),
          Text(
            title,
            style: GoogleFonts.lexend(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),

    ),
  );
}

class ReusablePopupButton extends StatelessWidget {
  final List<String> options;
  final Function(String)? onOptionSelected;

  const ReusablePopupButton({super.key,
    required this.options,
    this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PopupMenuButton<String>(
        itemBuilder: (BuildContext context) {
          return options.map((String option) {
            return PopupMenuItem<String>(
              value: option,
              child: commonBoldText(text: option),
            );
          }).toList();
        },
        onSelected: (String selectedOption) {
          onOptionSelected?.call(selectedOption);
        },
      ),
    );
  }
}


Widget underLineTextButton({required VoidCallback onPressed,TextAlign? textAlign, required String text, Color? color, double? size}){
  return GestureDetector(
    onTap: onPressed,
    child: Text(text,
        textAlign: textAlign,
        style: GoogleFonts.lexend(
          decoration: TextDecoration.underline,
          fontSize: size ?? 14,
          fontWeight: FontWeight.bold,
          color: color ?? Colors.black,
        )),
  );
}

///This is the widget for creating buttons
Widget commonSmallColorButton(
    {required String title,
      required Color textColor,
      double? fontSize,
      required Color buttonColor,
      required VoidCallback onPressed}) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 2)),
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          // side: const BorderSide(color: Color(0xff979797)),
            borderRadius: BorderRadius.circular(16)))),
    onPressed: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Text(
        title,
        style: GoogleFonts.lexend(
          fontSize: fontSize ?? 15,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    ),
  );
}


///This is the widget for creating buttons
Widget commonColorButton(
    {required String title,
      required Color textColor,
      double? fontSize,
      required Color buttonColor,
      required VoidCallback onPressed}) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          // side: const BorderSide(color: Color(0xff979797)),
            borderRadius: BorderRadius.circular(4)))),
    onPressed: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        title,
        style: GoogleFonts.lexend(
          fontSize: fontSize ?? 15,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    ),
  );
}

Widget fullLeftIconColorButton(
    {required String title,
      required Color textColor,
      required Color buttonColor,
      Color? iconColor,
      required BuildContext context,
      required VoidCallback onPressed,
      required String iconUrl}) {
  return SizedBox(
    height: 45,
    width: MediaQuery.of(context).size.width * 1,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
        elevation: MaterialStateProperty.all(4),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 40, child: SvgPicture.asset(iconUrl, color: iconColor)),
          Text(
            title,
            style: GoogleFonts.lexend(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          SizedBox(
            width: 40,
            child: Opacity(opacity: 0,
                child: SvgPicture.asset(iconUrl, color: iconColor)),
          ),
        ],

      ),

    ),
  );
}