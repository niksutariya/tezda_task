import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/controller/product_controller.dart';
import 'package:tezda_task/model/item_model.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_text.dart';

class ProductItemsDisplay extends StatelessWidget {
  final Product product;
  final Function() onTap;

  ProductItemsDisplay({
    super.key,
    required this.product,
    required this.onTap,
  });

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeUtils.verticalBlockSize * 16.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        product.image,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 2,
                ),
                CustomText(
                  title: product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: Row(
                        children: [
                          CustomText(
                            title: product.rating.rate.toString(),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeUtils.fSize_14(),
                            color: Colors.white,
                          ),
                          SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      title: product.category.name.toLowerCase(),
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_10(),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 1,
                ),
                Row(
                  children: [
                    CustomText(
                      title: "\$${product.price}",
                      fontSize: SizeUtils.fSize_15(),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
