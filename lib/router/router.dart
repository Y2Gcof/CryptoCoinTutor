import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_coins_list/crypto_coins_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin/': (context) => const CryptoCoinScreen(),
};
