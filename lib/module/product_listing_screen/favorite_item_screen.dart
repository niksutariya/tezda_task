import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/controller/product_controller.dart';
import 'package:tezda_task/utils/app_strings.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_text.dart';

import 'product_detail_screen.dart';

class FavoriteItemScreen extends StatelessWidget {
  FavoriteItemScreen({super.key});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(title: AppString.favoriteProductList),
        elevation: 0,
      ),
      body: Obx(
        () {
          return productController.favoriteItemList.isEmpty
              ? Center(
                  child: CustomText(
                    title: AppString.emptyProductMessage,
                    color: Colors.red,
                    fontSize: SizeUtils.fSize_20(),
                    fontWeight: FontWeight.w700,
                  ),
                )
              : ListView.builder(
                  itemCount: productController.favoriteItemList.length,
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var product = productController.favoriteItemList[index];
                    return InkWell(
                      onTap: () async {
                        await Get.to(
                          ProductDetailScreen(
                            product: product,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              height: SizeUtils.verticalBlockSize * 10,
                              width: SizeUtils.horizontalBlockSize * 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    product.image,
                                  ).image,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 3,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 65,
                                  child: CustomText(
                                    title: product.title,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontSize: SizeUtils.fSize_14(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeUtils.verticalBlockSize * 0.5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 65,
                                      child: CustomText(
                                        title: product.description,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.grey.withOpacity(0.8),
                                        fontSize: SizeUtils.fSize_10(),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeUtils.verticalBlockSize * 0.3,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      title: product.price.toString(),
                                      color: Colors.green,
                                      fontSize: SizeUtils.fSize_16(),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 1,
                                    ),
                                    CustomText(
                                      title: AppString.fixed,
                                      color: Colors.grey,
                                      fontSize: SizeUtils.fSize_10(),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
