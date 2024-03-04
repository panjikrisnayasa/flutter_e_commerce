import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<FailureResponse, bool>> getIsOnboardingOpened();

  Future<Either<FailureResponse, bool>> setIsOnboardingOpened();
}
