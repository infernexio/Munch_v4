import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_v4/data/api/api_client.dart';
import 'package:munch_v4/res/app_constants.dart';

import '../../res/app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.popularUrl);
  }
}