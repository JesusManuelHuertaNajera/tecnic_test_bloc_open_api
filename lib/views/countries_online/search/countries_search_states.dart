import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/country_card_information/country_information.dart';
import 'package:tecnic_test_bloc_open_api/components/error_load_api.dart';
import 'package:tecnic_test_bloc_open_api/components/loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_search_api.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_online/search/components/search_body.dart';

class CountriesSearchView extends StatelessWidget {
  final CountryState state;
  const CountriesSearchView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CountriesSearchCubit>();

    switch (state.runtimeType) {
      case CountryInitial:
        return searchBody(Container());

      case CountryLoading:
        return loaderScreen();

      case CountryLoaded:
        final loadedState = state as CountryLoaded;
        return searchBody(Expanded(
            child: ListView(
          children: [
            ...loadedState.countries.map((country) => contentCountry(model:  country))
          ],
        )));

      case CountryError:
        return errorLoadApi(onPressed: () {
          cubit.fetchCountries(null);
        });

      default:
        return const SizedBox();
    }
  }
}
