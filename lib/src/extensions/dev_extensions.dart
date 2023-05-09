import 'dart:developer';


extension DeveloperExtension on Object? {
  void get logger {
    log(toString(), name: 'Grock Logger');
  }

  void get printer {
    print(toString());
  }
}
