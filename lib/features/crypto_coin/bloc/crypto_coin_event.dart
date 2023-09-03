part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {}

class LoadCryptoCoin extends CryptoCoinEvent {
  final String? currencyCode;
  final Completer? completer;

  LoadCryptoCoin({
    this.completer,
    this.currencyCode,
  });
  @override
  List<Object?> get props => [currencyCode, completer];
}
