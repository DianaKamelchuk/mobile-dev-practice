class Tabulator {
  // крок табулювання вказується в конструкторі
  final double step;

  // діапазон за замовчуванням [-5, 5]
  double _from = -5;
  double _to = 5;

  Tabulator(this.step) {
    if (step <= 0) {
      throw ArgumentError('Крок має бути більшим за 0');
    }
  }

  // зміна діапазону табулювання ("з" та "по" включно)
  void setRange(double from, double to) {
    if (from > to) {
      throw ArgumentError('Початок діапазону не може бути більшим за кінець');
    }
    _from = from;
    _to = to;
  }

  // функція y = x^3 - x^2 - x
  double calc(double x) {
    return x * x * x - x * x - x;
  }

  // табулювання із виводом мінімуму та максимуму
  void run() {
    print("y = x^3 - x^2 - x");
    print("діапазон: [$_from, $_to], крок: $step\n");

    // кількість кроків рахуємо наперед, щоб уникнути накопичення похибки double
    final count = ((_to - _from) / step + 1e-9).floor();

    double? minY;
    double? maxY;

    for (var i = 0; i <= count; i++) {
      final x = _from + i * step;
      final y = calc(x);
      print("x = $x, y = $y");

      if (minY == null || y < minY) minY = y;
      if (maxY == null || y > maxY) maxY = y;
    }

    print("\nmin = $minY");
    print("max = $maxY");
  }
}

void main() {
  // діапазон за замовчуванням [-5, 5]
  final tabulator = Tabulator(0.5);
  tabulator.run();

  print("\n--------------------\n");

  // змінюємо діапазон методом setRange
  tabulator.setRange(-2, 2);
  tabulator.run();
}