import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:common/utils/navigation/router/onboarding_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_cubit.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_state.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final OnboardingRouter _onboardingRouter = sl();
  final AuthRouter _authRouter = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          final status = state.splashState.status;

          if (status.isHasData) {
            final data = state.splashState.data ?? false;

            if (data) {
              _authRouter.navigateToSignIn();
            } else {
              _onboardingRouter.navigateToOnboarding();
            }
          }
        },
        child: Container(
          width: 1.sw,
          height: 1.sh,
          color: ColorName.orange,
          child: Center(
            child: Assets.images.logo.logo.svg(
              width: 147.w,
              height: 108.h,
            ),
          ),
        ),
      ),
    );
  }
}
