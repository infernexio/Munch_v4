import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:munch_v4/res/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders={
      'Content-type' : 'applications/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri,) async{
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}