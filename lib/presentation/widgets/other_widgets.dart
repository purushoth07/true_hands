part of 'main_widgets.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Color> colors;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  Color? fontColor;

  GradientAppBar({required this.title,this.fontColor, required this.colors , this.leading, this.actions, required this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AppBar(
        centerTitle: centerTitle,
        leading: leading,
        actions: actions,
        title: commonBoldText(text: title, color: fontColor ?? Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

Widget divider({required BuildContext context, double? height, double? width}){
  return Container(
    height: height ?? double.infinity,
    width: width ?? double.infinity,
    decoration: const BoxDecoration(
      color: Colors.black26
    ),
  );
}

class CommonSearchBar extends StatelessWidget {
  final String hintText;
  final String? Function(String? value)? onChange;
  final TextEditingController? searchController;
  final FocusNode? focusNode;
  const CommonSearchBar({Key? key, this.focusNode, required this.hintText, this.onChange, this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      focusNode: focusNode,
      showCursor: true,
      controller: searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xffD6D6D6),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
          color: Color(0xff858585),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xffADADAD),
        ),
      ),
    );
  }
}

class ReusableDropdown<T> extends StatelessWidget {
  final List<T> options;
  final T currentValue;
  final Function(T?) onChanged;
  final String Function(T) displayStringForOption;

  ReusableDropdown({
    required this.options,
    required this.currentValue,
    required this.onChanged,
    required this.displayStringForOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: DropdownButton<T>(
            value: currentValue,
            onChanged: onChanged,
            iconEnabledColor: Colors.black54,
            isExpanded: true,
            underline: Container(
              height: 1,
              color: Colors.transparent,
            ),
            items: options
                .map<DropdownMenuItem<T>>((T value) => DropdownMenuItem<T>(
              value: value,
              child: Text(
                displayStringForOption(value),
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ReusableBorderDropdown extends StatelessWidget {
  final List<String> options;
  final String currentValue;
  final Function(String?) onChanged;

  ReusableBorderDropdown({required this.options, required this.currentValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12)
      ),
      height: 45,
      width: double.infinity,
      child: DropdownButton<String>(
        value: currentValue,
        onChanged: onChanged,
        iconEnabledColor: Colors.black,
        isExpanded: true,
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        items: options
            .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: GoogleFonts.lexend(
                  fontSize: 16,
                  color: Colors.black54
              )
          ),
        ))
            .toList(),
      ),
    );
  }
}

class CircularAvatarWithBorder extends StatelessWidget {
  final String imageUrl;

const CircularAvatarWithBorder({super.key, required this.imageUrl});

@override
Widget build(BuildContext context) {
  return Container(
    width: 45.0,
    height: 45.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 2.0),
    ),
    child: ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
    ),
  );
}
}