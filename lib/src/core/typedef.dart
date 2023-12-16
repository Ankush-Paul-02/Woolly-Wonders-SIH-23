import 'package:fpdart/fpdart.dart';
import 'package:sih23/src/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;