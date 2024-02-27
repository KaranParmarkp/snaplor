import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/chat/chat_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/profile_screen.dart';
import 'package:jyotishee/presentation/screens/wallet/wallet_screen.dart';
import '../../widgets/widgets.dart';
import '../community/community_screen.dart';
import '../home/home_screen.dart';
import '../settings/settings_screen.dart';

// below key is used to connect with side drawer from appbar
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> screens = [
    ProfileScreen(),
    WalletScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];
  int selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    //Future.microtask(() => context.read<AuthProvider>().initSocket());
  }

  @override
  void dispose() {
    super.dispose();
    context.read<AuthProvider>().disposeSocket();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          //key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          //drawer: AppDrawer(),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              screens[selectedIndex],
              if (provider.currentChat.isNotNull)
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: AppDecoration.whiteShadowRounded,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: AppColors.colorPrimary,
                                  child: CircleNetworkImageAvatar(
                                      radius: 20,
                                      image: provider.currentChat?.user?.image),
                                ),
                              ),
                            ],
                          ),
                          20.width,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  style: AppStyle.grey12
                                      .copyWith(color: AppColors.greyDark),
                                ),
                                Text(provider.currentChat?.user?.name ?? "",
                                    style: AppStyle.black14),
                              ],
                            ),
                          ),
                          /*InkWell(
                      onTap: () => provider.endChat(),
                      child: Container(
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.close,size: 20,color: AppColors.greyDark,)),
                    ),*/
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: AppRoundedButton(
                          text: AppStrings.chat,
                          color: AppColors.colorPrimary,
                          onTap: () => context.push(ChatScreen(
                            model: provider.currentChat,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
              )
            ]),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: AppStyle.grey12,
              selectedLabelStyle: AppStyle.blue12,
              selectedItemColor: AppColors.colorPrimary,
              unselectedItemColor: AppColors.hintGrey,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              elevation: 12,
              currentIndex: selectedIndex,
              onTap: (value) {
                if(value!=0){
                  selectedIndex = value;
                  setState(() {});
                }else{
                  context.push(ProfileScreen());
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    /*child: SvgImage(
                      image: selectedIndex == 0
                          ? AppSvg.home
                          : AppSvg.homeUnFilled,
                    ),*/
                    child: CircleNetworkImageAvatar(
                        radius: 15,
                        image: context.read<AuthProvider>().userModel?.profileImage),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgImage(
                        image: selectedIndex == 1
                            ? AppSvg.walledFilled
                            : AppSvg.wallet,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgImage(
                        image: selectedIndex == 2
                            ? AppSvg.home
                            : AppSvg.homeUnFilled,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgImage(
                        image: selectedIndex == 3
                            ? AppSvg.settingFilled
                            : AppSvg.setting,
                      ),
                    ),
                    label: ""),
              ],
            ),
          ),
        );
      },
    );
  }
}
