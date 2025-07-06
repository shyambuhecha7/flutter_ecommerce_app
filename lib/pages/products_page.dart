import 'package:ecommerce_app/controllers/products_controller.dart';
import 'package:ecommerce_app/models/product_response.dart';
import 'package:ecommerce_app/pages/product_details.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    productController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          productController.products.isEmpty
              ? Center(child: Text("Empty"))
              : Container(
                decoration: BoxDecoration(color: Colors.white),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),

                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 16,
                  children: List.generate(productController.products.length, (
                    index,
                  ) {
                    final ProductResponse product =
                        productController.products[index];

                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => ProductDetailsPage(),
                          arguments: product,
                          transition: Transition.zoom,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      loadingBuilder: (
                                          context,
                                          child,
                                          loadingProgress,
                                          ) {
                                        if (loadingProgress == null) return child;

                                        return SizedBox(
                                          height: 120,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                              value:
                                              loadingProgress
                                                  .expectedTotalBytes !=
                                                  null
                                                  ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                      .expectedTotalBytes ??
                                                      1)
                                                  : null,
                                            ),
                                          ),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Text("Image Not Found");
                                      },
                                      product.images.first,
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    product.title.toString(),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    "\$${product.price}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Align(alignment: Alignment.topRight,
                              child: IconButton(onPressed: () {
                                setState(() {
                                  product.isFav = !product.isFav!;
                                });
                              },
                                  iconSize: 18,
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          AppColors.grey)),
                                  padding: EdgeInsets.all(4),
                                  constraints: BoxConstraints(),
                                  icon: Icon( product?.isFav ?? false ? Icons.favorite : Icons.favorite_border,
                                      color:  product?.isFav ?? false ? Colors.red : Colors.grey)))
                        ],
                      ),
                    );
                  }),
                ),
              ),
    );
  }
}
