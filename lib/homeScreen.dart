
import 'package:asteroid_test_app/features/ImageOfTheDay/ImageOfTheDayModel.dart';
import 'package:asteroid_test_app/features/ImageOfTheDay/ImageOfTheDayService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final AsyncValue<ImageOfTheDayModel> latestImageFuture = ref.watch(latestImageOfTheDayFutureProvider);
    return latestImageFuture.maybeWhen(
      data: (data) {
        return Expanded(
          child: Center( child: Column(
            children: [
              Text(data.toString()),
            ],
          ),)
        );
      },
      orElse: () => Expanded(
        child: Center( child: Column(
          children: const [
            Text('Error or other'),
          ],
        ),)
      ),
    );
  }
}