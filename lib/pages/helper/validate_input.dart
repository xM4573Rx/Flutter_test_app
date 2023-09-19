import 'package:test_app/design/copys.dart';

String? validateInput(value) {
  if (value == null || value.isEmpty) {
    return TestErrors.userError;
  }
  return null;
}
