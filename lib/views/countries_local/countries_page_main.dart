import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_db.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_local/countries_states.dart';

class CountriesLocalPage extends StatefulWidget {
  const CountriesLocalPage({super.key});

  @override
  State<CountriesLocalPage> createState() => _CountriesLocalPageState();
}

class _CountriesLocalPageState extends State<CountriesLocalPage> {
  @override
  void initState() {
    super.initState();
    context.read<CountriesDbCubit>().fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<CountriesDbCubit>().resetState();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Países DB',
            style: TextStylesCustom.titleMain(fontWeightC: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[350],
        ),
        body: BlocBuilder<CountriesDbCubit, CountryState>(
          builder: (context, state) {
            return CountriesDbView(state: state);
          },
        ),
      ),
    );
  }
}
