import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/API/methods/countries/main.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial()) {
    _init();
  }

  void _init() {
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    emit(CountryLoading());
    try {
      List<CountryModel> response = await CountriesEndpoints.getCountries();
      if (response.isEmpty) {
        emit(CountryError());
        return;
      }
      emit(CountryLoaded(response));
    } catch (e) {
      emit(CountryError());
    }
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
