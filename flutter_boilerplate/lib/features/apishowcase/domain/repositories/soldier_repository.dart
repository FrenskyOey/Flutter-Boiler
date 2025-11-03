import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';

abstract class SoldierRepository {
  Future<Either<String, List<Soldier>>> getSoldier(int page, int currentSize);
}
