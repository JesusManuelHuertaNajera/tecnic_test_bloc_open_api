class CountryModel {
   String nameCommon;
   String nameOfficial;
   String? capital;
   String currencies;
   String nativeNames;
   String flag;
  int? id;
  CountryModel({
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.currencies,
    required this.nativeNames,
    required this.flag,
    this.id,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final currenciesMap = json['currencies'] as Map<String, dynamic>?;
    String currenciesStr = '';
    if (currenciesMap != null) {
      currenciesStr = currenciesMap.entries.map((e) {
        final data = e.value as Map<String, dynamic>;
        final name = data['name'] ?? '';
        final symbol = data['symbol'] ?? '';
        return '${e.key}: $name ($symbol)';
      }).join(', ');
    }

    final nativeMap = json['name']?['nativeName'] as Map<String, dynamic>?;
    String nativeStr = '';
    if (nativeMap != null) {
      nativeStr = nativeMap.entries.map((e) {
        final data = e.value as Map<String, dynamic>;
        final common = data['common'] ?? '';
        return '${e.key}: $common';
      }).join(', ');
    }

    return CountryModel(
        nameCommon: json['name']?['common'] ?? 'Desconocido',
        nameOfficial: json['name']?['official'] ?? 'Desconocido',
        capital: (json['capital'] != null && json['capital'].isNotEmpty)
            ? json['capital'][0]
            : null,
        currencies: currenciesStr,
        nativeNames: nativeStr,
        flag: json['flags']?['png'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'name_common': nameCommon,
      'name_official': nameOfficial,
      'capital': capital,
      'currencies': currencies,
      'native_names': nativeNames,
      'flag': flag,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
        nameCommon: map['name_common'] ?? '',
        nameOfficial: map['name_official'] ?? '',
        capital: map['capital'],
        currencies: map['currencies'] ?? '',
        nativeNames: map['native_names'] ?? '',
        flag: map['flag'] ?? '',
        id: map['id'] ?? 0);
  }
}
