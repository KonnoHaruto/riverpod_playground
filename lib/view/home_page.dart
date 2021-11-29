import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/provider.dart';

import '../provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(appNameProvider);
    final counter = ref.watch(counterProvider.notifier);
    final resetCount = ref.watch(resetCountProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${counter.state}',
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                counter.update((state) => state + 1);
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                counter.update((state) => resetCount);
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
