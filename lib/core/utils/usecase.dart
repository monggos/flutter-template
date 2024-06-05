import 'package:dartz/dartz.dart';
import 'package:sf_jrw/core/errors/failures.dart';

abstract class Usecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class UseCaseWithoutParams<T> {
  Future<Either<Failure, T>> call();
}
