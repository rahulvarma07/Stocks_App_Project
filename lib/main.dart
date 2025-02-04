import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockproject/Bloc/getAllData_Bloc.dart';
import 'package:stockproject/Bloc/getGraphData_Bloc.dart';
import 'package:stockproject/Screens/Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>GetAllDataUsingBloc()),
        BlocProvider(create: (_)=>GetIndividualDataBloc()),
      ],
      child: MaterialApp(
        theme:  ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          )
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
