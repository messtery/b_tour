import 'package:b_tour/core/bloc/app_setting_bloc.dart';
import 'package:b_tour/core/session_manager.dart';
import 'package:b_tour/screens/user/edit_profile.dart';
import 'package:b_tour/screens/home.dart';
import 'package:b_tour/screens/user/login.dart';
import 'package:b_tour/screens/place_detail.dart';
import 'package:b_tour/screens/user/profile.dart';
import 'package:b_tour/screens/user/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //discuss to mentor
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('session');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingBloc()..add(SettingAppEvent()),
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (context, state) {
          Widget _home = Login();
          print(SessionManager().getActiveId());
          if (state is AppSettingAuthenticated) {
            _home = const Home();
          }
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Quicksand',
            ),
            // initialRoute: _home,
            debugShowCheckedModeBanner: false,
            routes: <String, WidgetBuilder>{
              '/register': (context) => Register(),
              '/login': (context) => Login(),
              '/home': (context) => const Home(),
              '/place-detail': (context) => const PlaceDetail(),
              '/profile': (context) => Profile(),
              '/edit-profile': (context) => const EditProfile(),
            },
            home: _home,
          );
        },
      ),
    );
  }
}
