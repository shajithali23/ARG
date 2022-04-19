import 'package:report_generator/models/excel_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjEwODAwLCJzdWIiOiJzaGFqaXRoQGdtYWlsLmNvbSIsImlhdCI6MTY0OTU1NTU1Mn0.FVGL9Pz5ECSxz2O9jsXDoJPBfk0Wq7tsGi6qvPawqZA";

  Future<JsonToExcel?> getData() async {
    var client = http.Client();
    var uri = Uri.parse(
        "https://hihdw5fsnk.execute-api.ap-southeast-1.amazonaws.com/dev/viewtaskbyuserid?userId=1001&date=04%2F12%2F2022");
    try {
      var response = await client.get(uri, headers: {
        "Authorization": "Bearer $token",
      });
      print("DDDD");
      print(response.statusCode);

      if (response.statusCode == 200) {
        var json = response.body;

        print("DFD");
        // print(json[0]["data"]);
        var d = jsonToExcelFromMap(json);
        print("{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}");
        print(d);
        return jsonToExcelFromMap(json);
      }
    } catch (e) {
      print("object");
      print(e.toString());
    }
  }
}
