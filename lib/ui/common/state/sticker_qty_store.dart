import 'package:flutter/foundation.dart';

class StickerQtyStore {
  final _notifiers = <String, ValueNotifier<int>>{};

  ValueListenable<int> listenableOf(String code) {
    return _notifiers.putIfAbsent(code, () => ValueNotifier<int>(0));
  }

  int get(String code) => _notifiers[code]?.value ?? 0;

  void set(String code, int value) {
    final n = _notifiers.putIfAbsent(code, () => ValueNotifier<int>(value));
    if (n.value != value) n.value = value;
  }

  void resetOthers(Set<String> keepCodes) {
    for (final entry in _notifiers.entries) {
      if (!keepCodes.contains(entry.key)) {
        if (entry.value.value != 0) {
          entry.value.value = 0;
        }
      }
    }
  }

  void dispose() {
    for (final n in _notifiers.values) {
      n.dispose();
    }
    _notifiers.clear();
  }
}
