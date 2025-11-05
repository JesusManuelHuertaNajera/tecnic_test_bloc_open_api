import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_api.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_db.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_search_api.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_local/countries_page_main.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_online/main/countries_page_main.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_online/search/countries_search_page.dart';
import 'package:tecnic_test_bloc_open_api/views/country_details/country_detail_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountryCubit()),
        BlocProvider(create: (_) => CountriesSearchCubit()),
        BlocProvider(create: (_) => CountriesDbCubit()),
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
        '/search': (context) => const CountriesSearchPage(),
        '/localCountries': (context) => const CountriesLocalPage(),
        '/countryDetails': (context) {
          final country =
              ModalRoute.of(context)!.settings.arguments as CountryModel;
          return MyCountryDetailPage(countryInfo: country);
        },
      },
    );
  }
}
