import 'package:flutter/material.dart';

import '../../../../app/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/models/shift_list_request_model.dart';
import '../../../../data/providers/providers.dart';
import '../../../widgets/widgets.dart';

class ShiftFilterScreen extends StatefulWidget {
  const ShiftFilterScreen({super.key, required this.shiftsTypes});

  final ShiftsTypes shiftsTypes;

  @override
  State<ShiftFilterScreen> createState() => _ShiftFilterScreenState();
}

class _ShiftFilterScreenState extends State<ShiftFilterScreen> {
  _apiCall(BuildContext context) {
    context.pop();
    Provider.of<ShiftsProvider>(context, listen: false)
        .shiftLists(ShiftListRequestModel(
      shiftsType: ShiftsTypes.shiftList,
      title: titleController.text,
      keyword: shiftType,
      locationId: selectedFacilityLocation,
      statusArray: status != null ? [status!] : null,
    ));
  }

  TextEditingController titleController = TextEditingController();
  String? selectedFacilityLocation;
  String? shiftType;
  String? status;
  List<ButtonModel> statusOptions = [
    ButtonModel(id: 1,value: "Pending"),
    ButtonModel(id: 2,value: "Open"),
    ButtonModel(id: 3,value: "Filled"),
    ButtonModel(id: 4,value: "Expired"),
    ButtonModel(id: 5,value: "Canceled"),
    ButtonModel(id: 6,value: "Completed"),
  ];
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ShiftsProvider>(context, listen: false).shiftOptions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "",
          trailingIcon: InkWell(
            onTap: () => _apiCall(context),
            child: Center(
              child: Text(
                AppStrings.search,
                style: AppStyle.black22
                    .copyWith(color: AppColors.colorPrimary, fontSize: 20),
              ),
            ),
          )),
      body: Consumer<ShiftsProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                  child: HeaderTextField(
                    hint: "",
                    header: "Title",
                  ),
                ),
                SearchHeaderCard(
                  title: AppStrings.facLoc,
                  subTitle: selectedFacilityLocation,
                  onTap: () async {
                    ButtonModel? response = await AppHelper.showGenericTypeSheet(context: context,list: provider.locationOptions);
                      selectedFacilityLocation = response?.value;
                      setState(() {});
                  },
                ),
                SearchHeaderCard(
                    title: AppStrings.shiftType, subTitle: shiftType,
                onTap: () async {
                  ButtonModel? response = await AppHelper.showGenericTypeSheet(context: context,list: provider.shiftOptionsList);
                  shiftType = response?.value;
                  setState(() {});
                },),
                SearchHeaderCard(title: AppStrings.status, subTitle: status,onTap: () async {
                  ButtonModel? response = await AppHelper.showGenericTypeSheet(context: context,list: statusOptions);
                  status = response?.value;
                  setState(() {});
                },),
              ],
            ),
          );
        },
      ),
    );
  }
}
