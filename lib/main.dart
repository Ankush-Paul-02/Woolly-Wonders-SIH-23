import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih23/firebase_options.dart';
import 'package:sih23/src/features/auth/auth_pref.dart';
import 'package:sih23/src/features/auth/screens/login_screen.dart';
import 'package:sih23/src/features/auth/screens/register_screen.dart';
import 'package:sih23/src/features/home/screens/home_screen.dart';
import 'package:sih23/src/features/home/test/screens/test_modules.dart';
import 'package:sih23/src/features/onBoarding/screens/on_boarding_screen.dart';
import 'package:sih23/src/model/user_model.dart';
import 'package:sih23/src/routes/app_routes.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final bool loggedIn = await isLoggedIn();

  runApp(ProviderScope(child: MyApp(loggedIn: loggedIn)));
}

class MyApp extends ConsumerStatefulWidget {
  final bool loggedIn;

  const MyApp({Key? key, required this.loggedIn}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SIH 2023',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.blueColor),
          textTheme: GoogleFonts.montserratTextTheme(),
          useMaterial3: true,
        ),
        home: _buildHomeScreen(),
        routes: {
          AppRoute.homeRoute: (context) => const HomeScreen(),
          AppRoute.onBoardingRoute: (context) => const OnBoardingScreen(),
          AppRoute.registerRoute: (context) => const RegisterScreen(),
          AppRoute.loginRoute: (context) => const LoginScreen(),
          AppRoute.testRoute: (context) => const TestModule(),
          // AppRoute.profileRoute: (context) {
          //   final Map<String, dynamic>? arguments = ModalRoute.of(context)
          //       ?.settings
          //       .arguments as Map<String, dynamic>?;
          //   final String uid = arguments?['uid'] ?? '';
          //   return UserProfileScreen(uid: uid);
          // },
          // AppRoute.editProfileRoute: (context) {
          //   final Map<String, dynamic>? arguments = ModalRoute.of(context)
          //       ?.settings
          //       .arguments as Map<String, dynamic>?;
          //   final String uid = arguments?['uid'] ?? '';
          //   return EditProfileScreen(uid: uid);
          // },
        },
      ),
    );
  }

  Widget _buildHomeScreen() {
    if (widget.loggedIn) {
      return const OnBoardingScreen();
    } else {
      return const OnBoardingScreen();
    }
  }
}
