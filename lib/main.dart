import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice_app/bloc%20prat/favorites/cubit/favourites_cubit.dart';
import 'package:practice_app/bloc%20prat/home/cubit/home_cubit.dart';
import 'package:practice_app/firebase_options.dart';
import 'package:practice_app/helpers/global.dart';
import 'package:practice_app/helpers/pref.dart';
import 'package:practice_app/routes/routes.dart';
import 'bloc prat/home/screen/home.dart';

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
        BlocProvider(create: (_) => FavouritesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => generateRoutes(settings),
        home: const Home(),
      ),
    );
  }
}
