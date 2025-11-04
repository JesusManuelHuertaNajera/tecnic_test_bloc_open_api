class CountryModel {
  final String nameCommon;
  final String nameOfficial;
  final String? capital;
  final String currencies; // Se guardará como texto (ej: "SYP: Syrian pound (£)")
  final String nativeNames; // También texto (ej: "ara: سوريا")

  CountryModel({
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.currencies,
    required this.nativeNames,
  });

  // --- Conversión desde JSON ---
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    // Monedas
    final currenciesMap = json['currencies'] as Map<String, dynamic>?;
    String currenciesStr = '';
    if (currenciesMap != null) {
      currenciesStr = currenciesMap.entries
          .map((e) {
            final data = e.value as Map<String, dynamic>;
            final name = data['name'] ?? '';
            final symbol = data['symbol'] ?? '';
            return '${e.key}: $name ($symbol)';
          })
          .join(', ');
    }

    // Nombres nativos
    final nativeMap = json['name']?['nativeName'] as Map<String, dynamic>?;
    String nativeStr = '';
    if (nativeMap != null) {
      nativeStr = nativeMap.entries
          .map((e) {
            final data = e.value as Map<String, dynamic>;
            final common = data['common'] ?? '';
            return '${e.key}: $common';
          })
          .join(', ');
    }

    return CountryModel(
      nameCommon: json['name']?['common'] ?? 'Desconocido',
      nameOfficial: json['name']?['official'] ?? 'Desconocido',
      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : null,
      currencies: currenciesStr,
      nativeNames: nativeStr,
    );
  }

  // --- Conversión a Map (para guardar en SQLite) ---
  Map<String, dynamic> toMap() {
    return {
      'name_common': nameCommon,
      'name_official': nameOfficial,
      'capital': capital,
      'currencies': currencies,
      'native_names': nativeNames,
    };
  }

  // --- Conversión desde Map (de SQLite a modelo) ---
  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      nameCommon: map['name_common'] ?? '',
      nameOfficial: map['name_official'] ?? '',
      capital: map['capital'],
      currencies: map['currencies'] ?? '',
      nativeNames: map['native_names'] ?? '',
    );
  }
}
