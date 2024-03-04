import 'package:auth/presentation/ui/sign_in_screen.dart';
import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:common/utils/navigation/router/app_routes.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/firebase/firebase.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_cubit.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_cubit.dart';
import 'package:onboarding/presentation/ui/onboarding_screen.dart';
import 'package:onboarding/presentation/ui/splash_screen.dart';

import 'injections/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Injections().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) => MaterialApp(
        title: 'Flutter E Commerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => SplashCubit(
                getIsOnboardingOpenedUseCase: sl(),
              )..initSplashAndGetIsOnboardingOpened(),
            )
          ],
          child: SplashScreen(),
        ),
        navigatorKey: NavigationHelperImpl.navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case AppRoutes.splash:
              return MaterialPageRoute(
                builder: (_) => SplashScreen(),
              );
            case AppRoutes.onboarding:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => OnboardingCubit(
                    setIsOnboardingOpenedUseCase: sl(),
                  ),
                  child: OnboardingScreen(),
                ),
              );
            case AppRoutes.signIn:
              return MaterialPageRoute(
                builder: (_) => const SignInScreen(),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => SplashScreen(),
              );
          }
        },
      ),
    );
  }
}
