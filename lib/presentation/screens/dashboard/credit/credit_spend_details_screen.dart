import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import '../../../../app/utils/utils.dart';
import '../../../widgets/widgets.dart';

class CreditSpendDetailsScreen extends StatelessWidget {
  const CreditSpendDetailsScreen(
      {super.key, required this.title, required this.creditSpend});

  final String title;
  final CreditSpend creditSpend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(title: title),
      body: AppConsumer<ShiftsProvider, List<TimeSheetDetailModel>>(
        taskName: ShiftsProvider.creditSpendKey,
        load: (provider) => provider.creditSpend(creditSpend),
        successBuilder: (data, provider) {
          return SizedBox(
            height: context.screenHeight,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    if(creditSpend==CreditSpend.outStandingInvoices)...[IconTitleCard(icon: AppImages.financialInvoice, title: "Invoice number", value: "#"+data[index].idTitle.toString(),),
                    IconTitleCard(icon: AppImages.financialDate, title: "Invoice Date", value: DateTimeHelper.dateDDMMYYY(data[index].invoiceDateProviderPosition),),
                    IconTitleCard(icon: AppImages.financialDueDate, title: "Due Date", value: DateTimeHelper.dateDDMMYYY(data[index].dueShiftStartDate),),
                    IconTitleCard(icon: AppImages.financialDay, title: "Days Outstanding", value: data[index].outStandingDurationEndDate,),
                    IconTitleCard(icon: AppImages.financialAmount, title: "Amount", value: "\$"+data[index].amount.toString(),),],

                    if(creditSpend==CreditSpend.unInvoiceTimesheet)...[
                      IconTitleCard(icon: AppImages.financialTitleIcon, title: "Shift Title", value: "#"+data[index].idTitle.toString(),),
                      IconTitleCard(icon: AppImages.financialProvider, title: "Provider", value: data[index].invoiceDateProviderPosition,),
                      IconTitleCard(icon: AppImages.financialDate, title: "Date", value: DateTimeHelper.dateDDMMYYY(data[index].dueShiftStartDate),),
                      IconTitleCard(icon: AppImages.financialClock, title: "Duration", value: data[index].outStandingDurationEndDate,),
                      IconTitleCard(icon: AppImages.financialAmount, title: "Amount", value: "\$"+data[index].amount.toString(),),],

                    if(creditSpend==CreditSpend.runningShifts || creditSpend==CreditSpend.confirmedShifts)...[
                      IconTitleCard(icon: AppImages.financialInvoice, title: "Shift Title", value: "#"+data[index].idTitle.toString(),),
                      IconTitleCard(icon: AppImages.financialPosition, title: "Positions", value: data[index].invoiceDateProviderPosition,),
                      IconTitleCard(icon: AppImages.financialStartIcon, title: "Schedule Start", value: DateTimeHelper.dateDDMMYYY(data[index].dueShiftStartDate),),
                      IconTitleCard(icon: AppImages.financialEndIcon, title: "Schedule End", value: DateTimeHelper.dateDDMMYYY(data[index].outStandingDurationEndDate),),],


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class IconTitleCard extends StatelessWidget {
  const IconTitleCard({super.key, required this.icon, required this.title, required this.value, this.showDivider=true});
  final String icon;
  final dynamic title;
  final dynamic value;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(icon,height: 22,width: 22,),
              20.width,
              Expanded(child: Text(title.toString(),style: AppStyle.grey16,)),
              Text(value.toString(),style: AppStyle.black16,)
            ],
          ),
          if(showDivider)Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: AppDivider(),
          )
        ],
      ),
    );
  }
}
