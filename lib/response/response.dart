import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:providerr/models/product.dart';

class ResponseJsonApi{
  String _url = "https://dummyjson.com/products";

  late Dio _dio;

ResponseJsonApi(){
  _dio = Dio();
}

Future<List<Product>> getDataJson(String? query) async{   Response response = await _dio.get(_url);

   DataRes newResponse= DataRes.fromJson(response.data);
  
   if(query!=null){
          newResponse.products = newResponse.products?.where((element)=>element.title!.toLowerCase().contains(query.toLowerCase())).toList();
   }
       
   return newResponse.products!;
   /*
  try {
 


  }on DioError catch (e) {
    print(e);
    
  }*/
}

}
