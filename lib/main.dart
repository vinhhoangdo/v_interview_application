import 'package:flutter/material.dart';
import 'package:interview_application/src/src.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Interview Apps',
        theme: IAThemeData.lightTheme,
        routes: Routes.routes,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, builder) {
            return authProvider.alreadyLogin
                ? const HomePage()
                : const LoginPage();
          },
        ),
      ),
    );
  }
}
