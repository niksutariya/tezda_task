import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/controller/product_controller.dart';
import 'package:tezda_task/model/item_model.dart';
import 'package:tezda_task/utils/app_strings.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_text.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({super.key, required this.product});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Hero(
                    tag: product.image,
                    child: Image.network(
                      product.image,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    title: product.title.toString(),
                                    maxLines: 1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeUtils.fSize_25(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: SizeUtils.fSize_18(),
                                ),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 0.6,
                                ),
                                CustomText(
                                  title: product.rating.rate.toString(),
                                ),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 10,
                                ),
                                CustomText(
                                  title:
                                      "${AppString.inStock} \$${product.rating.count.toString()}",
                                  maxLines: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: SizeUtils.fSize_15(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeUtils.verticalBlockSize * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  title: AppString.price,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeUtils.fSize_18(),
                                  color: Colors.black45,
                                ),
                                CustomText(
                                  title: AppString.category,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeUtils.fSize_18(),
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  title: "\$${product.price.toString()}",
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeUtils.fSize_18(),
                                ),
                                CustomText(
                                  title: product.category.name,
                                  maxLines: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeUtils.fSize_18(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeUtils.verticalBlockSize * 2,
                            ),
                            CustomText(
                              title: "${product.description}...",
                              fontSize: SizeUtils.fSize_15(),
                            ),
                            SizedBox(
                              height: SizeUtils.verticalBlockSize * 2,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[200],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[200],
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: CustomText(
                                        title: AppString.bookNow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeUtils.fSize_18(),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () {
                          log("message:- ${productController.favoriteItemList.length}");
                          return InkWell(
                            onTap: () {
                              productController.favoriteOnTapFunction(product);
                            },
                            child: Icon(
                              product.isChecked?.value == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: product.isChecked?.value == true
                                  ? Colors.red
                                  : null,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
