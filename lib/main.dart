import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_fleet/routes/go_router_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const ProviderScope(
    child: SuperFleet(),
  ));
}

class SuperFleet extends ConsumerStatefulWidget {
  const SuperFleet({super.key});

  @override
  ConsumerState<SuperFleet> createState() => _SuperFleetState();
}

class _SuperFleetState extends ConsumerState<SuperFleet> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: "Super Fleet",
    );
  }
}
