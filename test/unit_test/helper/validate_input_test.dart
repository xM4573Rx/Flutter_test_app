import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/design/copys.dart';
import 'package:test_app/pages/helper/validate_input.dart';

void main() {
  group('Testing Validate Input', () {
    test('invalid user null', () {
      // Arrange
      String? inputValue;
      const expectedError = TestErrors.userError;

      // Act
      final currentValue = validateInput(inputValue);

      // Assert
      expect(currentValue, expectedError);
    });

    test('valid user', () {
      // Arrange
      const inputValue = 'Jorge';
      String? expectedError;

      // Act
      final currentValue = validateInput(inputValue);

      // Assert
      expect(currentValue, expectedError);
    });
  });
}
