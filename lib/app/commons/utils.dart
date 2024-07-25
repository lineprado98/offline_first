double currencyToDouble(String value) {
  String cleanedValue = value.replaceAll('.', '');
  cleanedValue = cleanedValue.replaceAll(',', '.');

  final double result = double.tryParse(cleanedValue) ?? 0.0;
  return result;
}

bool isUrl(String input) {
  final RegExp urlRegExp = RegExp(
    r'^(https?|ftp):\/\/'
    r'([A-Za-z0-9.-]+)'
    r'(:\d+)?(\/[^\/\?]+)*'
    r'(\?[^#\s]*)?(#[^\s]*)?$',
    caseSensitive: false,
  );
  return urlRegExp.hasMatch(input);
}
