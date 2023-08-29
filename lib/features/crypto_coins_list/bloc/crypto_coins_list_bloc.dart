import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins_repositories/abstract_coins_repositories.dart';
import 'package:crypto_coins_list/repositories/crypto_coins_repositories/crypto_coins_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coins_list_event.dart';
part 'crypto_coins_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
