import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/error/exception.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

abstract class AuthenticationLocalDataSource {
  Future<bool> getIsOnboardingOpened();

  Future<bool> setIsOnboardingOpened();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final SharedPreferences sharedPreferences;

  const AuthenticationLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> getIsOnboardingOpened() async {
    try {
      return sharedPreferences.getBool(
            AppConstants.cachedKey.onboardingKey,
          ) ??
          false;
    } catch (e) {
      throw DatabaseException(
        AppConstants.errorMessage.failedGetIsOnBoardingOpened,
      );
    }
  }

  @override
  Future<bool> setIsOnboardingOpened() async {
    return await sharedPreferences.setBool(
      AppConstants.cachedKey.onboardingKey,
      true,
    );
  }
}
