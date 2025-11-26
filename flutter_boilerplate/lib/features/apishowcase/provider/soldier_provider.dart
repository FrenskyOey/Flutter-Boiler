import 'package:flutter_boilerplate/features/apishowcase/data/data_sources/remote/soldier_remote_ds.dart';
import 'package:flutter_boilerplate/features/apishowcase/data/data_sources/soldier_data_source.dart';
import 'package:flutter_boilerplate/features/apishowcase/data/repositories/soldier_repo.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/repositories/soldier_repository.dart';
import 'package:flutter_boilerplate/features/shared/provider/global_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soldier_provider.g.dart';

@Riverpod(keepAlive: true)
SoldierRemoteDataSource soldierRemoteDataSource(Ref ref) {
  final dio = ref.read(dioClientProvider);
  return SoldierRemoteDataSourceImpl(dio: dio);
}

@Riverpod(keepAlive: true)
SoldierRepository soldierRepository(Ref ref) {
  final remoteRepo = ref.read(soldierRemoteDataSourceProvider);
  return SoldieRepositoryImp(remoteDataSource: remoteRepo);
}
