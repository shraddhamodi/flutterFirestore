abstract class BaseApiService {

  final String baseUrl = "http://go-green.thewebpatriot.com/api/v1/";

  Future<dynamic> getResponse(String url);

}