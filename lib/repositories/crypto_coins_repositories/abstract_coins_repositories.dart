import 'package:crypto_coins_list/repositories/crypto_coins_repositories/models/crypto_coin.dart';
import 'package:crypto_coins_list/repositories/crypto_coins_repositories/models/crypto_coin_ditail.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDitail> getCoinDetails(currencyCode);
}
