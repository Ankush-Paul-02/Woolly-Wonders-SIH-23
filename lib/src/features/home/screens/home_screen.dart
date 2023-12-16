import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sih23/src/features/home/widgets/home_drawer.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    // final authState = ref.watch(authStateChangeProvider);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: 'Woolly Wonders'.text.size(20).bold.black.make(),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: Image(
            image: const AssetImage(AppConstants.menu),
            color: AppTheme.blackColor,
            fit: BoxFit.cover,
            height: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image(
              image: const AssetImage(AppConstants.search),
              color: AppTheme.blackColor,
              fit: BoxFit.cover,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image(
              image: const AssetImage(AppConstants.language),
              color: AppTheme.blackColor,
              fit: BoxFit.cover,
              height: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image(
              image: const AssetImage(AppConstants.darkMode),
              color: AppTheme.blackColor,
              fit: BoxFit.cover,
              height: 32,
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: HomeDrawer(),
      ),
      body: AppConstants().tabScreens[_currentTab],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: NavigationBar(
          height: 80,
          elevation: 1,
          selectedIndex: _currentTab,
          onDestinationSelected: (int index) => setState(() {
            _currentTab = index;
          }),
          backgroundColor: AppTheme.whiteColor,
          indicatorColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 1000),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              icon: Image(
                image: const AssetImage(AppConstants.home),
                color:
                    _currentTab == 0 ? AppTheme.blueColor : AppTheme.blackColor,
                fit: BoxFit.cover,
                height: _currentTab == 0 ? 40 : 28,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Image(
                image: const AssetImage(AppConstants.trend),
                color:
                    _currentTab == 1 ? AppTheme.blueColor : AppTheme.blackColor,
                fit: BoxFit.cover,
                height: _currentTab == 1 ? 40 : 28,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Image(
                image: const AssetImage(AppConstants.rupee),
                color:
                    _currentTab == 2 ? AppTheme.blueColor : AppTheme.blackColor,
                fit: BoxFit.cover,
                height: _currentTab == 2 ? 40 : 28,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Image(
                image: const AssetImage(AppConstants.test),
                color:
                    _currentTab == 3 ? AppTheme.blueColor : AppTheme.blackColor,
                fit: BoxFit.cover,
                height: _currentTab == 3 ? 40 : 28,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
