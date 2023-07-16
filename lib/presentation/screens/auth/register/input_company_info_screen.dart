import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/screens/auth/register/service_agreement_screen.dart';
import '../../../../data/providers/providers.dart';
import '../../../widgets/widgets.dart';

class InputCompanyInfoScreen extends StatefulWidget {
  const InputCompanyInfoScreen({Key? key, required this.model})
      : super(key: key);
  final RegisterModel model;

  @override
  State<InputCompanyInfoScreen> createState() => _InputCompanyInfoScreenState();
}

class _InputCompanyInfoScreenState extends State<InputCompanyInfoScreen> {

  bool serviceAgreement = false;
  File? logo;
  File? companyPhoto;
  final companyNameController = TextEditingController();
  final addLine1Controller = TextEditingController();
  final addLine2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final websiteController = TextEditingController();
  final industryTypeController = TextEditingController();
  final facilityTypeController = TextEditingController();
  final companyEmailController = TextEditingController();
  final companyPhoneController = TextEditingController();
  final timeZoneController = TextEditingController();

  final companyNameFocus = FocusNode();
  final addLine1Focus = FocusNode();
  final addLine2Focus = FocusNode();
  final cityFocus = FocusNode();
  final stateFocus = FocusNode();
  final zipFocus = FocusNode();
  final websiteFocus = FocusNode();
  final facilityTypeFocus = FocusNode();
  final industryTypeFocus = FocusNode();
  final companyEmail = FocusNode();
  final companyPhone = FocusNode();
  final timeZoneFocus = FocusNode();
  ButtonModel? selectedIndustry;
  ButtonModel? selectedFacility;
  ButtonModel? selectedCompanyState;
  ButtonModel? selectedTimeZone;

  @override
  void initState() {
    super.initState();
    setData();
    Future.microtask(() => getIndustry());
  }

