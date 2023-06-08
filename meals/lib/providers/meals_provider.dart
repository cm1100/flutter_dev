import 'package:meals/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvidor = Provider((ref) {
  return dummyMeals;
});
