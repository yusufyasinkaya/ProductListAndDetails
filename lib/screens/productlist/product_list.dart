import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:providerr/models/product.dart';
import 'package:providerr/response/response.dart';
import 'package:providerr/screens/categories_detail/categories_detail.dart';
import 'package:providerr/screens/productview/product_view.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);
 /* void providerRun(){
      ChangeNotifierProvider(create: (_)=> ResponseJsonApi(),child: ProductList(),);
  }*/
  

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<DataRes> list=[];
  List<DataRes> search=[];
 
  
  
  
  String data= "AllHere";
  
  final TextEditingController _controller = TextEditingController();
  

  
    

  @override
  Widget build(BuildContext context) {
 final res = Provider.of<ResponseJsonApi>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('lib/assest/appbar.png',
          width: MediaQuery.of(context).size.width*0.40,
       ),
        
      ),
      drawer: Drawer(backgroundColor: Color.fromARGB(255, 255, 255, 255),elevation: 0.1,
      child: Column(
        children: [
          Image.asset("lib/assest/allhereee.png",
          height: MediaQuery.of(context).size.height*0.35,
          ),
          Text("Categories for you",style: TextStyle(color: Color.fromARGB(255, 213, 121, 0),fontWeight: FontWeight.bold,),),
           res.categories==null?Center(child: CircularProgressIndicator(),):
        Expanded(
          
          child: ListView.builder(
              itemCount:res.categories!.length ,
              itemBuilder: (context , index){
              return ListTile(
                title: Text(res.categories![index]),
  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryDetail(title: res.categories?[index], res: res)))
              );}),
        )
      ],)
     
          

      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
        child: Column(children: [
          TextField(
            onChanged: (value)async{
res.query=value;
 await res.getSearch();
 context.read<ResponseJsonApi>().getSearch();
print(res.query);
            },

            controller: _controller,
            style: TextStyle(color:Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          
            ),
            hintText: "Search Something e.g. Iphone",
            prefixIcon: IconButton(icon: Icon(Icons.search_sharp),onPressed:()async{
            await res.getSearch();
           

            } ,) ,

          ),
          ),
          SizedBox(height: 20,),
          Expanded(child:res.searchProductList!=null
          ?


          ListView.builder(
            itemCount:res.searchProductList!.length ,
            itemBuilder: (context , index){
            return ListTile(
              title: Text(res.searchProductList![index].title??""),
             subtitle: Text(res.searchProductList![index].price.toString()+" USD"),
              leading: Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage(res.searchProductList![index].thumbnail??"")),
                          
                        ),

                      ),
                       onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>   ProductDetail(
                      star: res.searchProductList![index].rating!,
                      title: res.searchProductList![index].title??"",
                      description: res.searchProductList![index].description??"",
                      images: res.searchProductList![index].images!,
                      rating: res.searchProductList![index].rating!,
                      price: res.searchProductList![index].price!,
                      brand: res.searchProductList![index].brand??"",
                      category: res.searchProductList![index].category??"",
                      discountPercentage: res.searchProductList![index].discountPercentage!,

                    ),
                        )),
            ) ;

          })
          :

          
           FutureBuilder<List<Product>>(
            future: res.getDataJson(),
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
                      star: snapshot.data![index].rating!,
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