  getIndustry() async {
    await Provider.of<AuthProvider>(context, listen: false).getIndustryList();
  }


  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: AppColors.greyF5F5F5,
            appBar: CustomAppBar(title: AppStrings.company),
            body: SizedBox(
              height: context.screenHeight,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          color: AppColors.greyF5F5F5,
                          padding: EdgeInsets.only(
                              top: 21, left: 35, right: 25, bottom: 30),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.inputCompany,
                                style: AppStyle.blackBold24,
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                AppSvg.companyInfo,
                                height: 74,
                                width: 110,
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: AppColors.white,
                          padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                          child: Column(
                            children: [
                              HeaderTextField(
                                hint: AppStrings.companyName,
                                header: AppStrings.companyName,
                                showAsterisk: true,
                                controller: companyNameController,
                                focusNode: companyNameFocus,
                              ),
                              HeaderTextField(
                                hint: AppStrings.industry,
                                header: AppStrings.industry,
                                showAsterisk: true,
                                enable: false,
                                showArrow: true,
                                controller: industryTypeController,
                                focusNode: industryTypeFocus,
                                onTap: () async {
                                  ButtonModel? response = await showGenericTypeSheet(provider.industryList);
                                  print(response?.value.toString());
                                  if(response.isNotNull){
                                    if(selectedIndustry!=response){
                                      facilityTypeController.clear();
                                    }
                                    industryTypeController.text = response!.value;
                                    selectedIndustry = response;
                                    setState(() {

                                    });
                                  }
                                }

                              ),
                              HeaderTextField(
                                hint: AppStrings.facilityType,
                                header: AppStrings.facilityType,
                                showAsterisk: true,
                                enable: false,
                                showArrow: true,
                                controller: facilityTypeController,
                                focusNode: facilityTypeFocus,
                                onTap: () async {
                                  if(industryTypeController.text.isEmpty){
                                    AppHelper.showImageToast(message: 'Please select industry');
                                  }else{
                                    provider.getFacilityTypeByIndustry(id : selectedIndustry!.id.toString(),onSuccess: () async {
                                      ButtonModel? response = await showGenericTypeSheet(provider.facilityList);
                                      if(response.isNotNull){
                                        facilityTypeController.text = response!.value;
                                        selectedFacility = response;
                                        setState(() {

                                        });
                                      }
                                    },);

                                  }
                                },

                              ),
                              HeaderTextField(
                                hint: AppStrings.addressLine1,
                                header: AppStrings.location,
                                showAsterisk: true,
                                enable: false,
                                showArrow: true,
                                controller: addLine1Controller,
                                focusNode: addLine1Focus,
                              ),
                              HeaderTextField(hint: AppStrings.addressLine2,
                                controller: addLine2Controller,
                                focusNode: addLine2Focus,),
                              Row(
                                children: [
                                  Expanded(
                                      child:
                                      HeaderTextField(hint: AppStrings.city,
                                        controller: cityController,
                                        focusNode: cityFocus,)),
                                  12.width,
                                  Expanded(
                                      child: HeaderTextField(
                                        hint: AppStrings.state,
                                        showArrow: true,
                                        enable: false,
                                        controller: stateController,
                                        focusNode: stateFocus,
                                        onTap: () {
                                          provider.getCompanyStates(onSuccess: () async {
                                            ButtonModel? response = await showGenericTypeSheet(provider.companyStatesList);
                                            if(response.isNotNull){
                                              stateController.text = response!.value;
                                              selectedCompanyState = response;
                                              setState(() {

                                              });
                                            }
                                          },);
                                        },
                                      )),
                                ],
                              ),
                              HeaderTextField(hint: AppStrings.zipCode,
                                controller: zipController,
                                focusNode: zipFocus,),
                              HeaderTextField(
                                  hint: AppStrings.timezone,
                                  header: AppStrings.timezone,
                                  showAsterisk: true,
                                  enable: false,
                                  showArrow: true,
                                  controller: timeZoneController,
                                  focusNode: timeZoneFocus,
                                  onTap: () async {
                                    provider.getTimezones(onSuccess: () async {
                                      ButtonModel? response = await showGenericTypeSheet(provider.timezoneList);
                                      if(response.isNotNull){
                                        timeZoneController.text = response!.value;
                                        selectedTimeZone = response;
                                        setState(() {

                                        });
                                      }
                                    },);
                                  }

                              ),
                              HeaderTextField(
                                hint: AppStrings.phone,
                                header: AppStrings.companyPhone,
                                showAsterisk: true,
                                controller: companyPhoneController,
                                focusNode: companyPhone,
                              ),
                              HeaderTextField(
                                hint: AppStrings.email,
                                header: AppStrings.compEmail,
                                showAsterisk: true,
                                controller: companyEmailController,
                                focusNode: companyEmail,
                              ),
                              HeaderTextField(
                                hint: AppStrings.websiteURL,
                                header: AppStrings.websiteURL,
                                controller: websiteController,
                                focusNode: websiteFocus,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      children: [
                                        Text(
                                          AppStrings.logo,
                                          style: AppStyle.black16,
                                        ),
                                        Spacer(),
                                        Text(
                                          logo != null ? "1" : "0" + "/1",
                                          style: AppStyle.black16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showImageSheet(
                                              context: context, fromLogo: true);
                                        },
                                        child: Container(
                                          color: AppColors.greyF5F5F5,
                                          height: 82,
                                          width: 82,
                                          child: logo != null
                                              ? Image.file(
                                            logo!, fit: BoxFit.cover,)
                                              : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 22),
                                            child: SvgPicture.asset(
                                                AppSvg.upload),
                                          ),
                                        ),
                                      ),
                                      if (logo != null)
                                        Positioned(
                                            top: -10,
                                            right: -10,
                                            child: InkWell(
                                              onTap: () {
                                                logo = null;
                                                setState(() {});
                                              },
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                  AppColors.redFF0000,
                                                  radius: 15,
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 16,
                                                    color: AppColors.white,
                                                  )),
                                            ))
                                    ],
                                  )
                                ],
                              ),
                              15.height,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      children: [
                                        Text(
                                          AppStrings.companyPhoto,
                                          style: AppStyle.black16,
                                        ),
                                        Spacer(),
                                        Text(
                                          companyPhoto != null ? "1" : "0" +
                                              "/1",
                                          style: AppStyle.black16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showImageSheet(context: context,
                                              fromLogo: false);
                                        },
                                        child: Container(
                                          color: AppColors.greyF5F5F5,
                                          height: 82,
                                          width: 82,
                                          child: companyPhoto != null
                                              ? Image.file(
                                            companyPhoto!, fit: BoxFit.cover,)
                                              : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 22),
                                            child: SvgPicture.asset(
                                                AppSvg.upload),
                                          ),
                                        ),
                                      ),
                                      if (companyPhoto != null)
                                        Positioned(
                                            top: -10,
                                            right: -10,
                                            child: InkWell(
                                              onTap: () {
                                                companyPhoto = null;
                                                setState(() {});
                                              },
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                  AppColors.redFF0000,
                                                  radius: 15,
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 16,
                                                    color: AppColors.white,
                                                  )),
                                            ))
                                    ],
                                  )
                                ],
                              ),
                              15.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(serviceAgreement
                                      ? AppSvg.checkBox
                                      : AppSvg.checkBoxUnChecked),
                                  10.width,
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        bool? response = await context.push(
                                            ServiceAgreementScreen());
                                        if (response == true) {
                                          serviceAgreement = true;
                                          setState(() {});
                                        }
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                            text: AppStrings.byChecking,
                                            children: [
                                              TextSpan(
                                                  text: AppStrings
                                                      .serviceAgreement,
                                                  style: AppStyle.black14
                                                      .copyWith(
                                                      color: AppColors
                                                          .colorPrimary)),
                                              TextSpan(
                                                  text: ".",
                                                  style: AppStyle.black14),
                                            ],
                                            style: AppStyle.black14.copyWith(
                                                color: AppColors.black333333)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SquareGradientButton(
                    title: AppStrings.submit,
                    onTap: () => _onSubmitTap(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  showImageSheet({required BuildContext context, required bool fromLogo}) {
    AppHelper.showBottomSheet(context: context, child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LightRoundButton(title: AppStrings.camera, onTap: () async {
          context.pop();
          File? file = await AppHelper.pickImage(fromCamera: true);
          if (fromLogo) {
            logo = file;
          } else {
            companyPhoto = file;
          }
          setState(() {

          });
        },),
        LightRoundButton(title: AppStrings.gallery, onTap: () async {
          context.pop();
          File? file = await AppHelper.pickImage(fromCamera: false);
          if (fromLogo) {
            logo = file;
          } else {
            companyPhoto = file;
          }
          setState(() {

          });
        },),
      ],
    ));
  }

  Future<ButtonModel?> showGenericTypeSheet(List<ButtonModel> list) async {
    return await AppHelper.showBottomSheet<ButtonModel?>(
        context: context, padding: EdgeInsets.zero, child: Expanded(
          child: ListView.builder(
                shrinkWrap: true,
                itemCount:list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop(list[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(list[index].value, style: AppStyle.blue16,),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }
    ),
        ));
  }

  setData() {
    companyNameController.text = widget.model.legal_company_name ?? "";
    addLine1Controller.text = widget.model.address_line_1 ?? "";
    addLine2Controller.text = widget.model.address_line_2 ?? "";
    cityController.text = widget.model.city ?? "";
    stateController.text = widget.model.state ?? "";
    zipController.text = widget.model.zipcode ?? "";
    companyEmailController.text = widget.model.company_email ?? "";
    companyPhoneController.text = widget.model.company_phone ?? "";
    websiteController.text = widget.model.company_website ?? "";
    if (mounted) setState(() {

    });
  }

  Future<void> _onSubmitTap() async {
    AppHelper.hideKeyboard();
    if(companyNameController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("company name")!);
      companyNameFocus.requestFocusDelayed();
    }
    else if(industryTypeController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("industry",validationType: ErrorType.SELECT)!);
      industryTypeFocus.requestFocusDelayed();
    }
    else if(facilityTypeController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("industry",validationType: ErrorType.SELECT)!);
      facilityTypeFocus.requestFocusDelayed();
    }
    else if(addLine1Controller.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("address line 1")!);
      addLine1Focus.requestFocusDelayed();
    }
    else if(cityController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("city")!);
      cityFocus.requestFocusDelayed();
    }
    else if(stateController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("state")!);
      stateFocus.requestFocusDelayed();
    }
    else if(zipController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("zipcode")!);
      zipFocus.requestFocusDelayed();
    }
    else if(timeZoneController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("time zone", validationType: ErrorType.SELECT)!);
      timeZoneFocus.requestFocusDelayed();
    }
    else if(companyEmailController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("company email")!);
      companyEmail.requestFocusDelayed();
    }
    else if(companyEmailController.validateEmailAddress()){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("company email",
          validationType: ErrorType.INVALID)!,);
      companyEmail.requestFocusDelayed();
    }
    else if(companyPhoneController.text.isEmpty){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("company phone")!);
      companyEmail.requestFocusDelayed();
    }
    /*else if(companyEmailController.validatePhone()){
      AppHelper.showImageToast(message: AppValidator.messageBuilder("company phone",
          validationType: ErrorType.INVALID)!,);
      companyPhone.requestFocusDelayed();
    }*/
    else{
      RegisterModel model = widget.model;
      model.legal_company_name = companyNameController.text;
      model.industryId = selectedIndustry!.id.toString();
      model.facility_type = selectedFacility!.value.toString();
      model.address_line_1 = addLine1Controller.text;
      model.address_line_2 = addLine2Controller.text;
      model.city = cityController.text;
      model.state = stateController.text;
      model.zipcode = zipController.text;
      model.company_phone = companyPhoneController.text;
      model.company_email = companyEmailController.text;
      model.company_website = websiteController.text;
      model.companyLogo = logo;
      model.companyPhoto = companyPhoto;
      model.timezone = timeZoneController.text;
      model.long = "0.0";
      model.lat = "0.0";
      await Provider.of<AuthProvider>(context, listen: false).register(
        model: model
      );
    }
  }
}
