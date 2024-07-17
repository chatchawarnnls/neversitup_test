import 'package:http/http.dart' as http;
import 'package:neversitup_test_flutter/utilities/configs/appconfigs.dart';

class DepartmentProvider {
  Future<dynamic> getDepartment() async {
    final Uri uri = Uri.parse("${Appconfigs.apiurlEndpoint}/api/v1/departments");
    dynamic res = await http.get(uri);
    return res;
  }

  Future<dynamic> getProductListById({required String id}) async {
    final Uri uri = Uri.parse("${Appconfigs.apiurlEndpoint}/api/v1/departments/$id/products");
    dynamic res = await http.get(uri);
    return res;
  }
}
