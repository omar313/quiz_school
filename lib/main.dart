import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_school/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:quiz_school/features/home/presentation/screen/home_screen.dart';

import 'injection_container.dart' as DI;

void main() {
WidgetsFlutterBinding.ensureInitialized();
  DI.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white
        ),
        home: BlocProvider(
          create: (context) => DI.di.get<HomeCubit>(),
          
          child: HomeScreen(),
        ));
  }
}
