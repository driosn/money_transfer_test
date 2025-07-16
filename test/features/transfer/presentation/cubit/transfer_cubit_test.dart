import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/features/transfer/domain/repositories/transfer_repository.dart';
import 'package:meru_test/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockTransferRepository extends Mock implements TransferRepository {}

void main() {
  group('TransferCubit', () {
    late TransferCubit cubit;
    late MockTransferRepository mockRepository;

    setUp(() {
      mockRepository = MockTransferRepository();
      cubit = TransferCubit(transferRepository: mockRepository);
    });

    test('initial state should be initial', () {
      expect(cubit.state, const TransferState.initial());
    });
  });
}
