class FormResponse {
  String message;
  bool isSuccess;
  FormResponse({
    required this.message,
    required this.isSuccess,
  });
  factory FormResponse.fromJson(Map<String, dynamic> parsedResponse) {
    return FormResponse(
        message: parsedResponse['message'],
        isSuccess: parsedResponse['success']);
  }
}
