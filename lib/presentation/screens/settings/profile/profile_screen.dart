import 'package:flutter/material.dart';
import 'package:jyotishee/data/sources/remote/network_services/api_service.dart';
import 'package:jyotishee/presentation/screens/settings/profile/bank_details/bank_details_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/personal_details/personal_details_screen.dart';

import '../../../../app/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/providers/providers.dart';
import '../../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: AppStrings.astrologerProfile,
        showNotification: true,
      ),
      body: SizedBox(
        height: double.infinity,
        child: AppConsumer<AuthProvider, UserModel>(
          taskName: AuthProvider.userDataKey,
          load: (provider) => provider.userData(),
          successBuilder: (data, provider) {
            return SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {
                          var image = await AppHelper.pickImage(fromCamera: false);
                          if(image!=null){
                            String url ="https://api.snaplor.com/api/s3/pre-signed-url?key=astrologers/65c853eaf6bf92e27bbba5e3/profile&content_type=image/jpeg";
                            var res = await ApiService.sendFileToS3(url: url, file: image);
                            print("response0000");
                            print(res);
                          }
                        },
                        child: CircleNetworkImageAvatar(radius: 40, image: data.profileImage)),
                    5.height,
                    NameVerified(
                      name: data.name,
                      verified: data.isVerified,
                      center: true,
                    ),
                    5.height,
                    if (data.specialization.isNotEmpty)
                      Text(
                        data.specialization.join(", ").toCapitalized(),
                        style: AppStyle.greyHint12,
                      ),
                    if (data.languages.isNotEmpty)
                      Text(
                        data.languages.join("| ").toCapitalized(),
                        style: AppStyle.greyHint12,
                      ),
                    15.height,
                    Container(
                      decoration: AppDecoration.purpleLightRounded.copyWith(
                          color: AppColors.purpleLight,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                AppStrings.call,
                                style: AppStyle.black12w400,
                              ),
                              5.height,
                              Text(
                                "${data.totalCallOrders}",
                                style: AppStyle.purple18w600,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                AppStrings.chat,
                                style: AppStyle.black12w400,
                              ),
                              5.height,
                              Text(
                                "${data.totalChatOrders}",
                                style: AppStyle.purple18w600,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                AppStrings.sessions,
                                style: AppStyle.black12w400,
                              ),
                              5.height,
                              Text(
                                "${(data.totalChatOrders! + data.totalCallOrders!)}",
                                style: AppStyle.purple18w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    TitleDropdown(
                      text: AppStrings.personalDetails,
                      leadingIcon: SvgImage(image: AppSvg.user),
                      icon: Icon(Icons.keyboard_arrow_right_rounded),
                      onTap: () => context.push(PersonalDetailsScreen(
                        user: data,
                      )),
                    ),
                    TitleDropdown(
                      text: AppStrings.bankDetails,
                      leadingIcon: SvgImage(image: AppSvg.bank),
                      icon: Icon(Icons.keyboard_arrow_right_rounded),
                      onTap: () => context.push(BankDetailsScreen(
                        user: data,
                      )),
                    ),
                    TitleDropdown(
                      text: AppStrings.sessionsPrice,
                      leadingIcon: SvgImage(image: AppSvg.ruppe),
                      icon: Icon(Icons.keyboard_arrow_right_rounded),
                      onTap: () => _showRateSheet(
                          context: context,
                          isCallRate: true,
                          rate: data.callPrice.toString(),
                          user: data),
                      subWidget: Row(
                        children: [
                          Rupee(
                            fontSize: 14,
                            color: AppColors.hintGrey,
                          ),
                          Text(
                            "${data.callPrice}/Min",
                            style: AppStyle.grey12,
                          ),
                        ],
                      ),
                    ),
                    // TitleDropdown(text: AppStrings.callRate, leadingIcon: SvgImage(image: AppSvg.call),icon: Icon(Icons.keyboard_arrow_right_rounded)),
                    // TitleDropdown(text: AppStrings.chatRate, leadingIcon: SvgImage(image: AppSvg.chat),icon: Icon(Icons.keyboard_arrow_right_rounded)),
                    // TitleDropdown(text: AppStrings.callHistory, leadingIcon: SvgImage(image: AppSvg.call),icon: Icon(Icons.keyboard_arrow_right_rounded)),
                    // TitleDropdown(text: AppStrings.chatHistory, leadingIcon: SvgImage(image: AppSvg.chat),icon: Icon(Icons.keyboard_arrow_right_rounded)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showRateSheet(
      {required BuildContext context,
      required bool isCallRate,
      required String rate,
      required UserModel user}) {
    TextEditingController controller = TextEditingController();
    controller.text = rate;
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        child: Column(
          children: [
            HeaderTextField(
              hint: '',
              //header: (isCallRate ? AppStrings.call : AppStrings.chat) + " " + AppStrings.rateWithout,
              header: AppStrings.sessionsPrice,
              controller: controller,
              keyboard: TextInputType.number,
            ),
            AppButton(
              title: AppStrings.saveChanges,
              onTap: () async {
                if (controller.isEmpty()) {
                  AppHelper.showToast(
                    message: AppValidator.messageBuilder("rate")!,
                  );
                } else {
                  bool? response = await context.read<AuthProvider>().userData(
                      refresh: true,
                      updateModel: user.copyWith(
                        callPrice: isCallRate
                            ? controller.text.toInt()
                            : user.callPrice,
                        chatPrice: !isCallRate
                            ? controller.text.toInt()
                            : user.chatPrice,
                      ));
                  if (response.isTrue) context.pop();
                }
              },
            )
          ],
        ));
  }
}
