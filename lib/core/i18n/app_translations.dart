import 'package:get/get.dart';

import 'package:sticker_manager_wc22/core/i18n/locales/en_us.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/es_es.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/es_mx.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/fr_ca.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/it_it.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/ja_jp.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/ko_kr.dart';
import 'package:sticker_manager_wc22/core/i18n/locales/pt_br.dart';

class AppTranslations extends Translations {
  static const String ptBRKey = 'pt_BR';
  static const String enUSKey = 'en_US';
  static const String esESKey = 'es_ES';
  static const String itITKey = 'it_IT';
  static const String frCAKey = 'fr_CA';
  static const String esMXKey = 'es_MX';
  static const String jaJPKey = 'ja_JP';
  static const String koKRKey = 'ko_KR';

  @override
  Map<String, Map<String, String>> get keys => {
    ptBRKey: ptBR,
    esESKey: esES,
    enUSKey: enUS,
    itITKey: itIT,
    frCAKey: frCA,
    esMXKey: esMX,
    jaJPKey: jaJP,
    koKRKey: koKR,
  };
}
