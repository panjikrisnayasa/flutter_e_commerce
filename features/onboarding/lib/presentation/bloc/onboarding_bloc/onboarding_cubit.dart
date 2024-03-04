import 'package:authentication/domain/use_case/set_is_onboarding_opened_use_case.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final SetIsOnboardingOpenedUseCase setIsOnboardingOpenedUseCase;

  OnboardingCubit({
    required this.setIsOnboardingOpenedUseCase,
  }) : super(
          OnboardingState(onboardingState: ViewData.initial()),
        );

  void setIsOnboardingOpened() async {
    final result = await setIsOnboardingOpenedUseCase.call(const NoParams());

    result.fold(
      (failure) => emit(
        OnboardingState(
          onboardingState: ViewData.error(
            message: failure.errorMessage,
            failure: failure,
          ),
        ),
      ),
      (result) => emit(
        OnboardingState(
          onboardingState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
