import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/country_card_information/country_information.dart';
import 'package:tecnic_test_bloc_open_api/components/error_load_api.dart';
import 'package:tecnic_test_bloc_open_api/components/loader.dart';
import 'package:tecnic_test_bloc_open_api/components/snack.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/services/BD/main.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';

class CountriesDbView extends StatelessWidget {
  final CountryState state;
  const CountriesDbView({super.key, required this.state});

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
            ...loadedState.countries.map((country) => contentCountry(
                model: country,
                onPressedDelete: () async {
                  int result = await DatabaseService.instance
                      .deleteCountry(country.id ?? 0);
                  showSnack(context, result != 0);
                  context.read<CountriesDbCubit>().fetchCountries();
                },
                onPressedViewMore: () {
                  Navigator.pushNamed(
                    context,
                    '/countryDetails',
                    arguments: country,
                  ).then((e) {
                    context.read<CountriesDbCubit>().fetchCountries();
                  });
                }))
          ],
        );

      case CountryError:
        return errorLoadApi(
            onPressed: () {
              context.read<CountriesDbCubit>().fetchCountries();
            },
            isLocal: true);

      default:
        return const SizedBox();
    }
  }
}
