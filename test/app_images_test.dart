import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:neobis_week_five_projekt/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.chartOne).existsSync(), isTrue);
    expect(File(AppImages.chartTwo).existsSync(), isTrue);
    expect(File(AppImages.errorOne).existsSync(), isTrue);
    expect(File(AppImages.errorTwo).existsSync(), isTrue);
    expect(File(AppImages.filterSort).existsSync(), isTrue);
    expect(File(AppImages.filterSortDisable).existsSync(), isTrue);
    expect(File(AppImages.gridIcon).existsSync(), isTrue);
    expect(File(AppImages.listIcon).existsSync(), isTrue);
  });
}
