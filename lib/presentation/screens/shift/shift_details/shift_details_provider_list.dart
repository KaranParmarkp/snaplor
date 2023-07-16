import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/status_screens/error_screen.dart';
import '../../../widgets/widgets.dart';
import '../../provider/provider_details_screen.dart';

class ShiftDetailsProviderListScreen extends StatefulWidget {
  const ShiftDetailsProviderListScreen({super.key, required this.data});

  final ShiftTemplatePreviewModel data;

  @override
  State<ShiftDetailsProviderListScreen> createState() =>
      _ShiftDetailsProviderListScreenState();
}

class _ShiftDetailsProviderListScreenState
    extends State<ShiftDetailsProviderListScreen> {
  int index = 0;
  List<BidAcceptedProviderObjects> model = [];
  @override
  void initState() {
    super.initState();
    _onTap(0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(title: AppStrings.providerList),
      body: SizedBox(
        height: context.screenHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: TabBox(
                  title: AppStrings.accepted,
                  selected: index == 0,
                  onTap: () => _onTap(0),
                )),
                Expanded(
                    child: TabBox(
                  title: AppStrings.rejected,
                  selected: index == 1,
                  onTap: () => _onTap(1),
                )),
                Expanded(
                    child: TabBox(
                  title: AppStrings.callOf,
                  selected: index == 2,
                  onTap: () => _onTap(2),
                )),
              ],
            ),
            10.height,
            Expanded(
                child: model.isEmpty ? ErrorScreen(error: AppStrings.noDataAvailable): ListView.builder(
              itemCount: model.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                  onTap: () => context.push(ProviderDetailsScreen(model: ProviderListModel(
                    accountStatus: model[index].accountStatus,
                    email: model[index].email,
                    firstName: model[index].firstName,
                    id: model[index].id,
                    lastName: model[index].lastName,
                    middleName: model[index].middleName ?? "",
                    mobile: model[index].mobile,
                    mobileVerified: "",
                    paymentGateway: model[index].paymentGateway,
                    profile: model[index].profile,
                    profileImage: model[index].profileUrl,
                    price: 0,
                    providerBidCounts: 0,
                    providerBidCountsOfCompleted: 0,
                    providerBidCountsOfLateCallOff: 0,
                    providerBidCountsOfNoCallNoShow: 0,
                    providerDetailObject: null,
                  ))),
                  child: ProviderCard(
                model: ProviderListModel(
                  accountStatus: model[index].accountStatus,
                  email: model[index].email,
                  firstName: model[index].firstName,
                  id: model[index].id,
                  lastName: model[index].lastName,
                  middleName: model[index].middleName ?? "",
                  mobile: model[index].mobile,
                  mobileVerified: "",
                  paymentGateway: model[index].paymentGateway,
                  profile: model[index].profile,
                  profileImage: model[index].profileUrl,
                  price: 0,
                  providerBidCounts: 0,
                  providerBidCountsOfCompleted: 0,
                  providerBidCountsOfLateCallOff: 0,
                  providerBidCountsOfNoCallNoShow: 0,
                  providerDetailObject: ProviderDetailObject(
                    shiftType: model[index].specialityName
                  ),

                ),
                showStatus: false,
              )),
            )),
          ],
        ),
      ),
    );
  }

  _onTap(int i) {
    index = i;
    if (i == 0) {
      model = widget.data.bidAcceptedProviderObjects ?? [];
    } else if (i == 1) {
      model = widget.data.bidRejectedProviderObjects ?? [];
    } else {
      model = widget.data.bidCalledoffProviderObjects ?? [];
    }
    setState(() {});
  }
}

class TabBox extends StatelessWidget {
  const TabBox({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: AppDecoration.whiteWithShadow.copyWith(
          color: selected ? AppColors.colorPrimary : AppColors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [],
          border: Border.all(color: AppColors.hintGrey.withOpacity(0.20),width: 0.5)
        ),
        child: Center(
            child: Text(
          title,
          style: selected ? AppStyle.white16 : AppStyle.grey16,
        )),
      ),
    );
  }
}
