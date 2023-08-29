part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {}

class LoadCryptoCoin extends CryptoCoinEvent {
  final String currencyCode;

  LoadCryptoCoin({
    required this.currencyCode,
  });
  @override
  List<Object?> get props => [currencyCode];
}
