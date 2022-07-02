import 'package:excell_creater/app.dart';
import 'package:excell_creater/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initializeObjectBox(),
  ]);

  runApp(const ProviderScope(child: App()));
}
