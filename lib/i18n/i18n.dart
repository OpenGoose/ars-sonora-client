import 'dart:convert';

class I18n {
  static Map<Language, Map<TFile, String>> allTranslations = {};

  static Language language = Language.en_US;
  static Map<TFile, dynamic> translations = {};

  static String t(TFile tFile, String path) {
    var tr = translations[tFile];
    if (tr == null) return path;

    var keys = path.split('.');

    dynamic current = tr;
    for (String key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return path;
      }
    }
    return current;
  }

  // Setup
  static setLanguage(Language language) {
    var langEntry = allTranslations[language];

    if (langEntry == null) return;

    // Load
    I18n.language = language;

    translations = parseLanguageData(langEntry);
  }

  static Map<TFile, dynamic> parseLanguageData(Map<TFile, String> langData) {
    var parsedData = <TFile, dynamic>{};

    for (var fileContentEntry in langData.entries) {
      parsedData[fileContentEntry.key] = jsonDecode(fileContentEntry.value);
    }

    return parsedData;
  }

  static setup(Map<Language, Map<TFile, String>> allTranslations) {
    I18n.allTranslations = allTranslations;

    // Default lang
    setLanguage(Language.en_US);
  }
}

// ignore: constant_identifier_names
enum Language { en_US }

enum TFile { common, layout }
