import 'package:flutter_boilerplate/features/apishowcase/data/models/soldier_response.dart';

abstract class SoldierRemoteDataSource {
  Future<List<SoldierResponse>> getSoldier(int page);
}
