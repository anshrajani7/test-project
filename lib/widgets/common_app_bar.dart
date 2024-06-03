import '../core/app_export.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final void Function()? onTap;
  final void Function()? clearOnTap;
  final bool hasActions;
  final bool hasBack;
  final Widget? changeTitle;
  final bool richText;

  const CommonAppbar(
      {super.key,
      this.onTap,
      this.clearOnTap,
      this.title,
      this.hasActions = false,
      this.hasBack = true,
      this.richText = true,
      this.changeTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
      backgroundColor: ColorConstant.primaryGreen,
      automaticallyImplyLeading: false,
      leading: hasBack
          ? Bounce(
              onTap: onTap ??
                  () {
                    Get.back();
                  },
              child: const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: ColorConstant.primaryWhite,
                ),
              ))
          : null,
      actions: [
        hasActions
            ? Bounce(onTap: clearOnTap ?? () {}, child: const Icon(Icons.clear))
            : Container()
      ],
      centerTitle: false,
      title: changeTitle ??  RichText(
                  textScaler: const TextScaler.linear(1.0),
                  text: TextSpan(
                    text: title??'',
                    style: AppStyle.style(30,
                        fontColor: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: richText ? '.' : '',
                        style: AppStyle.style(
                          30,
                          fontWeight: FontWeight.bold,
                          fontColor: ColorConstant.primaryBlack,
                        ),
                      ),
                    ],
                  ))
              ,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
