import 'dart:developer';

import 'package:get/get.dart';
import 'package:tezda_task/model/item_model.dart';
import 'package:tezda_task/service/product_service.dart';

class ProductController extends GetxController {
  RxList<Product> productItems = <Product>[].obs;
  RxList<Product> favoriteItemList = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductServices.fetchProducts();

      if (products != null) {
        productItems.addAll(products);
        log('products :- ${productItems.length}');
      }
      update();
    } finally {
      isLoading(false);
    }
  }

  void favoriteOnTapFunction(Product product){
    if (!(product.isChecked?.value ?? false)) {
      product.isChecked?.value = true;
      favoriteItemList.add(product);
    } else {
      product.isChecked?.value = false;
      favoriteItemList
          .remove(product);
    }
    update();
  }
}
