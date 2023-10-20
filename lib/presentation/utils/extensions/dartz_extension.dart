import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  L asLeft() => (this as Left).value;
  R asRight() => (this as Right).value;
}
