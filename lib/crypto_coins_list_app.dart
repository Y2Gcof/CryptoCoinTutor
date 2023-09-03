import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoAplication extends StatelessWidget {
  const CryptoAplication({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>()),
      ],
    );
  }
}
