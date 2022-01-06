import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../AppException.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiService {



  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url),
      headers:{"Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2E1Mjg5ZThmMzNlM2M5NTcwNjk2NWY5MzVmYTM0MTczOWVhODdmZTc4NGFiOGZjOWExMjM1ZjUyYjBhMWFlNDc3MDU2NjI4MGQ5ZDk0YjYiLCJpYXQiOiIxNjI4NzYzMzM1LjIwMDQxOCIsIm5iZiI6IjE2Mjg3NjMzMzUuMjAwNDI0IiwiZXhwIjoiMTY2MDI5OTMzNS4xODY4MDMiLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XWRozS6dUaJ4jwRV3kQ745YB5Ez5jH0wHh2OUG1uxIvsvBJeFcBHYBKmkCbtyIftQx4Mn0sTlC3lrsN6h-8Z8MhhGCCI2qESv53VU09RhNhu7wZNmv1d-ZX7RX2HuyQhc0RmDBmlN9m-VxSobq9E_GtDYQ7a1VpHM3_YIY0EchvJEeod1TtXuqxwPpIPOub1a1vs3ai1NM2qjLxnSq6S0vmpswOM2EN9OpOTre2sUjZOTGSHvWF1WlhMMzPHOAp33m6u7fG9Sr5v8B0POFSfxw5CCgTZW2DlJgwqcKajk6NzRFomzLejuvMP6OdVesrNvaYEIhJKgpsMWAllSnt9iMYBULveOnR8SEzuUEKfEwmMkv9zO2hXDW7WEeIWvXPojCrevHOcbO28D9_pBy85V6tWfmNSfXfXjcspv4VPG52d2_LEiELhiEvBon_TQog8OvkoxXErGbok3OrWIHHO2cVPjVfv8UNmeBJVVHqXTidNRBvIisM1sBhim0049uoJM2l44lg_GKcV5DFjUP5kCQQU-XgqtHHmuNIfXBvtI8F2IWGWECQZptyrWqT6lqghixjhA_PS3HIClUFyvOAhAWm1nBHYL0M9KjQ4bwYPC_mQoD-D9Wt9IdQ8HKLWkszT4qF-h0SM91ylXO-dP1LeOM5F5LI1UD21FAKq_sfGWpk"},);
      print("--"+response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}