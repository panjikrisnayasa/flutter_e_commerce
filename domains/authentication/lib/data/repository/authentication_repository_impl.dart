import 'package:authentication/data/data_source/authentication_local_data_source.dart';
import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  const AuthenticationRepositoryImpl({
    required this.authenticationLocalDataSource,
  });

  @override
  Future<Either<FailureResponse, bool>> getIsOnboardingOpened() async {
    try {
      final result =
          await authenticationLocalDataSource.getIsOnboardingOpened();

      return Right(result);
    } on Exception catch (e) {
      return Left(
        FailureResponse(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<Either<FailureResponse, bool>> setIsOnboardingOpened() async {
    try {
      await authenticationLocalDataSource.setIsOnboardingOpened();

      return const Right(true);
    } on Exception catch (e) {
      return Left(
        FailureResponse(errorMessage: e.toString()),
      );
    }
  }
}
