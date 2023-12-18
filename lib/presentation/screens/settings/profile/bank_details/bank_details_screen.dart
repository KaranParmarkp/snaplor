import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';

import '../../../../../data/models/models.dart';
import '../../../../widgets/widgets.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final bankNameController = TextEditingController();
  final ifscController = TextEditingController();
  final accountNumController = TextEditingController();
  final nameOnAccountController = TextEditingController();


  final bankNameFocus = FocusNode();
  final ifscFocus = FocusNode();
  final accountNumFocus = FocusNode();
  final nameOnAccountFocus = FocusNode();


  void initState() {
    super.initState();
    setData();
  }

  setData() {
    bankNameController.text = widget.user.bankInfo?.bankName ?? "";
    ifscController.text = widget.user.bankInfo?.ifscCode ?? "";
    accountNumController.text = widget.user.bankInfo?.accountNumber ?? "";
    //nameOnAccountController.text = widget.user.bankInfo?. ?? "";

  }


  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: AppStrings.bankDetails,
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                10.height,
                HeaderTextField(hint: "",header: AppStrings.bankName,controller: bankNameController,focusNode: bankNameFocus,enable: false),
                HeaderTextField(hint: "",header: AppStrings.ifsc,controller: ifscController,focusNode: ifscFocus,enable: false),
                HeaderTextField(hint: "",header: AppStrings.accountNum,controller: accountNumController,focusNode: accountNumFocus,enable: false),
                //HeaderTextField(hint: "",header: AppStrings.nameOnAccount,controller: nameOnAccountController,focusNode: nameOnAccountFocus,),
                //AppButton(title: AppStrings.requestToChange,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  _onSaveChangesTap() async {
    if (bankNameController.text.isEmpty) {
      AppHelper.showToast(message: AppValidator.messageBuilder("bank name")!);
      bankNameFocus.requestFocusDelayed();
    }else if (ifscController.isEmpty()) {
      AppHelper.showToast(message: AppValidator.messageBuilder("ifsc")!,);
      ifscFocus.requestFocusDelayed();
    }else if (accountNumController.isEmpty()) {
      AppHelper.showToast(message: AppValidator.messageBuilder("account number")!,);
      accountNumFocus.requestFocusDelayed();
    }else {
      UserModel user = widget.user.copyWith(
        bankInfo: BankInfo(
          accountNumber: accountNumController.text,
          bankName: bankNameController.text,
          ifscCode: ifscController.text
        )
      );
      bool? response = await context.read<AuthProvider>().userData(refresh: true,updateModel: user);
      if(response.isTrue)AppHelper.showToast(message: AppStrings.bankUpdated);
    }
  }
}
