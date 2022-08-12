import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:providerr/models/product.dart';

class ResponseJsonApi with ChangeNotifier{
 final  String _url = "https://dummyjson.com/products";
 final String _searchUrl= "https://dummyjson.com/products/search?q=";
 final String _categories = "https://dummyjson.com/products/categories/";


  late Dio _dio;
  String? query;
ResponseJsonApi(){
  _dio = Dio();
  
  getCategories();
  
}

Future<List<Product>> getDataJson() async{  
   Response response = await _dio.get(_url);

   DataRes newResponse= DataRes.fromJson(response.data);
    notifyListeners();
       
   return newResponse.products!;
  
   /*
  try {
 


  }on DioError catch (e) {
    print(e);
    
  }*/
}
List<Product>? searchProductList;
 Future getSearch() async{
  if (query!=null) {
      Response response1 = await _dio.get(_searchUrl+query!);
      inspect(response1);
   DataRes newResponse1= DataRes.fromJson(response1.data);

        notifyListeners();

    searchProductList= newResponse1.products!;

  }

   


 }

List? categories;
 Future getCategories() async{
  try{
Response response1 = await _dio.get(_categories);
      

        

    categories= response1.data!;
    notifyListeners();
    
  }catch(err){
    print(err.toString());
  }

      

  }


 Future<List<Product>> getCategoryDetail(String categoryName) async{
 
  Response response = await _dio.get(_categories+categoryName);
  inspect(response);
  DataRes newResponse= DataRes.fromJson(response.data);
    notifyListeners();
       
   return newResponse.products!;
 }


 }


