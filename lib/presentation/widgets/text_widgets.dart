part of 'main_widgets.dart';

Widget commonBoldText({required String text,TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow, Color? color, double? fontSize}){
  return Text(text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.lexend(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      )
  );
}

Widget commonText({required String text,TextAlign? textAlign,TextDecoration? textDecoration, int? maxLines, TextOverflow? textOverflow, Color? color, double? fontSize}){
  return Text(text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.lexend(
        decoration:textDecoration,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      )
  );
}
