import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:neobis_week_five_projekt/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.errorOne).existsSync(), isTrue);
  });
}
