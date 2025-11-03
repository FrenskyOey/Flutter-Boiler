import 'package:flutter_boilerplate/features/apishowcase/data/data_sources/remote/soldier_remote_ds.dart';
import 'package:flutter_boilerplate/features/apishowcase/data/data_sources/soldier_data_source.dart';
import 'package:flutter_boilerplate/features/apishowcase/data/repositories/soldier_repo.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/repositories/soldier_repository.dart';
import 'package:flutter_boilerplate/features/shared/provider/global_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soldier_provider.g.dart';

//  Soldier Depedency
@riverpod
Future<SoldierRemoteDataSource> soldierRemoteDataSource(Ref ref) async {
  final dio = await ref.watch(dioProvider.future);
  return SoldierRemoteDataSourceImpl(dio: dio);
}

@riverpod
Future<SoldierRepository> soldierRepository(Ref ref) async {
  final remoteRepo = await ref.read(soldierRemoteDataSourceProvider.future);
  return SoldieRepositoryImp(remoteDataSource: remoteRepo);
}
