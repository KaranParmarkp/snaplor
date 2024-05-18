import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/chat/chat_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/profile_screen.dart';
import 'package:jyotishee/presentation/screens/waitlist/waitlist_screen.dart';
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
    Future.microtask(() => context.read<AuthProvider>().fcmSave());
    Future.microtask(() => context.read<AuthProvider>().initSocket());
  }

  @override
  void dispose() {
    context.read<AuthProvider>().disposeSocket();
    super.dispose();
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
                ...[Padding(
                  padding: const EdgeInsets.all(15),
                  child: WaitListCard(model: provider.currentChat!, type: ComType.chat),
                )]
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
                provider.onGoingChat();
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
