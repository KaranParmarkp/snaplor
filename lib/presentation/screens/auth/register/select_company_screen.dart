import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/company_model.dart';
import 'package:jyotishee/data/models/register_request_model.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/auth/register/input_company_info_screen.dart';

import '../../../widgets/widgets.dart';

class SelectCompanyScreen extends StatefulWidget {
  const SelectCompanyScreen({Key? key, required this.model}) : super(key: key);
  final RegisterModel model;

  @override
  State<SelectCompanyScreen> createState() => _SelectCompanyScreenState();
}

class _SelectCompanyScreenState extends State<SelectCompanyScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => getCompanyList());
    model = widget.model;
  }

  getCompanyList({String search = ""}) {
    Provider.of<AuthProvider>(context, listen: false)
        .getCompanyList(search: search);
  }

  int? selectedIndex;
  late RegisterModel model;

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.greyF5F5F5,
          appBar: CustomAppBar(title: AppStrings.company),
          body: SizedBox(
            height: context.screenHeight,
            child: Column(
              children: [
                InkWell(
                  onTap: () => context.push(InputCompanyInfoScreen(
                    model: widget.model,
                  )),
                  child: Container(
                    color: AppColors.colorPrimary,
                    padding: EdgeInsets.only(
                        top: 18, left: 16, right: 10, bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          AppStrings.notFoundCompany,
                          style: AppStyle.white14,
                        )),
                        10.width,
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: AppTextField(
                    hintText: AppStrings.search,
                    borderColor: Colors.white,
                    controller: searchController,
                    onFieldSubmitted: (value) {
                      getCompanyList(search: value);
                    },
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async => await getCompanyList(),
                    child: provider.companyList.isNotEmpty &&
                            !provider.loadingCompanyList
                        ? ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CheckBoxCompanyCard(
                              status: selectedIndex == index,
                              company: provider.companyList[index],
                              onTap: () {
                                selectedIndex = index;
                                model.legal_company_name = provider.companyList[index].companyName;
                                model.address_line_1 = provider.companyList[index].address_line_1;
                                model.address_line_2 = provider.companyList[index].addressLine2;
                                model.city = provider.companyList[index].city;
                                model.state = provider.companyList[index].state;
                                model.zipcode = provider.companyList[index].zipcode;
                                model.company_email = provider.companyList[index].email;
                                model.company_phone = provider.companyList[index].telephone;
                                model.company_phone = provider.companyList[index].telephone;
                                model.lat = provider.companyList[index].latitude.toString();
                                model.long = provider.companyList[index].longitude.toString();
                                setState(() {});
                              },
                            ),
                            itemCount: provider.companyList.length,
                          )
                        : provider.loadingCompanyList
                            ? SpinKitRing()
                            : !provider.loadingCompanyList &&
                                    provider.companyList.isEmpty
                                ? Text("No Data")
                                : SizedBox(),
                  ),
                ),
                SquareGradientButton(
                    title: AppStrings.submit,
                    onTap: () => _onSubmitTap()),
              ],
            ),
          ),
        );
      },
    );
  }

  _onSubmitTap() {
    if(selectedIndex.isNotNull) context.push(InputCompanyInfoScreen(model: model));
    else{ AppHelper.showImageToast(message: "Please select company");}
  }
}

class CompanySelect {
  String name;
  bool status;
  String? image;

  CompanySelect({required this.name, required this.status, this.image});
}

class CheckBoxCompanyCard extends StatelessWidget {
  const CheckBoxCompanyCard({
    super.key,
    required this.company,
    required this.status,
    this.onTap,
  });

  final CompanyModel company;
  final bool status;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(top: 14, bottom: 14, left: 20, right: 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  status ? AppSvg.checked : AppSvg.unChecked,
                  width: 22,
                ),
                24.width,
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: /*SquareNetworkImageAvatar(
                    image: company.companyLogo,
                    size: 86,
                  )*/
                      Image.asset(AppImages.company,
                          height: 86, width: 86, fit: BoxFit.cover),
                ),
              ],
            ),
            18.width,
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company.companyName ?? "",
                    style: AppStyle.black18,
                  ),
                  10.height,
                  Text(
                    company.address_line_1 ?? "",
                    style: AppStyle.grey14,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
