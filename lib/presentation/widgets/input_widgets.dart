part of 'main_widgets.dart';

class PrimaryInputText extends StatelessWidget {
  final String hintText;
  final String? Function(String? value) onValidate;
  final String? Function(String? value)? onChange;
  final TextEditingController? controller;
  final bool isEnabled;
  final int maxLines;
  final int? maxLength;
  final Widget? suffixImage;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? obscureText;
  final String? value;
  const PrimaryInputText({Key? key,this.obscureText,this.value, required this.hintText,this.readOnly, this.controller, required this.onValidate,this.isEnabled = true, this.textInputType = TextInputType.text, this.maxLines=1,this.maxLength, this.onChange, this.suffixImage, this.focusNode}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      readOnly: readOnly ?? false,
      style: GoogleFonts.lexend(color: Colors.black),
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      validator: onValidate,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: isEnabled,
      onChanged: onChange,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        counterText: "",
        labelText: hintText,
        suffixIcon: suffixImage,
        labelStyle: GoogleFonts.lexend(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black54
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black54
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class PrimaryIconInputText extends StatelessWidget {
  final String hintText;
  final String? Function(String? value) onValidate;
  final String? Function(String? value)? onChange;
  final TextEditingController? controller;
  final bool isEnabled;
  final int maxLines;
  final int? maxLength;
  final Widget? suffixImage;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? obscureText;
  final String? value;
  final IconData prefixIcon;
  final double? iconSize; // New parameter for icon size
  final Color? iconColor; // New parameter for icon color

  const PrimaryIconInputText({
    Key? key,
    this.obscureText,
    this.value,
    required this.hintText,
    this.readOnly,
    this.controller,
    required this.onValidate,
    this.isEnabled = true,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.onChange,
    this.suffixImage,
    this.focusNode,
    required this.prefixIcon,
    this.iconSize = 24.0, // Default size
    this.iconColor = Colors.black54, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      readOnly: readOnly ?? false,
      style: GoogleFonts.lexend(color: Colors.black),
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      validator: onValidate,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: isEnabled,
      onChanged: onChange,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        counterText: "",
        labelText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          size: iconSize,
          color: iconColor,
        ),
        suffixIcon: suffixImage,
        filled: true,
        fillColor: Colors.white,
        labelStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black54),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class PrimaryStraightInputText extends StatelessWidget {
  final String hintText;
  final String? Function(String? value) onValidate;
  final String? Function(String? value)? onChange;
  final TextEditingController? controller;
  final bool isEnabled;
  final int maxLines;
  final int? maxLength;
  final Widget? suffixImage;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? obscureText;
  final String? value;
  final double? fontSize;
  final double? height;
  const PrimaryStraightInputText({Key? key,this.obscureText,this.fontSize, this.value,this.height, required this.hintText,this.readOnly, this.controller, required this.onValidate,this.isEnabled = true, this.textInputType = TextInputType.text, this.maxLines=1,this.maxLength, this.onChange, this.suffixImage, this.focusNode}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30,
      child: TextFormField(
        initialValue: value,
        readOnly: readOnly ?? false,
        style: GoogleFonts.lexend(color: Colors.black, fontSize: fontSize ?? 14),
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        validator: onValidate,
        maxLines: maxLines,
        maxLength: maxLength,
        enabled: isEnabled,
        onChanged: onChange,
        keyboardType: textInputType,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange)
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange)
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.lexend(
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54
          ),
        ),
      ),
    );
  }
}

class PrimaryStraightIconInputText extends StatelessWidget {
  final String hintText;
  final String? Function(String? value) onValidate;
  final String? Function(String? value)? onChange;
  final TextEditingController? controller;
  final bool isEnabled;
  final int maxLines;
  final int? maxLength;
  final Widget? suffixImage;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? obscureText;
  final String? value;
  const PrimaryStraightIconInputText({Key? key,this.obscureText,this.value, required this.hintText,this.readOnly, this.controller, required this.onValidate,this.isEnabled = true, this.textInputType = TextInputType.text, this.maxLines=1,this.maxLength, this.onChange, this.suffixImage, this.focusNode}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      readOnly: readOnly ?? false,
      style: GoogleFonts.lexend(color: Colors.black),
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      validator: onValidate,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: isEnabled,
      onChanged: onChange,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        counterText: "",
        labelText: hintText,
        suffixIcon: suffixImage,
        labelStyle: GoogleFonts.lexend(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black54
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black54
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class BorderlessInputText extends StatelessWidget {
  final String hintText;
  final String? Function(String? value) onValidate;
  final String? Function(String? value)? onChange;
  final TextEditingController? controller;
  final bool isEnabled;
  final int maxLines;
  final int? maxLength;
  final Widget? suffixImage;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? obscureText;
  final String? value;

  const BorderlessInputText({
    Key? key,
    this.obscureText,
    this.value,
    required this.hintText,
    this.readOnly,
    this.controller,
    required this.onValidate,
    this.isEnabled = true,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.onChange,
    this.suffixImage,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(text: value),
      readOnly: readOnly ?? false,
      style: GoogleFonts.lexend(color: Colors.black),
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      validator: onValidate,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: isEnabled,
      onChanged: onChange,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        counterText: "",
        hintText: hintText,
        suffixIcon: suffixImage,
        hintStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        // Remove borders
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}