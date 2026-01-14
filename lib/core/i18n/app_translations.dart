import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/en_us.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/es_es.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/pt_br.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'pt_BR': ptBR,
    'es_ES': esES,
    'en_US': enUS,
  };
}
