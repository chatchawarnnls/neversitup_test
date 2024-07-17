import 'package:flutter_easyloading/flutter_easyloading.dart';

class CoreServiceLoading {
  Future show({
    String? text,
  }) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..userInteractions = false
      ..dismissOnTap = false;

    if (EasyLoading.isShow != true) {
      return EasyLoading.show(
        status: text,
      );
    }
    return Future.delayed(const Duration(milliseconds: 0));
  }

  Future hide() {
    if (EasyLoading.isShow) {
      return EasyLoading.dismiss();
    }
    return Future.delayed(const Duration(milliseconds: 0));
  }
}
