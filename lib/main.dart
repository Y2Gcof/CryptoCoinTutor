import 'package:crypto_coins_list/repositories/crypto_coins_repositories/crypto_coins_repositories.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_coins_list_app.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started');
  GetIt.I<Talker>().error('Talker started');
  GetIt.I<Talker>().info('Talker started');
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: Dio()),
  );
  runApp(const CryptoAplication());
}
