import 'package:asteroid_test_app/features/ImageOfTheDay/ImageOfTheDayModel.dart';
import 'package:asteroid_test_app/features/ImageOfTheDay/ImageOfTheDayService.dart';
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
    final AsyncValue<ImageOfTheDayModel> latestImageFuture =
        ref.watch(latestImageOfTheDayFutureProvider);
    return latestImageFuture.maybeWhen(
      data: (data) {
        return Column(
          children: [
            const Text('Image of the Day'),
            const SizedBox(height: 8),
            Image.network(
              data.hdurl,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress != null
                      ? const CircularProgressIndicator()
                      : child,
            ),
          ],
        );
      },
      orElse: () => Expanded(
        child: Center(
          child: Column(
            children: const [
              Text('Error or other'),
            ],
          ),
        ),
      ),
    );
  }
}
