import 'package:auto_route/auto_route.dart';
import 'package:my_chat/screens/auth_screen/presentation/view/auth_screen.dart';
import 'package:my_chat/screens/chat_screen/presentation/view/chat_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: ChatRoute.page),
      ];
}
