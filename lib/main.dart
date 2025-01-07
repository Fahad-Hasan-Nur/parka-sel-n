import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paikariwala_seller/paikariwala.dart';

Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Future.delayed(const Duration(seconds: 3));

  // FlutterNativeSplash.remove();
  await GetStorage.init();
  runApp(Paikariwala());
}
