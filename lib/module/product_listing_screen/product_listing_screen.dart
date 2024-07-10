import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/controller/product_controller.dart';
import 'package:tezda_task/module/product_listing_screen/product_detail_screen.dart';
import 'package:tezda_task/utils/app_route.dart';
import 'package:tezda_task/widget/product_item_display.dart';

class ProductListingScreen extends StatelessWidget {
  ProductListingScreen({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.toNamed(Routes.profileScreen);

          },
          child: const Icon(Icons.person),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.favoriteItemScreen);
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                    itemCount: productController.productItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.69),
                    itemBuilder: (context, index) {
                      return ProductItemsDisplay(
                        product: productController.productItems[index],
                        onTap: () {
                          Get.to(
                            ProductDetailScreen(
                              product: productController.productItems[index],
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
