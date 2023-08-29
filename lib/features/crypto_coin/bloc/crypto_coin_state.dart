part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinState extends Equatable {}

class CryptoCoinInitial extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinState {
  final CryptoCoinDitail cryptoCoinDitail;

  CryptoCoinLoaded(this.cryptoCoinDitail);
  @override
  List<Object?> get props => [cryptoCoinDitail];
}

class CryptoCoinLoadingFailure extends CryptoCoinState {
  final Object? exception;

  CryptoCoinLoadingFailure({
    required this.exception,
  });
  @override
  List<Object?> get props => [exception];
}
