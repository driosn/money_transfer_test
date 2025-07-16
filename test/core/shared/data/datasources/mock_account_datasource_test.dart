import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/shared/data/datasources/mock_account_datasource.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';

void main() {
  group('MockAccountDataSource', () {
    late MockAccountDataSource dataSource;

    setUp(() {
      dataSource = MockAccountDataSource();
    });

    test('should return list of accounts', () async {
      // Act
      final accounts = await dataSource.getAccounts();

      // Assert
      expect(accounts, isA<List<AccountModel>>());
      expect(accounts.isNotEmpty, true);
    });

    test('should return accounts with valid data', () async {
      // Act
      final accounts = await dataSource.getAccounts();

      // Assert
      for (final account in accounts) {
        expect(account.id, isNotEmpty);
        expect(account.fullName, isNotEmpty);
        expect(account.avatarUrl, isNotEmpty);
        expect(account.balance, isA<double>());
        expect(account.balance, greaterThanOrEqualTo(0));
      }
    });

    test('should return accounts with unique IDs', () async {
      // Act
      final accounts = await dataSource.getAccounts();

      // Assert
      final ids = accounts.map((account) => account.id).toSet();
      expect(ids.length, equals(accounts.length));
    });

    test('should return accounts with valid avatar URLs', () async {
      // Act
      final accounts = await dataSource.getAccounts();

      // Assert
      for (final account in accounts) {
        expect(account.avatarUrl, startsWith('http'));
      }
    });
  });
}
