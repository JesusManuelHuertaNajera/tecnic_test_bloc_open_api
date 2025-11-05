import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/API/methods/countries/main.dart';

class CountriesSearchCubit extends Cubit<CountryState> {
  CountriesSearchCubit() : super(CountryInitial());
String? lastSearch;
  Future<void> fetchCountries(String? countryName) async {
    emit(CountryLoading());
    try {
      List<CountryModel> response =
          await CountriesEndpoints.getSearchCountryByName(
              countryName: countryName??lastSearch??'');
      if (response.isEmpty) {
        emit(CountryError());
        return;
      }
      emit(CountryLoaded(response));
    } catch (e) {
      emit(CountryError());
    }
  }
  
  void resetState() {
        //clean the state when the user do pop up

    emit(CountryInitial());
    lastSearch = null;
  }
}

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<CountryModel> countries;
  CountryLoaded(this.countries);
}

class CountryError extends CountryState {}
