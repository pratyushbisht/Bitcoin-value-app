import 'package:http/http.dart' as http;
import 'dart:convert';
String url = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = 'apikey=CFB5E95A-2741-407D-AF5D-D56891EE8C7C';


class networkhelper {


  Future <dynamic> getdata(  String currency) async {
    var link = Uri.parse('$url/BTC/$currency?$apikey');
    http.Response response = await http.get(link);
    if (response.statusCode == 200) {
      String Data = response.body;
      var decodedData = jsonDecode(Data);
      var rate = decodedData['rate'];
      return rate;
    }
  }


Future <dynamic> getdataE(  String currency) async{
  var link =   Uri.parse('$url/ETH/$currency?$apikey');
  http.Response response = await http.get(link);
  if(response.statusCode == 200)
  {
    String DataE = response.body;
    var decodedData =  jsonDecode(DataE);
    var rate =  decodedData['rate'];
    return rate;
  }
}
Future <dynamic> getdataL(  String currency) async {
  var link = Uri.parse('$url/LTC/$currency?$apikey');
  http.Response response = await http.get(link);
  if (response.statusCode == 200) {
    String DataL = response.body;
    var decodedData = jsonDecode(DataL
    );
    var rate = decodedData['rate'];
    return rate;
  }
}





}
