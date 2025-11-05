import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_api.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_online/main/countries_states.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Países',
          style: TextStylesCustom.titleMain(fontWeightC: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[350],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/localCountries');
              },
              icon: const Icon(
                Icons.storage,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/search');
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
              )),
        ],
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          return CountryView(state: state);
        },
      ),
    );
  }
}
