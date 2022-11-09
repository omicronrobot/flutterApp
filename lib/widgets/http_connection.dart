import 'dart:convert';
import 'dart:io';

Future<void> sendHTTPData(
    String httpURL, String auth, double degrees, double distance) async {
  var url = Uri.parse(httpURL);
  var body = jsonEncode([
    {"bn": "mobile", "n": "pitch", "u": "m/s", "v": distance},
    {"n": "yaw", "u": "rad", "v": degrees}
  ]);

  final httpClient = HttpClient();

  final request = await httpClient.postUrl(url);
  request.headers.set('Authorization', auth);
  request.headers.contentType = ContentType("application", "json");
  request.add(utf8.encode(body));

  final response = await request.close();
  if (response.statusCode != 202) {
    throw Exception('http.post error: statusCode= ${response.statusCode}');
  }
}
