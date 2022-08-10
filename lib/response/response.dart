import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:providerr/models/product.dart';

class ResponseJsonApi{
  String _url = "https://dummyjson.com/products";

  late Dio _dio;

ResponseJsonApi(){
  _dio = Dio();
}

Future<List<Product>> getDataJson() async{   Response response = await _dio.get(_url);

inspect(response.data);
   DataRes newResponse= DataRes.fromJson(response.data);
   print(response.statusCode);
  inspect(newResponse.products);
   return newResponse.products!;
   /*
  try {
 


  }on DioError catch (e) {
    print(e);
    
  }*/
}

}
