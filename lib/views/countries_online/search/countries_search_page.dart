import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_search_api.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_online/search/countries_search_states.dart';

class CountriesSearchPage extends StatelessWidget {
  const CountriesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<CountriesSearchCubit>().resetState();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Buscador',style: TextStylesCustom.titleMain(fontWeightC: FontWeight.bold),),
          backgroundColor: Colors.grey[350],
        ),
        body: BlocBuilder<CountriesSearchCubit, CountryState>(
          builder: (context, state) {
            return CountriesSearchView(state: state);
          },
        ),
      ),
    );
  }
}
