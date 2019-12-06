import 'package:flutter_test/flutter_test.dart';
import 'package:miaudota_app/utils/date.dart';

void main() {
  test('Fomatação da data', () {
    final dateformatter = DateFormatter();
    final DateTime data = DateTime.now();
    expect(
        dateformatter.simpleFormat(data),
        data.day.toString() +
            '/' +
            data.month.toString() +
            '/' +
            data.year.toString());
  });
}
