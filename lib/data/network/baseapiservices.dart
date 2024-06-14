abstract class BaseApiAServices {
  Future<dynamic> getGetApiResponse(String url, Map<String, String> headers);
  Future<dynamic> getPostApiResponse(
    String url,
    Map<String, dynamic> data,
  );
  Future<dynamic> getPostForgetApiResponse(
    String url,
    dynamic data,
  );
}
