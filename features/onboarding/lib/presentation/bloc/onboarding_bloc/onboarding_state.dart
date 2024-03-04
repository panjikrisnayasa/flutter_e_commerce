import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class OnboardingState extends Equatable {
  final ViewData<bool> onboardingState;

  const OnboardingState({
    required this.onboardingState,
  });

  OnboardingState copyWith({ViewData<bool>? onboardingState}) {
    return OnboardingState(
      onboardingState: onboardingState ?? this.onboardingState,
    );
  }

  @override
  List<Object?> get props => [onboardingState];
}
