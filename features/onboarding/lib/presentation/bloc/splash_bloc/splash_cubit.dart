import 'package:authentication/domain/use_case/get_is_onboarding_opened_use_case.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetIsOnboardingOpenedUseCase getIsOnboardingOpenedUseCase;

  SplashCubit({
    required this.getIsOnboardingOpenedUseCase,
  }) : super(
          SplashState(splashState: ViewData.initial()),
        );

  void initSplashAndGetIsOnboardingOpened() async {
    await Future.delayed(const Duration(seconds: 3));

    final result = await getIsOnboardingOpenedUseCase.call(const NoParams());

    result.fold(
      (failure) => emit(
        SplashState(
          splashState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        SplashState(
          splashState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
