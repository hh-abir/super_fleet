import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends ConsumerWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Simulate an async task (e.g., fetching data) during splash screen
    Future.delayed(const Duration(seconds: 2), () {
      (context).go(
        '/login',
      ); // Navigate to the home page
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
