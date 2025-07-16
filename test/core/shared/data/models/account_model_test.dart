import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/extensions/account_model_extension.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';

void main() {
  group('AccountModel', () {
    test('should create AccountModel from JSON', () {
      final json = {
        'id': '1',
        'fullName': 'John Doe',
        'avatarUrl': 'https://example.com/avatar.jpg',
        'balance': 100.50,
      };

      final account = AccountModel.fromJson(json);

      expect(account.id, '1');
      expect(account.fullName, 'John Doe');
      expect(account.avatarUrl, 'https://example.com/avatar.jpg');
      expect(account.balance, 100.50);
    });

    test('should convert AccountModel to JSON', () {
      final account = AccountModel(
        id: '1',
        fullName: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      final json = account.toJson();

      expect(json['id'], '1');
      expect(json['fullName'], 'John Doe');
      expect(json['avatarUrl'], 'https://example.com/avatar.jpg');
      expect(json['balance'], 100.50);
    });

    test('should generate correct initials from full name', () {
      final account1 = AccountModel(
        id: '1',
        fullName: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      final account3 = AccountModel(
        id: '3',
        fullName: 'Carlos',
        avatarUrl: 'https://example.com/avatar3.jpg',
        balance: 150.00,
      );

      expect(account1.initials, 'JD');
      expect(account3.initials, 'C');
    });

    test('should handle single word name for initials', () {
      final account = AccountModel(
        id: '1',
        fullName: 'John',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      expect(account.initials, 'J');
    });
  });
}
