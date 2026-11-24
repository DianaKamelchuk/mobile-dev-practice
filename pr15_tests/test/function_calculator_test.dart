import 'package:flutter_test/flutter_test.dart';
import 'package:pr15_tests/function_calculator.dart';

void main() {
  group('FunctionCalculator: y = x^3 - x^2 - x', () {
    final calculator = FunctionCalculator();

    test('x = 0 gives 0', () {
      expect(calculator.calc(0), 0);
    });

    test('x = 1 gives -1', () {
      expect(calculator.calc(1), -1);
    });

    test('x = 2 gives 2', () {
      expect(calculator.calc(2), 2);
    });

    test('x = 3 gives 15', () {
      expect(calculator.calc(3), 15);
    });

    test('x = -1 gives -1', () {
      expect(calculator.calc(-1), -1);
    });

    test('x = -2 gives -10', () {
      expect(calculator.calc(-2), -10);
    });

    test('x = 0.5 gives -0.625', () {
      expect(calculator.calc(0.5), closeTo(-0.625, 1e-9));
    });
  });
}