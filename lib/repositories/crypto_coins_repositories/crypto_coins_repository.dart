import 'package:crypto_coins_list/repositories/crypto_coins_repositories/crypto_coins_repositories.dart';
import 'package:crypto_coins_list/repositories/crypto_coins_repositories/models/crypto_coin_ditail.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinsRepository({
    required this.dio,
  });
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final respons = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,&tsyms=USD');

    final data = respons.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://cryptocompare.com/$imageUrl',
      );
    }).toList();
    return dataList;
  }

  @override
  Future<CryptoCoinDitail> getCoinDetails(currencyCode) async {
    final respons = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = respons.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final price = usdData['PRICE'];
    final imageUrl = usdData['IMAGEURL'];
    final lastUpdate = usdData['LASTUPDATE'];
    final hight24Hours = usdData['HIGH24HOUR'];
    final low24Hours = usdData['LOW24HOUR'];
    final toSymbol = usdData['TOSYMBOL'];

    return CryptoCoinDitail(
      imageUrl: 'https://cryptocompare.com/$imageUrl',
      name: currencyCode,
      priceInUSD: price,
      hight24Hours: hight24Hours,
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
      low24Hours: low24Hours,
      toSymbol: toSymbol,
    );
  }
}
