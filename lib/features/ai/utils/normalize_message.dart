class NormalizedMessage {
  const NormalizedMessage({
    required this.original,
    required this.normalized,
    required this.compact,
  });

  final String original;
  final String normalized;
  final String compact;
}

class NormalizeMessage {
  const NormalizeMessage._();

  static const Map<String, String> _replacements = {
    'á': 'a',
    'à': 'a',
    'â': 'a',
    'ã': 'a',
    'ä': 'a',
    'é': 'e',
    'è': 'e',
    'ê': 'e',
    'ë': 'e',
    'í': 'i',
    'ì': 'i',
    'î': 'i',
    'ï': 'i',
    'ó': 'o',
    'ò': 'o',
    'ô': 'o',
    'õ': 'o',
    'ö': 'o',
    'ú': 'u',
    'ù': 'u',
    'û': 'u',
    'ü': 'u',
    'ç': 'c',
  };

  static NormalizedMessage call(String message) {
    final original = message.trim();
    final normalized = normalizeForComparison(original);
    final compact = normalized
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(RegExp(r'(?<=\d)(?=[a-z])'), ' ')
        .replaceAll(RegExp(r'(?<=[a-z])(?=\d)'), ' ')
        .trim();
    return NormalizedMessage(
      original: original,
      normalized: normalized,
      compact: compact,
    );
  }

  static String normalizeForComparison(String value) {
    final lowercase = value.toLowerCase();
    final buffer = StringBuffer();
    for (final rune in lowercase.runes) {
      final char = String.fromCharCode(rune);
      buffer.write(_replacements[char] ?? char);
    }
    return buffer.toString().replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  static String titleCase(String value) {
    final words = value
        .split(RegExp(r'\s+'))
        .where((word) => word.trim().isNotEmpty)
        .map((word) {
          if (word.length == 1) {
            return word.toUpperCase();
          }
          return '${word[0].toUpperCase()}${word.substring(1)}';
        })
        .toList();
    return words.join(' ');
  }
}
