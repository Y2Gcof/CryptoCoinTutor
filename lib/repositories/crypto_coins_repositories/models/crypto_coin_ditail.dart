import 'package:crypto_coins_list/repositories/crypto_coins_repositories/crypto_coins_repositories.dart';

class CryptoCoinDitail extends CryptoCoin {
  const CryptoCoinDitail({
    required super.name,
    required super.priceInUSD,
    required super.imageUrl,
    required this.hight24Hours,
    required this.lastUpdate,
    required this.toSymbol,
    required this.low24Hours,
  });

  final String toSymbol;

  final DateTime lastUpdate;

  final double hight24Hours;

  final double low24Hours;

  @override
  List<Object?> get props => [
        name,
        priceInUSD,
        imageUrl,
        lastUpdate,
        toSymbol,
        hight24Hours,
        low24Hours
      ];
}
