class HttpErrorModel {
  int? code;
  String? message;

  HttpErrorModel({
    this.code,
    this.message,
  });

  HttpErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code'] = code;
    data['Message'] = message;
    return data;
  }
}
