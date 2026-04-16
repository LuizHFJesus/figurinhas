class TextNormalizer {
  static String normalize(String input) {
    var s = input.trim().toLowerCase();

    // Simple diacritics removal (enough for PT/ES names).
    const map = {
      'á': 'a',
      'à': 'a',
      'ã': 'a',
      'â': 'a',
      'é': 'e',
      'ê': 'e',
      'í': 'i',
      'ó': 'o',
      'ô': 'o',
      'õ': 'o',
      'ú': 'u',
      'ç': 'c',
      'ñ': 'n',
    };

    final buf = StringBuffer();
    for (final ch in s.split('')) {
      buf.write(map[ch] ?? ch);
    }
    s = buf.toString();

    // Collapse whitespace and separators to single spaces
    s = s.replaceAll(RegExp(r'[_\-]+'), ' ');
    s = s.replaceAll(RegExp(r'\s+'), ' ').trim();
    return s;
  }

  static String buildSearchText(Iterable<String?> parts) {
    return normalize(
      parts.where((e) => e != null && e.trim().isNotEmpty).join(' '),
    );
  }
}
