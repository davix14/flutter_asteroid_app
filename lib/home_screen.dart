import 'package:asteroid_test_app/features/ImageOfTheDay/presentation/ImageOfTheDayWidget.dart';
import 'package:flutter/cupertino.dart';
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
    return Padding(
        padding:
        const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      child: Expanded(
        child: Column(
          children: [
            ImageOfTheDayWidget(),
            const SizedBox(height: 8.0,),

          ],
        ),
      ),
    );
  }

}
