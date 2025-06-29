import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/product_response.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  final Dio _dio = Dio(BaseOptions(baseUrl: AppConstants().BASE_URL));
  var products = <ProductResponse>[].obs;

  Future<void> fetchProducts() async {
    try{
      final response = await _dio.get('/products');

      if(response.statusCode==200 && response.data is List){
        products.value = parseProductList(response.data);
      }else{
        Get.snackbar("Error", "Invalid Response Format!");
      }
    }catch(e){
      Get.snackbar("Error", "$e");
    }
  }
}