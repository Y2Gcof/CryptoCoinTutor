import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins_repositories/abstract_coins_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/crypto_coins_repositories/models/models.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;
  final _cryptoCoinBloc = CryptoCoinBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is CryptoCoin, 'You must provide String args');
    coin = args as CryptoCoin;
    _cryptoCoinBloc.add(LoadCryptoCoin(currencyCode: coin!.name));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(coin!.name),
        ),
      ),
      body: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
        bloc: _cryptoCoinBloc,
        builder: (context, state) {
          if (state is CryptoCoinLoaded) {
            final coin = state.cryptoCoinDitail;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(coin.imageUrl),
                  ),
                  Text(
                    coin.name,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            coin.hight24Hours.toString(),
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontSize: 25),
                          ),
                        ),
                      ),
                      Text(
                        coin.low24Hours.toString(),
                        style:
                            theme.textTheme.bodyMedium?.copyWith(fontSize: 25),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
