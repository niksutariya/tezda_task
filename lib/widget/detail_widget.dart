import 'package:flutter/material.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_text.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key, required this.title, required this.name});

  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: title,
          fontWeight: FontWeight.w500,
          fontSize: SizeUtils.fSize_14(),
          color: Colors.black.withOpacity(0.8),
          lineHeight: 2.0,
        ),
        Container(
          height: SizeUtils.verticalBlockSize * 6,
          width: SizeUtils.horizontalBlockSize * 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10)
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              title: name,
              fontSize: SizeUtils.fSize_14(),
              color: Colors.black,
              lineHeight: 2.0,
            ),
          ),
        ),
        SizedBox(
          height: SizeUtils.verticalBlockSize * 3,
        ),
      ],
    );
  }
}
