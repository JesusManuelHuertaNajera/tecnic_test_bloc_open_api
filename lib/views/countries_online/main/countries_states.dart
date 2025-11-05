import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/country_card_information/country_information.dart';
import 'package:tecnic_test_bloc_open_api/components/error_load_api.dart';
import 'package:tecnic_test_bloc_open_api/components/loader.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';

class CountryView extends StatelessWidget {
  final CountryState state;
  const CountryView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.runtimeType) {
      case CountryInitial:
        return loaderScreen();

      case CountryLoading:
        return loaderScreen();

      case CountryLoaded:
        final loadedState = state as CountryLoaded;
        return ListView(
          padding: EdgeInsets.all(SpacesBetweenContent.pading),
          children: [
            ...loadedState.countries.map((country) => contentCountry(model: country))
          ],
        );

      case CountryError:
        return errorLoadApi(onPressed: () {
          context.read<CountryCubit>().fetchCountries();
        });

      default:
        return const SizedBox();
    }
  }
}
