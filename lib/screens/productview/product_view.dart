import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:providerr/models/product.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String description;
  final List<String> images;
  final double rating;
  final int price;
  final String brand;
  final String category;
  final double discountPercentage;

const ProductDetail(
      {
        required this.discountPercentage,
        required this.category,
        required this.price,
         required this.brand,
        required this.rating,
        required this.images,
      required this.title,
      required this.description,});


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(color: Colors.black),)),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.width*1,
                child: CarouselSlider(items: images.map((e)=>ClipRRect(
                 borderRadius: BorderRadius.circular(8),
                 child: Stack(
                   children: [
                    FittedBox(child: Image.network(e,
                     height: MediaQuery.of(context).size.height*0.3,
                     fit: BoxFit.cover,))
                     
                   ],
                 ),
                )).toList()
                , options: CarouselOptions(
                 enlargeCenterPage: true,
                 enableInfiniteScroll: false,
                 autoPlay: true,
                  
                )),
              ),
            ),
             Text(brand,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
             
              Text("$price USD",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
               Text("Rating: $rating/5",style:TextStyle(color: Color.fromARGB(255, 255, 181, 9),fontWeight: FontWeight.bold),),
               Text(description,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
               Text("Category: $category",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),),
               Text("%$discountPercentage percent off!",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.red),)
              
          ],
        ),
      );
    
  }
}