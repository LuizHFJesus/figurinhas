import 'package:get/get.dart';

import 'package:sticker_manager_wc22/core/i18n/locales/en_us.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/es_es.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/pt_br.dart';

class AppTranslations extends Translations {
  static const String ptBRKey = 'pt_BR';
  static const String enUSKey = 'en_US';
  static const String esESKey = 'es_ES';

  @override
  Map<String, Map<String, String>> get keys => {
    ptBRKey: ptBR,
    esESKey: esES,
    enUSKey: enUS,
  };
}
