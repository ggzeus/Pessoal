import 'package:controle_pessoal/core/constants/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app identity is configured', () {
    expect(AppConstants.appName, 'Controle Pessoal');
  });
}
