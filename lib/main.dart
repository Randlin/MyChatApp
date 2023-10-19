import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_chat/core/store/user_store.dart';
import 'package:my_chat/di/injector.dart';
import 'package:my_chat/routes/app_router.dart';
import 'package:my_chat/screens/auth_screen/presentation/view/auth_screen.dart';
import 'package:provider/provider.dart';
import 'screens/chat_screen/presentation/view/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }

  final UserStore userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Chat',
      theme: ThemeData(
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.deepOrange)),
      builder: (context, _) => Provider<UserStore>(
        create: (_) => userStore..setUserData(),
        child: Consumer<UserStore>(builder: (_, store, __) {
          return Observer(builder: (context) {
            if (store.isLoading) {
              return const LoadingScreen();
            } else {
              return store.currentUser == null
                  ? const AuthScreen()
                  : const ChatScreen();
            }
          });
        }),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
