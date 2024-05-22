import 'dart:convert';
import 'dart:io';

class I18n {
  static I18n? _i18n;
  static I18n getInstance() {
    if (_i18n == null) throw Error();
    print("GET instance");
    return _i18n!;
  }

  static void loadInstance(I18n i18n) {
    I18n._i18n = i18n;
  }

  static String t(String path) {
    return getInstance().translate(path);
  }

  // Behaviour

  ActiveTranslation? _activeTranslation;
  late List<Translation> translations;
  I18n(this.translations, {Language? defaultLanguage}) {
    if (defaultLanguage != null) changeLanguage(defaultLanguage);
  }

  void changeLanguage(Language language) {
    _activeTranslation = ActiveTranslation(
        language: language,
        parsedTranslations: translations
            .firstWhere((tr) => tr.language == language)
            .parseTranslations());
  }

  String translate(String path) {
    if (_activeTranslation == null) return path;
    List<String> keys = path.split('.');

    dynamic current = _activeTranslation?.parsedTranslations;
    for (String key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return path; // Key not found
      }
    }
    return current; // Return the found value
  }
}

class Translation {
  Language language;
  String fileContent;

  Translation({required this.language, required this.fileContent});

  dynamic parseTranslations() {
    try {
      // Decode the JSON string
      final json = jsonDecode(fileContent);

      return json;
    } catch (e) {
      // Handle any errors
      print('Error reading or parsing file: $e');
      return null;
    }
  }
}

class ActiveTranslation {
  Language language;
  dynamic parsedTranslations;
  ActiveTranslation({required this.language, required this.parsedTranslations});
}

enum Language {
  // ignore: constant_identifier_names
  en_US,
}
