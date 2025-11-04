import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_api.dart';
import 'package:tecnic_test_bloc_open_api/views/countries/countries_page_main.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountryCubit()),
        // BlocProvider(create: (_) => WeatherCubit()),
        // BlocProvider(create: (_) => UserCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialRoute: '/home', 
      routes: {
        '/home': (context) => const CountryPage(),
        // '/details': (context) =>
        //     const DetailsPage(), 
      },
    );
  }
}
