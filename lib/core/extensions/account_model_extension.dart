import 'package:meru_test/core/shared/data/models/account_model.dart';

extension AccountModelExtension on AccountModel {
  String get initials => _getInitials(fullName);

  String _getInitials(String fullName) {
    final names = fullName.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    } else if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '';
  }
}
