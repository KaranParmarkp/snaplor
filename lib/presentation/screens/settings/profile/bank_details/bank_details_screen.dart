import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import '../../../../widgets/widgets.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final experienceController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final languageController = TextEditingController();
  final skillsController = TextEditingController();
  final specializationController = TextEditingController();
  final descController = TextEditingController();

  final firstNameFocus = FocusNode();
  final middleNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final mobileFocus = FocusNode();
  final dobFocus = FocusNode();
  final experienceFocus = FocusNode();
  final countryFocus = FocusNode();
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final languageFocus = FocusNode();
  final skillsFocus = FocusNode();
  final specializationFocus = FocusNode();
  final descFocus = FocusNode();


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
                HeaderTextField(hint: "",header: AppStrings.bankName,controller: firstNameController,focusNode: firstNameFocus,),
                HeaderTextField(hint: "",header: AppStrings.ifsc,controller: middleNameController,focusNode: middleNameFocus,),
                HeaderTextField(hint: "",header: AppStrings.accountNum,controller: lastNameController,focusNode: lastNameFocus,),
                HeaderTextField(hint: "",header: AppStrings.nameOnAccount,controller: emailController,focusNode: emailFocus,),
                AppButton(title: AppStrings.requestToChange,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
