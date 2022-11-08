

import 'package:crypto_moedas/configs/app_settings.dart';
import 'package:crypto_moedas/meu_aplicativo.dart';
import 'package:crypto_moedas/repository/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppSettings(),),
          ChangeNotifierProvider( create: (context) => FavoritasRepository(), ),
    ],
        child:  MeuAplicativo(),
      ),
  );
}




