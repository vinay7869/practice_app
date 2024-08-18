import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice_app/bloc%20bloc%20pract/bloc/home_new_bloc.dart';
import 'package:practice_app/sql%20pract/screen/todo.dart';
import 'bloc cubit pract/screens/favorites/cubit/favourites_cubit.dart';
import 'bloc cubit pract/screens/home/cubit/home_cubit.dart';
import 'firebase_options.dart';
import 'helpers/global.dart';
import 'helpers/pref.dart';
import 'bloc cubit pract/routes/routes.dart';
import 'bloc cubit pract/screens/home/screen/home.dart';
import 'sql api/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter().then((value) async => await Pref.initializeHive());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        // BlocProvider(create: (_) => HomeNewBloc()),
        BlocProvider(create: (_) => FavouritesCubit()),
      ],
      child: MaterialApp(
      
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => generateRoutes(settings),
        initialRoute: Home.routeName,
        // home: const TodoPage(),
        // home: const HomeScreen(),
      ),
    );
  }
}
