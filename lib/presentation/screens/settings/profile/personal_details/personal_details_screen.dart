import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';

import '../../../../widgets/widgets.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
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
          title: AppStrings.personalDetails,
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CircleNetworkImageAvatar(
                    radius: 40,
                    image:
                    "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                6.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Madhusudan",style: AppStyle.black16.copyWith(fontWeight: FontWeight.w600),), 5.width,SvgImage(image: AppSvg.verified)],
                    ),
                10.height,
                HeaderTextField(hint: "",header: AppStrings.firstName,controller: firstNameController,focusNode: firstNameFocus,),
                HeaderTextField(hint: "",header: AppStrings.middleName,controller: middleNameController,focusNode: middleNameFocus,),
                HeaderTextField(hint: "",header: AppStrings.lastName,controller: lastNameController,focusNode: lastNameFocus,),
                HeaderTextField(hint: "",header: AppStrings.email,controller: emailController,focusNode: emailFocus,),
                HeaderTextField(hint: "",header: AppStrings.mobile,controller: mobileController,focusNode: mobileFocus,),
                HeaderTextField(hint: "",header: AppStrings.mobile,controller: mobileController,focusNode: mobileFocus,),
                HeaderTextField(hint: "",header: AppStrings.mobile,controller: mobileController,focusNode: mobileFocus,),
                HeaderTextField(hint: "",header: AppStrings.dob,controller: dobController,focusNode: dobFocus,),
                HeaderTextField(hint: "",header: AppStrings.experience,controller: experienceController,focusNode: experienceFocus,),
                HeaderTextField(hint: "",header: AppStrings.experience,controller: experienceController,focusNode: experienceFocus,),
                HeaderTextField(hint: "",header: AppStrings.experience,controller: experienceController,focusNode: experienceFocus,),
                HeaderTextField(hint: "",header: AppStrings.country,controller: countryController,focusNode: countryFocus,),
                HeaderTextField(hint: "",header: AppStrings.state,controller: stateController,focusNode: stateFocus,),
                HeaderTextField(hint: "",header: AppStrings.language,controller: languageController,focusNode: languageFocus,),
                HeaderTextField(hint: "",header: AppStrings.skills,controller: skillsController,focusNode: skillsFocus,),
                HeaderTextField(hint: "",header: AppStrings.specialisation,controller: specializationController,focusNode: specializationFocus,),
                HeaderTextField(hint: "",header: AppStrings.desc,controller: descController,focusNode: descFocus,maxLines: 5),
                AppButton(title: AppStrings.saveChanges)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
