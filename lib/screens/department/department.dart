import 'package:flutter/material.dart';
import 'package:neversitup_test_flutter/models/department/department_list_result.dart';
import 'package:neversitup_test_flutter/models/department/department_product_list_result.dart';
import 'package:neversitup_test_flutter/repositories/department/department_repositories.dart';
import 'package:neversitup_test_flutter/screens/department/department_carousel.dart';
import 'package:neversitup_test_flutter/screens/department/department_product_list.dart';
import 'package:neversitup_test_flutter/widgets/loading.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  final ScrollController _scrollController = ScrollController();
  String? departmentName;
  String? departmentId;
  DepartmentRepositories departmentRepositories = DepartmentRepositories();
  List<DepartmentModel> departmentList = [];
  List<ProductDepartmentListModel> productDepartmentList = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getDepartmentList();
  }

  void _scrollListener() {
    if (_scrollController.offset <= 0) {
      _scrollController.jumpTo(0);
    } else if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  getDepartmentList() async {
    try {
      dynamic res = await departmentRepositories.getDepartment();
      if (res is List<DepartmentModel>) {
        departmentList = res;
        departmentName = departmentList.first.name;
        departmentId = departmentList.first.id;
        getProductList(id: departmentId, name: departmentName);
      } else {
        /////
      }
      setState(() {});
    } catch (e) {
      ///
    }
  }

  getProductList({
    String? id,
    String? name,
  }) async {
    await CoreServiceLoading().show();

    try {
      dynamic res = await departmentRepositories.getProductList(id: id ?? "");
      if (res is List<ProductDepartmentListModel>) {
        productDepartmentList = res;
        departmentName = name;
        await CoreServiceLoading().hide();
      } else {
        ///
      }
      setState(() {});
    } catch (e) {
      ///
      ///
    }
    await CoreServiceLoading().hide();
  }

  Future<void> productDialog(BuildContext context, ProductDepartmentListModel item) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Product Description',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          content: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                ),
              ),
            ),
            child: Text(
              item.desc ?? "",
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          actionsPadding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Department Carousel",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: departmentList.length, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    DepartmentModel dataDepartment = departmentList[index];
                    return InkWell(
                      onTap: () {
                        getProductList(id: dataDepartment.id, name: dataDepartment.name);
                      },
                      child: DepartmentCarouselScreen(
                        width: 100,
                        height: 100,
                        data: dataDepartment,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Product list : ${departmentName ?? ""}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 4.5,
                  ),
                  itemCount: productDepartmentList.length,
                  itemBuilder: (context, index) {
                    ProductDepartmentListModel dataProduct = productDepartmentList[index];
                    return InkWell(
                      onTap: () {
                        productDialog(
                          context,
                          dataProduct,
                        );
                      },
                      child: DepartmentProductListScreen(dataProduct: dataProduct),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
