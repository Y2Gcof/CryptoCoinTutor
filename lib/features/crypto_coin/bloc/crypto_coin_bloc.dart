import 'package:crypto_coins_list/repositories/crypto_coins_repositories/abstract_coins_repositories.dart';
import 'package:crypto_coins_list/repositories/crypto_coins_repositories/models/crypto_coin_ditail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.coinsRepository) : super(CryptoCoinInitial()) {
    on<LoadCryptoCoin>((event, emit) async {
      try {
        if (state is! CryptoCoinLoaded) {
          emit(CryptoCoinLoading());
        }
        final coinDetails =
            await coinsRepository.getCoinDetails(event.currencyCode);
        emit(CryptoCoinLoaded(coinDetails));
      } catch (e) {
        emit(CryptoCoinLoadingFailure(exception: e));
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
