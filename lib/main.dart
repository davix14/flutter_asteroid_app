import 'package:asteroid_test_app/home_screen.dart';
import 'package:asteroid_test_app/theme/color_schemes.g.dart';
import 'package:asteroid_test_app/util/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final localStorageRepo = await LocalStorageRepository.createInstance();
  
  runApp(
    ProviderScope(
      overrides: [localStorageProvider.overrideWithValue(localStorageRepo)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        title: 'OpenAsteroids',
        home: const HomeScreen(),
      ),
    ),
  );
}
