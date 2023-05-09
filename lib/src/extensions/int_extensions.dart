import 'dart:math';

extension IntExtensions on int {
  static Random random = Random();
  static const charactersModel = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  int get randomNum => random.nextInt(this);

  String getRandomString() => String.fromCharCodes(Iterable.generate(
      this, (_) => charactersModel.codeUnitAt(random.nextInt(charactersModel.length))));

  /// Get random lower case string
  String get randomLowercase => getRandomString().toLowerCase();

  /// Get random upper case string
  String get randomUppercase => getRandomString().toUpperCase();

  /// get random not number string
  String get randomNotNumber => getRandomString().replaceAll(RegExp(r'\d'), '');

  /// get random not letter string
  String get randomNotLetter => getRandomString().replaceAll(RegExp(r'[a-zA-Z]'), '');

  /// get random not letter and number string
  String get randomNotLetterAndNumber => getRandomString().replaceAll(RegExp(r'[a-zA-Z0-9]'), '');
}
