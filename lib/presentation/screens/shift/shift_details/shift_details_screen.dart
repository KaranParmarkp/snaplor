import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/data/providers/shifts_provider.dart';
import 'package:jyotishee/presentation/screens/shift/shift_details/shift_details_provider_list.dart';
import '../../../../app/utils/utils.dart';
import '../../../widgets/widgets.dart';

class ShiftDetailsScreen extends StatefulWidget {
  const ShiftDetailsScreen(
      {super.key,
      required this.id,
      required this.pending,
      required this.status});

  final String id;
  final bool pending;
  final String status;

  @override
  State<ShiftDetailsScreen> createState() => _ShiftDetailsScreenState();
}

class _ShiftDetailsScreenState extends State<ShiftDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShiftsProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pending ? AppStrings.preview : AppStrings.shiftDetails,
        gradient: true,
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ShiftsProvider, ShiftTemplatePreviewModel>(
          taskName: ShiftsProvider.shiftDetailsKey,
          load: (provider) => provider.shiftDetails(widget.id.toString()),
          successBuilder: (data,provider) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 320,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 240,
                            decoration: AppDecoration.splash,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                width: context.screenWidth,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, bottom: 15),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              widget.pending
                                                  ? data.title
                                                  : "${data.title} - #${data.id}",
                                              style: AppStyle.white18Bold,
                                            ),
                                          ),
                                          if (data.status.isNotNull)
                                            AppChips(
                                              title: data.status!,
                                              color: widget.pending
                                                  ? AppColors.colorPrimary
                                                  : AppColors.white,
                                              bgColor: widget.pending
                                                  ? AppColors.white
                                                  : AppColors.white
                                                      .withOpacity(0.20),
                                            )
                                        ],
                                      ),
                                    ),
                                    Wrap(
                                      spacing: 6,
                                      children: [
                                        AppChips(
                                            title: data.scheduleType!,
                                            color: AppColors.colorPrimary,
                                            bgColor: AppColors.white),
                                        AppChips(
                                            title: data.shiftKeyword!,
                                            color: AppColors.colorPrimary,
                                            bgColor: AppColors.white),
                                      ],
                                    ),
                                    14.height,
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        widget.pending
                                            ? "Facility ：${data.locationObj?.name}"
                                            : data.locationObj?.nickname ?? "",
                                        style: AppStyle.white16,
                                      ),
                                    ),
                                    if (widget.pending)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "Number of Professionals：${data.professionalNumber}",
                                          style: AppStyle.white16,
                                        ),
                                      ),
                                    if (!widget.pending)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 14),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: SvgImage(
                                                image: AppSvg.timeShift,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                                    DateTimeHelper.dateWithDay(
                                                        data.startDate!),
                                                    style: AppStyle.white16)),
                                            Text(
                                                DateTimeHelper
                                                        .convertTimeFormat(
                                                            data.startTime!) +
                                                    " - " +
                                                    DateTimeHelper
                                                        .convertTimeFormat(
                                                            data.endTime!),
                                                style: AppStyle.white16),
                                          ],
                                        ),
                                      ),
                                    if (!widget.pending)
                                      Container(
                                        decoration:
                                            AppDecoration.whiteWithShadow,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 22),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          AppStrings.need,
                                                          style: AppStyle
                                                              .black16
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .hintGrey),
                                                        )),
                                                        Text(
                                                          data.needCount ?? "0",
                                                          style: AppStyle
                                                              .blueBold26,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 6,
                                                        horizontal: 22),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          AppStrings.filled,
                                                          style: AppStyle
                                                              .black16
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .hintGrey),
                                                        )),
                                                        Text(
                                                          "${data.acceptedCount}",
                                                          style: AppStyle
                                                              .blueBold26,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: AppColors.hintGrey,
                                              height: 1,
                                            ),
                                            10.height,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 22),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    AppStrings.publishedRate,
                                                    style: AppStyle.grey14,
                                                  ),
                                                  17.width,
                                                  Text(
                                                    "\$" +
                                                        data.nurseRate
                                                            .toString() +
                                                        "/hr",
                                                    style: AppStyle.black14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            10.height,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 22),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    AppStrings.bonus,
                                                    style: AppStyle.grey14,
                                                  ),
                                                  17.width,
                                                  Text(
                                                    "\$" +
                                                        data.bonusValue
                                                            .toString() +
                                                        "/hr",
                                                    style: AppStyle.black14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            10.height,
                                            if (data.jobConfirmation ==
                                                "facility_confirm")
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 22),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      AppStrings.proBidCap,
                                                      style: AppStyle.grey14,
                                                    ),
                                                    17.width,
                                                    Text(
                                                      "\$" +
                                                          data.maximumBillAmount
                                                              .toString() +
                                                          "/hr",
                                                      style: AppStyle.black14,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            10.height,
                                          ],
                                        ),
                                      ),
                                    if (widget.pending)
                                      Container(
                                        decoration:
                                            AppDecoration.whiteWithShadow,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            4.height,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 22),
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            AppStrings
                                                                .startDateTime,
                                                            style: AppStyle
                                                                .black16
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .hintGrey),
                                                          ),
                                                          10.height,
                                                          Text(
                                                            DateTimeHelper
                                                                .dateDDMMYYY(data
                                                                    .startDate),
                                                            style:
                                                                AppStyle.blue16,
                                                          ),
                                                          Text(
                                                            DateTimeHelper
                                                                .convertTimeFormat(
                                                                    data.startTime),
                                                            style:
                                                                AppStyle.blue16,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    VerticalDivider(
                                                      width: 1,
                                                      color: AppColors.hintGrey,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              AppStrings
                                                                  .endDateTime,
                                                              style: AppStyle
                                                                  .black16
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .hintGrey),
                                                            ),
                                                            10.height,
                                                            Text(
                                                              DateTimeHelper
                                                                  .dateDDMMYYY(data
                                                                      .endDate),
                                                              style: AppStyle
                                                                  .blue16,
                                                            ),
                                                            Text(
                                                              DateTimeHelper
                                                                  .convertTimeFormat(
                                                                      data.endTime),
                                                              style: AppStyle
                                                                  .blue16,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            10.height,
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 22),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      AppStrings.unpaidBreak,
                                                      style: AppStyle.grey14,
                                                    ),
                                                  ),
                                                  Text(
                                                    data.unpaidBreakTime != null
                                                        ? data.unpaidBreakTime! +
                                                            " minutes"
                                                        : "-",
                                                    style: AppStyle.black14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            16.height,
                                          ],
                                        ),
                                      ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),

                    //published rate etc..
                    if (widget.pending)
                      Container(
                        decoration: AppDecoration.whiteWithShadow,
                        margin: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.height,
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          AppStrings.publishedRate + " :",
                                          style: AppStyle.grey14,
                                        ),
                                      ),
                                      Text(
                                        "\$" +
                                            data.nurseRate.toString() +
                                            "/hr",
                                        style: AppStyle.black14,
                                      ),
                                    ],
                                  ),
                                  12.height,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          AppStrings.bonus + " :",
                                          style: AppStyle.grey14,
                                        ),
                                      ),
                                      Text(
                                        "\$" + data.bonusValue.toString(),
                                        style: AppStyle.black14,
                                      ),
                                    ],
                                  ),
                                  12.height,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          AppStrings.shiftConfType,
                                          style: AppStyle.grey14,
                                        ),
                                      ),
                                      Text(
                                        data.jobConfirmation ==
                                                "facility_confirm"
                                            ? AppStrings.facilityConfirmed
                                            : AppStrings.instantConfirmed,
                                        style: AppStyle.black14,
                                      ),
                                    ],
                                  ),
                                  12.height,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          AppStrings.providerRateCap,
                                          style: AppStyle.grey14,
                                        ),
                                      ),
                                      Text(
                                        data.jobConfirmation ==
                                                "facility_confirm"
                                            ? "\$${data.maximumBillAmount}"
                                            : "-",
                                        style: AppStyle.black14,
                                      ),
                                    ],
                                  ),
                                  12.height,
                                ],
                              ),
                            ),
                            16.height,
                          ],
                        ),
                      ),
                    // provider list container
                    if (!widget.pending)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 22),
                        decoration: AppDecoration.whiteWithShadow,
                        child: InkWell(
                          onTap: () {
                            context.push(ShiftDetailsProviderListScreen(data : data));
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 22),
                                      child: Text(
                                        AppStrings.provider +
                                            " [${data.bidAcceptedProviderObjects.isNotNull ? data.bidAcceptedProviderObjects!.length : 0}] ",
                                        style: AppStyle.black16
                                            .copyWith(color: AppColors.hintGrey),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      color: AppColors.hintGrey),
                                  10.width
                                ],
                              ),
                              Divider(
                                color: AppColors.hintGrey,
                                height: 1,
                              ),
                              10.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 22),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        child: Stack(
                                          children: [
                                            if (data.bidProviderObjects
                                                    .isNotNull &&
                                                data.bidProviderObjects!.length !=
                                                    0)
                                              for (int i = 0;
                                                  i <
                                                      (data.bidProviderObjects!
                                                                  .length <=
                                                              3
                                                          ? data
                                                              .bidProviderObjects!
                                                              .length
                                                          : 3);
                                                  i++)
                                                Positioned(
                                                  top: 0,
                                                  left: i * 18,
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    child: CircleAvatar(
                                                      radius: 42,
                                                      backgroundColor:
                                                          AppColors.white,
                                                      child:
                                                          CircleNetworkImageAvatar(
                                                        image: data
                                                                .bidProviderObjects![
                                                                    i]
                                                                .profileUrl +
                                                            data
                                                                .bidProviderObjects![
                                                                    i]
                                                                .profile,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            Positioned(
                                              top: 0,
                                              left: data.bidProviderObjects
                                                          .isNotNull &&
                                                      data.bidProviderObjects!
                                                              .length !=
                                                          0
                                                  ? (data.bidProviderObjects!
                                                                  .length <=
                                                              3
                                                          ? data
                                                              .bidProviderObjects!
                                                              .length
                                                          : 3) +
                                                      1.8 * 18
                                                  : 0,
                                              child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  child: data.acceptedCount
                                                              .toString() !=
                                                          data.professionalNumber
                                                              .toString()
                                                      ? SvgImage(
                                                          image: AppSvg.add)
                                                      : SizedBox()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (data.pendingCount.isNotNull &&
                                        data.pendingCount! >= 1)
                                      AppOutlineButton(
                                        title:
                                            "Pending Bid [${data.pendingCount}]",
                                      )
                                  ],
                                ),
                              ),
                              10.height,
                            ],
                          ),
                        ),
                      ),

                    //speciality
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 22),
                      decoration: AppDecoration.whiteWithShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.speciality + ":",
                                  style: AppStyle.grey14,
                                ),
                                10.height,
                                Text(
                                  data.specialityName ?? "",
                                  style: AppStyle.black14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Divider(
                              color: AppColors.hintGrey,
                              height: 1,
                            ),
                          ),
                          if (data.requiredDepartmentObjects != null)
                            for (int i = 0;
                                i < data.requiredDepartmentObjects!.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.subSpeciality + ":",
                                      style: AppStyle.grey14,
                                    ),
                                    10.height,
                                    Text(
                                      data.requiredDepartmentObjects![i]
                                          .professionalName,
                                      style: AppStyle.black14,
                                    ),
                                    10.height,
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          AppStrings.experience,
                                          style: AppStyle.grey14,
                                        )),
                                        Text(
                                          data.getExperience(i),
                                          style: AppStyle.black14,
                                        ),
                                      ],
                                    ),
                                    10.height,
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          AppStrings.matching,
                                          style: AppStyle.grey14,
                                        )),
                                        Text(
                                          data.requiredDepartmentObjects![i]
                                              .matching,
                                          style: AppStyle.black14,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                            ),
                            child: Divider(
                              color: AppColors.hintGrey,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.proLicence + ":",
                                  style: AppStyle.grey14,
                                ),
                                10.height,
                                Text(
                                  data.requiredProfessionalLicenseObjects ==
                                          null
                                      ? "No License Required"
                                      : data.funProfessionalLicense(),
                                  style: AppStyle.black14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                            ),
                            child: Divider(
                              color: AppColors.hintGrey,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.credDoc + ":",
                                  style: AppStyle.grey14,
                                ),
                                10.height,
                                Text(
                                  data.requiredDocumentObjects == null
                                      ? "-"
                                      : data.credentialDocument(),
                                  style: AppStyle.black14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //showing shift  etc..
                    if (widget.pending)
                      Container(
                        decoration: AppDecoration.whiteWithShadow,
                        margin: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.height,
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          AppStrings.showingShiftTo,
                                          style: AppStyle.grey14,
                                        ),
                                      ),
                                      Text(
                                        data.showingShiftTo ?? "",
                                        style: AppStyle.black14,
                                      ),
                                    ],
                                  ),
                                  12.height,
                                  /*if(data.showingShiftTo=="All Qualified Providers")Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        AppStrings.fav+" :",
                                        style: AppStyle.grey14,
                                      ),
                                    ),
                                    Text(data..toString(),
                                      style: AppStyle.black14,
                                    ),
                                  ],
                                ),
                                12.height,*/
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          AppStrings.shiftTemplateSave,
                                          style: AppStyle.grey14,
                                        ),
                                      ),
                                      Text(
                                        data.templateObj != null ? "Yes" : "No",
                                        style: AppStyle.black14,
                                      ),
                                    ],
                                  ),
                                  12.height,
                                ],
                              ),
                            ),
                            16.height,
                          ],
                        ),
                      ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 22),
                      child: Text(
                        AppStrings.description,
                        style: AppStyle.blackBold26,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 22),
                      child: Html(
                        data: data.description ?? "",
                        //style: AppStyle.black14,
                      ),
                    ),
                    80.height,
                  ],
                ),
              ),
              widget.status == "Pending" || widget.status == "Open"
                  ? Container(
                      height: 66,
                      decoration: AppDecoration.whiteWithShadow
                          .copyWith(borderRadius: BorderRadius.circular(0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 8),
                        child: widget.status == "Open"
                            ? AppButton(
                                title: AppStrings.edit,
                                textFontSize: 14,
                                onTap: () {},
                              )
                            : Row(
                                children: [
                                  Expanded(
                                      child: AppOutlineButton(
                                          onTap: () => _cancelShift(
                                              context, provider, data),
                                          title: AppStrings.cancel,
                                          color: AppColors.hintGrey)),
                                  10.width,
                                  Expanded(
                                      child: AppOutlineButton(
                                          title: AppStrings.edit,
                                          color: AppColors.hintGrey)),
                                  10.width,
                                  Expanded(
                                      child: AppShadeButton(
                                          onTap: () => provider.shiftPublish(data.id.toString()),
                                          text: "Publish",
                                          startColor: AppColors.primaryAccent,
                                          endColor: AppColors.colorPrimary))
                                ],
                              ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  _cancelShift(BuildContext context, ShiftsProvider provider,
      ShiftTemplatePreviewModel data) {
    AppHelper.showCustomDialog(
      context: context,
      title: RichText(
          textAlign: TextAlign.center,
          textScaleFactor: 1,
          text: TextSpan(children: [
            TextSpan(
              text: "Do you want to ",
              style: AppStyle.black18,
            ),
            TextSpan(
              text: "cancel\n",
              style: AppStyle.black18.copyWith(color: AppColors.colorPrimary),
            ),
            TextSpan(
                text: "this shift?", style: AppStyle.black18Nova.copyWith()),
          ])),
      positiveText: AppStrings.sure,
      onPressedPositive: () {
        context.pop();
        provider.shiftCancel(data.id.toString());
      },
    );
  }
}
