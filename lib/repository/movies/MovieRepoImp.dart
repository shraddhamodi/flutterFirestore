import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';
import '../../models/dataList/MoviesMain.dart';
import 'MovieRepo.dart';

class MovieRepoImp implements MovieRepo{

  BaseApiService _apiService = NetworkApiService();

  @override
  Future<MoviesMain?> getMoviesList() async {
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints().getMovies);
      print("MovieRepoImp Shraddha: $response");
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
      print("Shraddha-E $e}");
    }
  }

}