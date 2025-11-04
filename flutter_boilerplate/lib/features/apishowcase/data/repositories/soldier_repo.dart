import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/handlers/error/error_handler.dart';
import 'package:flutter_boilerplate/features/apishowcase/data/data_sources/soldier_data_source.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/repositories/soldier_repository.dart';

class SoldieRepositoryImp implements SoldierRepository {
  final SoldierRemoteDataSource remoteDataSource;

  SoldieRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<String, List<Soldier>>> getSoldier(
    int page,
    int currentSize,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final responseSoldier = await remoteDataSource.getSoldier(page);
      int avatarIndexes = currentSize;
      final List<Soldier> result = [];
      for (final datas in responseSoldier) {
        /*final entity = datas.toDomain().copyWith(
          avatar: "https://randomuser.me/api/portraits/men/$avatarIndexes.jpg",
        );*/
        final entity = datas.toDomain();
        avatarIndexes = avatarIndexes + 1;
        result.add(entity);
      }
      return Right(result);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
