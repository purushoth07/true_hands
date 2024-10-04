part of 'main_widgets.dart';

void showSuccessToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showFailedToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Widget reusablePopUp({required BuildContext context}){
  return GestureDetector(
    onTapUp: (TapUpDetails details) async {
      final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          details.globalPosition,
          details.globalPosition,
        ),
        Offset.zero & overlay.size,
      );

      // Show the popup menu
      final selectedValue = await showMenu(
        context: context,
        position: position,
        items: [
          PopupMenuItem(
            child: Text('Menu 1'),
            value: 1,
          ),
          PopupMenuItem(
            child: Text('Menu 2'),
            value: 2,
          ),
          PopupMenuItem(
            child: Text('Menu 3'),
            value: 3,
          ),
        ],
      );

      // Handle the selected menu option
      if (selectedValue != null) {
        switch (selectedValue) {
          case 1:
          // Handle Menu 1 option
            break;
          case 2:
          // Handle Menu 2 option
            break;
          case 3:
          // Handle Menu 3 option
            break;
        }
      }
    },
  );
}

Future yesOrNoDialog({required BuildContext context, required String dialogMessage, required String cancelText, required String okText, required VoidCallback okAction}) {
  return  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info,
                color: Colors.red,
                size: 40,
              ),
              const SizedBox(height: 15),
              Text(
                dialogMessage,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
          actionsPadding: EdgeInsets.only(bottom: 8, right: 8),
          actions: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: TextButton(
                child: Text(cancelText,
                    style: GoogleFonts.lexend(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                onPressed: () {
                  Navigator.pop(context);//Close Dialog Box
                },
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red)),
              child: TextButton(
                onPressed: okAction,
                child: Text(okText,
                    style: GoogleFonts.lexend(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.red)),
              ),
            ),
          ],
        );
      });
}

class CustomDialog{
  static void showLoading(BuildContext context, String title) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 12,),
            Text(
              title,
              style: GoogleFonts.lexend(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: true,
    ).show();
  }
  static void cancelLoading(BuildContext context) {
    AwesomeDialog(context: context).dismiss();
  }

  static void showAlert(
      BuildContext context, String dialogMessage, bool? success, double? fontSize) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                success != null ? Icon(
                  success ? Icons.check_circle : Icons.clear,
                  color: success ? Colors.green : Colors.red,
                  size: 40,
                ):Container(),
                const SizedBox(height: 15),
                Text(
                  dialogMessage,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(
                      fontSize: fontSize ?? 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            actions: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: TextButton(
                  child: Text(
                      'OK',
                      style: GoogleFonts.lexend(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  onPressed: () {
                    Navigator.pop(context);//Close Dialog Box
                  },
                ),
              ),
            ],
          );
        });
  }

  static void okActionAlert(
      BuildContext context, String dialogMessage,String? okText, bool success, double? fontSize, VoidCallback okAction) {
    showDialog(
        context: context,
        builder: (context) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){},
              child: AlertDialog(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      success ? Icons.check_circle : Icons.clear,
                      color: success ? Colors.green : Colors.red,
                      size: 40,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      dialogMessage,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexend(
                          fontSize: fontSize ?? 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                actions: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: TextButton(
                      onPressed: okAction ,
                      child: Text(
                          okText?? 'OK',
                          style: GoogleFonts.lexend(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                ],
              )
          );
        });
  }
}