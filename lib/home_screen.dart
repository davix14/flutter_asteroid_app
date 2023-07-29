import 'package:asteroid_test_app/features/ImageOfTheDay/presentation/ImageOfTheDayWidget.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/neo_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          style: TextStyle(color: Colors.white),
          'OpenAsteroids',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageOfTheDayWidget(),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: NEOSearchWidget(),
            )
          ],
        ),
      ),
    );
  }
}
