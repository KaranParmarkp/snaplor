import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';

import '../../../../widgets/widgets.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final firstNameController = TextEditingController();

  //final middleNameController = TextEditingController();
  //final lastNameController = TextEditingController();
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
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    firstNameController.text = widget.user.name ?? "";
    emailController.text = widget.user.email ?? "";
    mobileController.text = widget.user.phone ?? "";
    dobController.text = widget.user.dateOfBirth.toString();
    descController.text = widget.user.description ?? "";
    experienceController.text = widget.user.experience.toString();
    countryController.text = widget.user.address?.locality ?? "";
    stateController.text = widget.user.address?.state ?? "";
    cityController.text = widget.user.address?.city ?? "";
    languageController.text = widget.user.languages.join(",");
    skillsController.text = widget.user.skills.join(",");
    specializationController.text = widget.user.specialization.join(",");

  }

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
                    radius: 40, image: widget.user.profileImage),
                6.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.user.userName??"",
                      style: AppStyle.black16
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    5.width,
                    if(widget.user.isVerified.isTrue)SvgImage(image: AppSvg.verified)
                  ],
                ),
                10.height,
                HeaderTextField(
                  hint: "",
                  header: AppStrings.firstName,
                  controller: firstNameController,
                  focusNode: firstNameFocus,
                ),
                //HeaderTextField(hint: "",header: AppStrings.middleName,controller: middleNameController,focusNode: middleNameFocus,),
                //HeaderTextField(hint: "",header: AppStrings.lastName,controller: lastNameController,focusNode: lastNameFocus,),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.email,
                  controller: emailController,
                  focusNode: emailFocus,enable: false,
                ),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.mobile,
                  enable: false,
                  controller: mobileController,
                  focusNode: mobileFocus,
                ),
                /*HeaderTextField(
                  hint: "",
                  header: AppStrings.dob,
                  controller: dobController,
                  focusNode: dobFocus,
                ),*/
                HeaderTextField(
                  hint: "",
                  header: AppStrings.experience,
                  controller: experienceController,
                  keyboard: TextInputType.number,
                  focusNode: experienceFocus,
                ),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.country,
                  controller: countryController,
                  focusNode: countryFocus,
                ),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.state,
                  controller: stateController,
                  focusNode: stateFocus,
                ),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.state,
                  controller: cityController,
                  focusNode: cityFocus,
                ),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.language,
                  controller: languageController,
                  focusNode: languageFocus,
                ),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.skills,
                  controller: skillsController,
                  focusNode: skillsFocus,
                ),
                HeaderTextField(
                  hint: "",
                  header: AppStrings.specialisation,
                  controller: specializationController,
                  focusNode: specializationFocus,
                ),
                HeaderTextField(
                    hint: "",
                    header: AppStrings.desc,
                    controller: descController,
                    focusNode: descFocus,
                    maxLines: 5),
                AppButton(title: AppStrings.saveChanges,onTap: () => _onSaveChangesTap(),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSaveChangesTap() async {
    if (firstNameController.text.isEmpty) {
      AppHelper.showToast(message: AppValidator.messageBuilder("name")!);
      firstNameFocus.requestFocusDelayed();
    }else if (experienceController.isEmpty()) {
      AppHelper.showToast(message: AppValidator.messageBuilder("experience")!,);
      experienceFocus.requestFocusDelayed();
    }else if (cityController.isEmpty()) {
      AppHelper.showToast(message: AppValidator.messageBuilder("city")!,);
      cityFocus.requestFocusDelayed();
    }else if (countryController.isEmpty()) {
      AppHelper.showToast(message: AppValidator.messageBuilder("country")!,);
      countryFocus.requestFocusDelayed();
    }else if (stateController.isEmpty()) {
      AppHelper.showToast(message: AppValidator.messageBuilder("state")!,);
      stateFocus.requestFocusDelayed();
    }else if (descController.isEmpty()) {
      AppHelper.showToast(message: AppValidator.messageBuilder("description")!,);
      descFocus.requestFocusDelayed();
    }else {
      UserModel user = widget.user.copyWith(
        name: firstNameController.text,
        experience: experienceController.text.toInt(),
        address: widget.user.address?.copyWith(
          city: cityController.text,
          state: stateController.text,
          locality: countryController.text
        ),
        skills: skillsController.text.split(",").toList(),
        languages: languageController.text.split(",").toList(),
        specialization: specializationController.text.split(",").toList(),
        description: descController.text,
      );
      bool? response = await context.read<AuthProvider>().userData(refresh: true,updateModel: user);
      if(response.isTrue)AppHelper.showToast(message: AppStrings.profileUpdated);
    }
  }
}
