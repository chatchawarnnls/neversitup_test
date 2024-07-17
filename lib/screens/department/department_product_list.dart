import 'package:flutter/material.dart';
import 'package:neversitup_test_flutter/models/department/department_product_list_result.dart';

class DepartmentProductListScreen extends StatelessWidget {
  final ProductDepartmentListModel dataProduct;
  const DepartmentProductListScreen({super.key, required this.dataProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
        border: Border.all(
          width: 1,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          return Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  dataProduct.imageUrl ?? "",
                  fit: BoxFit.cover,
                  height: height / 2,
                  width: double.infinity,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name: ${dataProduct.name ?? ""}"),
                          Text(
                            "Desc: ${dataProduct.desc ?? ""}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          dataProduct.price ?? "",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
