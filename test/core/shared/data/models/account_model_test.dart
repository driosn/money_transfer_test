import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/extensions/account_model_extension.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';

void main() {
  group('AccountModel', () {
    test('should create AccountModel from JSON', () {
      // Arrange
      final json = {
        'id': '1',
        'fullName': 'John Doe',
        'avatarUrl': 'https://example.com/avatar.jpg',
        'balance': 100.50,
      };

      // Act
      final account = AccountModel.fromJson(json);

      // Assert
      expect(account.id, '1');
      expect(account.fullName, 'John Doe');
      expect(account.avatarUrl, 'https://example.com/avatar.jpg');
      expect(account.balance, 100.50);
    });

    test('should convert AccountModel to JSON', () {
      // Arrange
      final account = AccountModel(
        id: '1',
        fullName: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      // Act
      final json = account.toJson();

      // Assert
      expect(json['id'], '1');
      expect(json['fullName'], 'John Doe');
      expect(json['avatarUrl'], 'https://example.com/avatar.jpg');
      expect(json['balance'], 100.50);
    });

    test('should generate correct initials from full name', () {
      // Arrange & Act
      final account1 = AccountModel(
        id: '1',
        fullName: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      final account2 = AccountModel(
        id: '2',
        fullName: 'Ana Maria Torres',
        avatarUrl: 'https://example.com/avatar2.jpg',
        balance: 200.00,
      );

      final account3 = AccountModel(
        id: '3',
        fullName: 'Carlos',
        avatarUrl: 'https://example.com/avatar3.jpg',
        balance: 150.00,
      );

      // Assert
      expect(account1.initials, 'JD');
      expect(account2.initials, 'AMT');
      expect(account3.initials, 'C');
    });

    test('should handle empty full name for initials', () {
      // Arrange & Act
      final account = AccountModel(
        id: '1',
        fullName: '',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      // Assert
      expect(account.initials, '');
    });

    test('should handle single word name for initials', () {
      // Arrange & Act
      final account = AccountModel(
        id: '1',
        fullName: 'John',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      // Assert
      expect(account.initials, 'J');
    });

    test('should handle multiple spaces in name for initials', () {
      // Arrange & Act
      final account = AccountModel(
        id: '1',
        fullName: 'John   Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.50,
      );

      // Assert
      expect(account.initials, 'JD');
    });
  });
}
