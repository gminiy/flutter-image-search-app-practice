import 'package:go_router/go_router.dart';
import 'package:image_search_app_practice/di/di_setup.dart';
import 'package:image_search_app_practice/ui/main_screen.dart';
import 'package:image_search_app_practice/ui/main_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => ChangeNotifierProvider(
      create: (_) => getIt<MainViewModel>(),
      child: const MainScreen(),
    ),
  ),
]);
