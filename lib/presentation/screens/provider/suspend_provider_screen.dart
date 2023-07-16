import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/add_suspended_provider_request_model.dart';
import 'package:jyotishee/data/providers/providers.dart';
import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';

class SuspendProviderScreen extends StatefulWidget {
  const SuspendProviderScreen({super.key, required this.id});

  final String id;

  @override
  State<SuspendProviderScreen> createState() => _SuspendProviderScreenState();
}

class _SuspendProviderScreenState extends State<SuspendProviderScreen> {
  int selectedIndex = 0;
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();
  final List<String> types = [
    AppStrings.allowWorkAccepted,
    AppStrings.autoReject,
    AppStrings.autoRejectAllAccepted
  ];
  @override
  void initState() {
    super.initState();
    startDateController.text =
        DateTimeHelper.dateDDMMYYY(DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(title: AppStrings.suspendProvider),
      bottomNavigationBar: Container(
        height: 66,
        decoration: AppDecoration.whiteWithShadow.copyWith(borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 8),
          child: AppButton(
            title: AppStrings.submit,
            textFontSize: 14,
            onTap: () {
              if(selectedIndex!=2){
                if(endDateController.text.isEmpty){
                  AppHelper.showImageToast(message: AppValidator.messageBuilder("suspended end date",validationType: ErrorType.SELECT)!);
                }else{
                  Provider.of<ProvidersListProvider>(context,listen: false).addSuspendProvider(model: AddSuspendedProviderRequestModel(
                    fromDate: startDateController.text,
                    providerId: widget.id,
                    note: reasonController.text,
                    toDate: endDateController.text,
                    type: types[selectedIndex]
                  ));
                }
              }else{
                Provider.of<ProvidersListProvider>(context,listen: false).addSuspendProvider(model: AddSuspendedProviderRequestModel(
                    providerId: widget.id,
                    note: reasonController.text,
                    type: types[selectedIndex]
                ));
              }
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 22),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.suspendType,
                          style: AppStyle.black16
                              .copyWith(color: AppColors.hintGrey),
                        ),
                        Text(
                          " \*",
                          style: TextStyle(color: AppColors.redFF0000),
                        ),
                      ],
                    ),
                  ),
                  SuspendProviderCheckBox(
                    status: selectedIndex == 0,
                    text: AppStrings.allowWorkAccepted,
                    onTap: () => onTap(0),
                  ),
                  SuspendProviderCheckBox(
                    status: selectedIndex == 1,
                    text: AppStrings.autoReject,
                    onTap: () => onTap(1),
                  ),
                  SuspendProviderCheckBox(
                    status: selectedIndex == 2,
                    text: AppStrings.autoRejectAllAccepted,
                    onTap: () => onTap(2),
                  ),
                ],
              ),
            ),
            20.height,
            if (selectedIndex != 2) ...[
              Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    HeaderTextField(
                      controller: startDateController,
                      hint: "",
                      headerColor: AppColors.hintGrey,
                      header: AppStrings.suspendedStartDate,
                      showAsterisk: true,
                      enable: false,
                      showArrow: true,
                    ),
                    HeaderTextField(
                      controller: endDateController,
                      hint: AppStrings.endDate,
                      headerColor: AppColors.hintGrey,
                      header: AppStrings.suspendedEndDate,
                      showAsterisk: true,
                      enable: false,
                      showArrow: true,
                      onTap: () async {
                        DateTime? date =
                            await AppHelper.showDatePicker(context: context);
                        if (date.isNotNull) {
                          endDateController.text =
                              DateTimeHelper.dateDDMMYYY(date);
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
              20.height,
            ],
            Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  HeaderTextField(
                    controller: reasonController,
                    hint: "",
                    headerColor: AppColors.hintGrey,
                    header: AppStrings.suspendReason,
                    maxLines: 4,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTap(index) {
    selectedIndex = index;
    setState(() {});
  }
}

class SuspendProviderCheckBox extends StatelessWidget {
  const SuspendProviderCheckBox({
    super.key,
    required this.status,
    required this.text,
    this.onTap,
  });

  final bool status;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: 14, bottom: 20, left: 20, right: 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                status ? AppSvg.checked : AppSvg.unChecked,
                width: 22,
              ),
            ),
            30.width,
            Expanded(
                child: Text(
              text,
              style: AppStyle.black16,
            ))
          ],
        ),
      ),
    );
  }
}
