import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/features/apishowcase/data/data_sources/soldier_data_source.dart';
import 'package:flutter_boilerplate/features/apishowcase/data/models/soldier_response.dart';

class SoldierRemoteDataSourceImpl implements SoldierRemoteDataSource {
  final Dio dio;

  SoldierRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<SoldierResponse>> getSoldier(int page) async {
     try {
      final response = await dio.get('/api/people');
      // 2. Safely check if the response data is a List
      final List<dynamic> rawList = response.data;
      // 3. Map each item in the list to a SoldierResponse object
      final List<SoldierResponse> soldiers = rawList
          .cast<Map<String, dynamic>>() // Cast each item to Map<String, dynamic>
          .map(SoldierResponse.fromJson)  // Use the generated fromJson factory
          .toList();
      return soldiers;
     }catch (e) {
      rethrow;
    }
  }
}
