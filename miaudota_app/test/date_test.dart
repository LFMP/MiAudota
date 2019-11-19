import 'package:test/test.dart';
import 'package:miaudota_app/utils/date.dart';

void main() {
  test('Fomatação da data', () {
    final dateformatter = DateFormatter();
    final DateTime data = DateTime.now();
    expect(dateformatter.simpleFormat(data),'19/11/2019');
  });
}
