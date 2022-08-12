import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:providerr/response/response.dart';

import '../../models/product.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key, required this.title,required this.res,}) : super(key: key);
  final String title;
  final ResponseJsonApi res;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body:FutureBuilder<List<Product>>(
        future: res.getCategoryDetail(title),
        builder: (context,AsyncSnapshot<List<Product>> snapshot){
        if (snapshot.hasData) {
          inspect(snapshot.data);
          return  ListView.builder(
            itemCount:snapshot.data!.length ,
            itemBuilder: (context , index){
            return ListTile(
              title: Text(snapshot.data?[index].title??""),
             subtitle: Text("${snapshot.data![index].price.toString()} USD"),
              leading: Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage(snapshot.data?[index].thumbnail??""),
                          
                        ),

                      ),
                 
            ));

          });
          
        } 
        return const Center(child:  CircularProgressIndicator(),);
      })
    );
  
  }
}