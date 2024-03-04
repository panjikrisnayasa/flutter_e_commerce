import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_cubit.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_state.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final AuthRouter _authRouter = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            final status = state.onboardingState.status;

            if (status.isHasData) {
              final data = state.onboardingState.data ?? false;

              if (data) {
                _authRouter.navigateToSignIn();
              }
            }
          },
          child: IntroductionScreen(
            globalBackgroundColor: ColorName.whiteBackground,
            showBackButton: false,
            showNextButton: false,
            showSkipButton: true,
            skip: _textButton('Lewati'),
            done: _textButton('Selesai'),
            dotsDecorator: const DotsDecorator(
              size: Size(10, 10),
              color: ColorName.textGrey,
              activeSize: Size(22, 10),
              activeColor: ColorName.orange,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            pages: [
              _page(
                title: 'Jelajahi',
                body: 'Cari, temukan, dan beli produk favoritmu',
                image: Assets.images.onboarding.onboarding1.svg(
                  width: 250.w,
                  height: 205.h,
                ),
              ),
              _page(
                title: 'Pembayaran Mudah',
                body: 'Gunakan pembayaran sesuai dengan pilihanmu',
                image: Assets.images.onboarding.onboarding2.svg(
                  width: 250.w,
                  height: 205.h,
                ),
              ),
              _page(
                title: 'Pengalaman Berbelanja',
                body:
                    'Nikmati kenyaman berbelanja saat menjelajahi toko favoritmu',
                image: Assets.images.onboarding.onboarding3.svg(
                  width: 250.w,
                  height: 205.h,
                ),
              ),
            ],
            onDone: () {
              context.read<OnboardingCubit>().setIsOnboardingOpened();
            },
          ),
        ),
      ),
    );
  }

  Widget _textButton(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorName.orange,
      ),
    );
  }

  PageViewModel _page({
    required String title,
    required String body,
    required Widget image,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: image,
      decoration: PageDecoration(
        imageFlex: 2,
        titlePadding: const EdgeInsets.only(top: 64, bottom: 10),
        contentMargin: const EdgeInsets.symmetric(horizontal: 64),
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorName.orange,
        ),
        bodyTextStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorName.textGrey,
        ),
      ),
    );
  }
}
