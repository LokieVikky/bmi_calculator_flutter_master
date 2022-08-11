import 'package:dart_json_mapper/dart_json_mapper.dart';
/////////flutter pub run build_runner build --delete-conflicting-outputs

@jsonSerializable
class LoginReqModel {
  @JsonProperty(name: 'ExecutiveCode')
  String ExecutiveCode;
  @JsonProperty(name: 'UserId')
  String UserId;
  @JsonProperty(name: 'Password')
  String Password;
  @JsonProperty(name: 'MPin')
  String MPin;

  LoginReqModel({this.ExecutiveCode, this.UserId, this.Password, this.MPin});
}

@jsonSerializable
class LoginResModel {
  @JsonProperty(name: 'MessageResult')
  MessageResultt MessageResult;
  @JsonProperty(name: 'LoginResponse')
  List<LoginResponsee> LoginResponse;
}

@jsonSerializable
class MessageResultt {
  @JsonProperty(name: 'Result')
  String Result;
  @JsonProperty(name: 'SuccessMessage')
  String SuccessMessage;
  @JsonProperty(name: 'ErrorMessage')
  String ErrorMessage;
}

@jsonSerializable
class LoginResponsee {
  @JsonProperty(name: 'SessionId')
  String SessionId;
  @JsonProperty(name: 'PartyID')
  String PartyID;
  @JsonProperty(name: 'sgiPartyId')
  String sgiPartyId;
  @JsonProperty(name: 'PartyName')
  String PartyName;
}

void main() {}
