import 'dart:convert';

import 'package:neversitup_test_flutter/models/department/department_list_result.dart';
import 'package:neversitup_test_flutter/models/department/department_product_list_result.dart';
import 'package:neversitup_test_flutter/models/http_error.dart';
import 'package:neversitup_test_flutter/repositories/department/department_provider.dart';
import 'package:neversitup_test_flutter/repositories/http/http_error_mockup.dart';

class DepartmentRepositories {
  DepartmentProvider departmentProvider = DepartmentProvider();

  Future<dynamic> getDepartment() async {
    try {
      dynamic res = await departmentProvider.getDepartment();
      List<DepartmentModel> departmentList = [];
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        departmentList = data.map((json) => DepartmentModel.fromJson(json)).toList();
        return departmentList;
      } else {
        return HttpErrorModel.fromJson(HttpErrrorMockup.msg);
      }
    } catch (e) {
      return HttpErrorModel(
        code: 404,
        message: e.toString(),
      );
    }
  }

  Future<dynamic> getProductList({required String id}) async {
    try {
      dynamic res = await departmentProvider.getProductListById(id: id);
      List<ProductDepartmentListModel> productList = [];
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        productList = data.map((json) => ProductDepartmentListModel.fromJson(json)).toList();
        return productList;
      } else {
        return HttpErrorModel.fromJson(HttpErrrorMockup.msg);
      }
    } catch (e) {
      print("object $e");
      return HttpErrorModel(
        code: 404,
        message: e.toString(),
      );
    }
  }
}
