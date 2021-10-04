import 'dart:ffi';

import 'package:flutter/material.dart';
import 'coind_data.dart';
import 'package:bitcoin/Networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

   String exchange = '?';
   String exchange1 = '?';
   String exchange2 = '?';
   Color ETH = Color(0xff48cbd9);
   Color LTC = Color(0xff00aeff);


  Future<dynamic> update() async{
    networkhelper helper = networkhelper();

   var data = await helper.getdata( selectedCurrency);
    setState(() {
      exchange = data.toStringAsFixed(0);
    });
  }
   Future<dynamic> updateE() async{
     networkhelper helper = networkhelper();

     var data1 = await helper.getdataE( selectedCurrency);
     setState(() {
       exchange1 = data1.toStringAsFixed(0);
     });
   }
   Future<dynamic> updateL() async{
     networkhelper helper = networkhelper();

     var data2 = await helper.getdataL( selectedCurrency);
     setState(() {
       exchange2 = data2.toStringAsFixed(0);
     });
   }
  void initState() {
    super.initState();
    //14. Call getData() when the screen loads up. We can't call CoinData().getCoinData() directly here because we can't make initState() async.
   update();
   updateE();
   updateL();
  }
  // List<String> getCardItems()
  // {
  //   List<String> crypto = []
  //       for(int j=0;j<cryptoList.length;j++)
  //         {
  //
  //         }
  // }



  List<DropdownMenuItem<String>> getDropDownItems()
  {
    List<DropdownMenuItem<String>> dropdown = [];
  for( int i = 0; i<currenciesList.length;i++) {

      String drop = currenciesList[i];
     var newitem =  DropdownMenuItem(
        child: Text('$drop'),
        value: '$drop',
      );
     dropdown.add(newitem);
    }
  return dropdown;


  }
  String selectedCurrency = 'USD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.orangeAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $exchange $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: ETH,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $exchange $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
             color: LTC ,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $exchange $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: '$selectedCurrency',
              items: getDropDownItems().toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency= value!;
                  update();
                  updateE();
                  updateL();
                  // update();
                  // updateE();
                  // updateL();
                  // var currency = helper.getdata();
                  // Double cur = currency['rate'];

                }
                );

              },
              icon: Icon(Icons.arrow_drop_down,
                         color: Colors.yellowAccent,
                         ),

            ),
          ),
        ],
      ),
    );
  }
}
