import 'package:fiverr_task/core/app_export.dart';
import 'package:fiverr_task/presentation/message_screen/controller/message_controller.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class MessageScreen extends StatelessWidget {
  final MessageScreenController controller = Get.put(MessageScreenController());

  MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Bounce(
                onTap: (){},
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      color: ColorConstant.containerBackGround(context),
                      child: ListTile(
                        subtitle: Text(AppString.soWhatAboutReq,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.style(
                              getFontSize(10),
                              fontColor: ColorConstant.textBlackToWhite(context),
                            )),
                        trailing: Text(AppString.saturday,
                            style: AppStyle.style(
                              getFontSize(10),
                              fontColor: ColorConstant.textGreyToWhite(context),
                            )),
                        title: Text(
                          AppString.ajayKumar,
                          style: AppStyle.style(getFontSize(14),
                              fontColor: ColorConstant.textBlackToWhite(context),
                              fontWeight: FontWeight.w500),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: ColorConstant.greyE6E6,
                          backgroundImage: AssetImage(
                            ImageConstant.userImage,
                          ),
                          maxRadius: 23,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.7,
                      width: getWidth(280),
                      color: FlexColor.greyLawDarkPrimary,
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
