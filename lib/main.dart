import 'package:bloc_test_1/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import './presentations/routes/app_route.dart';

void main() {
  runApp(MyApp(appRouter: RouteGenerator(), connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  final RouteGenerator appRouter;
  final Connectivity connectivity;
  MyApp({Key key, @required this.appRouter, @required this.connectivity});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
              internetCubit: InternetCubit(connectivity: connectivity)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
