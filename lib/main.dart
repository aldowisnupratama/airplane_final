import 'package:airplane/app_route.dart';
import 'package:airplane/cubit/cubit.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp(
    router: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute router;
  const MyApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
        BlocProvider(create: (context) => SeatCubit()),
        BlocProvider(create: (context) => TransactionCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
