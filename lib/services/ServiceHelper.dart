import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<T> httpServiceget<T>(String urlname, String apikey, String apikeyvalue,
    Function InitJsonMap, String apiid, String apiidvalue) async {
  T _instance;
  // var url = Uri.https(urlname, apiname, {'q': '{http}'});
  var _url = Uri.parse(urlname);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(_url, headers: {apikey: apikeyvalue});
  dynamic jsonResponse;
  _instance = JsonMapper.deserialize<T>(json.decode("{}".toString()));
  InitJsonMap();
  if (response.statusCode == 200) {
    jsonResponse = convert.jsonDecode(response.body);

    //await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> errmsg = {
      "errormsg": "Success",
      "errorusermsg": "Succesfull Executed.."
    };
    jsonResponse["ErrorDetails"] = errmsg;
    _instance = JsonMapper.deserialize<T>(jsonResponse);
    return _instance;
  } else {
    //dynamic jsonResponse = convert.jsonDecode('') as Map<String, dynamic>;
    //return jsonResponse;
    if (response.statusCode == 400) {
      Map<String, dynamic> errmsg = {
        "errormsg": "Error",
        "errorusermsg": response.reasonPhrase.toString()
      };
      String jsonerr = JsonMapper.serialize(_instance);
      jsonResponse = convert.jsonDecode(jsonerr);
      jsonResponse["ErrorDetails"] = errmsg;
      //_instance = JsonMapper.deserialize<T>(jsonResponse)!;
    } else {
      jsonResponse = convert.jsonDecode(response.body);
      Map<String, dynamic> errmsg = {
        "errormsg": "Error",
        "errorusermsg": response.reasonPhrase.toString()
      };
      jsonResponse["ErrorDetails"] = errmsg;
    }
    _instance = JsonMapper.deserialize<T>(jsonResponse);
    // int i = 10;
    return _instance;
  }
}

Future<T> httpServicepost<T>(String urlname, dynamic bodyobj,
    Function InitJsonMap, String apikey, String apikeyvalue,
    {String apiid = "",
    String apiidvalue = "",
    String Contentttype = "application/json"}) async {
  T _instance;

  //liVE
  //apikeyvalue = apikeyvalue == "3NVF9vgwfmyu6i0vD2zh" ? "Jh98e2GejjuROZM" : apikeyvalue;
  //urlname = apikeyvalue == "" ? urlname : urlname.replaceAll('testapi', 'api');
  //live
  var _url =
      Uri.parse(urlname); //https(urlname, apiname); //'testapi.karza.in',

  dynamic obj = bodyobj;

  InitJsonMap();

  dynamic JsonBody = JsonMapper.toMap(bodyobj);
  //{'pan': "AARPU9290P", 'consent': "Y"};
  Map<String, String> _headers = await apikey == ""
      ? ((apiid == "")
          ? {"Content-type": Contentttype, "Accept": "application/json"}
          : {
              "Content-type": Contentttype,
              "Accept": "application/json",
              apiid: apiidvalue,
              // "3NVF9vgwfmyu6i0vD2zh"
            })
      : ((apiid == "")
          ? {
              "Content-type": Contentttype,
              "Accept": "application/json",
              apikey: apikeyvalue
            }
          : {
              "Content-type": Contentttype,
              "Accept": "application/json",
              apiid: apiidvalue,
              apikey: apikeyvalue,
              // "3NVF9vgwfmyu6i0vD2zh"
            });
  String formBody = "";
  formBody = convert.jsonEncode(JsonBody);
  var response = await http.post(_url,
      headers: _headers, body: formBody); //convert.jsonEncode(JsonBody));
  dynamic jsonResponse;
  _instance = JsonMapper.deserialize<T>(json.decode("{}".toString()));
  if (response.statusCode == 200) {
    jsonResponse = jsonDecode(response.body);
    if (jsonResponse.runtimeType.toString() == "String") {
      jsonResponse = json.decode(jsonResponse.toString());
    }
    Map<String, dynamic> errmsg = {
      "errormsg": "Success",
      "errorusermsg": "Succesfull Executed.."
    };
/*     ErrorDetail ermsg = new ErrorDetail();
    ermsg.errormsg = response.reasonPhrase.toString();
    ermsg.errorusermsg = response.reasonPhrase.toString(); */
/*     String jsonerr = JsonMapper.serialize(_instance);
    jsonResponse = convert.jsonDecode(jsonerr); */
    jsonResponse["ErrorDetails"] = errmsg;
    _instance = JsonMapper.deserialize<T>(jsonResponse);
    // int i = 10;
    return _instance;
  } else {
    if (response.statusCode == 400) {
      Map<String, dynamic> errmsg = {
        "errormsg": "Error",
        "errorusermsg": response.reasonPhrase.toString()
      };
      String jsonerr = JsonMapper.serialize(_instance);
      jsonResponse = convert.jsonDecode(jsonerr);
      jsonResponse["ErrorDetails"] = errmsg;
      //_instance = JsonMapper.deserialize<T>(jsonResponse)!;
    } else {
      jsonResponse = convert.jsonDecode(response.body);
      Map<String, dynamic> errmsg = {
        "errormsg": "Error",
        "errorusermsg": response.reasonPhrase.toString()
      };
      jsonResponse["ErrorDetails"] = errmsg;
    }
    _instance = JsonMapper.deserialize<T>(jsonResponse);
    int i = 10;
    return _instance;
  }
}
