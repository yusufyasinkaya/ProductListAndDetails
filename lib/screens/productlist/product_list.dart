import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:providerr/models/product.dart';
import 'package:providerr/response/response.dart';
import 'package:providerr/screens/productview/product_view.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  
  
  String data= "Allhere";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data,style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
        child: Column(children: [
          TextField(
            style: TextStyle(color:Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          
            ),
            hintText: "Search Something e.g. Iphone",
            prefixIcon: Icon(Icons.search_sharp,color: Colors.black,) ,

          ),
          ),
          SizedBox(height: 20,),
          Expanded(child: FutureBuilder<List<Product>>(
            future: ResponseJsonApi().getDataJson(),
            builder: (context,snapshot){
             if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(snapshot.data![index].title??""),
                      subtitle: Text(snapshot.data![index].price.toString()+" USD"),
                      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>   ProductDetail(
                      title: snapshot.data![index].title??"",
                      description: snapshot.data![index].description??"",
                      images: snapshot.data![index].images!,
                      rating: snapshot.data![index].rating!,
                      price: snapshot.data![index].price!,
                      brand: snapshot.data![index].brand??"",
                      category: snapshot.data![index].category??"",
                      discountPercentage: snapshot.data![index].discountPercentage!,

                    ),
                        )),
                      leading: Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage(snapshot.data![index].thumbnail??""))
                        ),

                      ),
                    );

                  },
                );
              } else{
               return Center(child: CircularProgressIndicator(),);

              }
            },
          )
          )
        ]),
        ),
      ),
    
    );
    
  }
}