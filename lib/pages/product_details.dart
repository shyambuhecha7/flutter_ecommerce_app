import 'package:ecommerce_app/models/product_response.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductResponse productResponse = Get.arguments as ProductResponse;

  var selectedIndex = 0;
  var productCount = 1;

  final List<Color> bagColors = [
    Colors.red,
    Colors.blue,
    Colors.deepOrange,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: Text('Product Details'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined, size: 24),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("\$35.54", style: AppTextStyle.titleTextStyle),
            ElevatedButton.icon(
              onPressed: () {},
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.indigo)),
              label: Text('Add To Cart' ,style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                color: AppColors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/bag.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Box Bag Liner 1883',
                                    style: AppTextStyle.titleTextStyle,
                                    textAlign: TextAlign.start,
                                  ),

                                  //Ratting
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 24,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '4.8',
                                        style:
                                            AppTextStyle.titleMediumTextStyle,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '(320 Reviews)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 8,
                                      children: [
                                        IconButton(
                                          constraints: BoxConstraints(),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                  Colors.white,
                                                ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              productCount++;
                                            });
                                          },
                                          icon: Icon(Icons.add, size: 16),
                                        ),
                                        Text(
                                          productCount.toString(),
                                          style:
                                              AppTextStyle.titleMediumTextStyle,
                                        ),
                                        IconButton(
                                          constraints: BoxConstraints(),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                  Colors.white,
                                                ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if(productCount != 1){
                                                productCount--;
                                              }else{
                                                Get.snackbar("Warning", "Select minimum one item.");
                                              }
                                            });
                                          },
                                          icon: Icon(Icons.remove, size: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Available in Stocks',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 8),

                        Text('Color', style: AppTextStyle.titleMediumTextStyle),

                        SizedBox(height: 4),

                        //color selector
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(bagColors.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: bagColors[index],
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    selectedIndex == index
                                        ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                        : null,
                              ),
                            );
                          }),
                        ),

                        SizedBox(height: 12),

                        Text(
                          'Description',
                          style: AppTextStyle.titleMediumTextStyle,
                        ),

                        Text(
                          '''Elevate your storage style with this premium, durable bag liner.Crafted with precision for a perfect fit and long-lasting use. Available in multiple vibrant colors to match your mood. Ideal for daily use, travel, or gifting – practical meets elegant., durable bag liner.Crafted with precision for a perfect fit and long-lasting use. Available in multiple vibrant colors to match your mood. Ideal for daily use, travel, or gifting – practical meets elegant.''',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),

                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
