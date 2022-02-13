// // import 'package:flutter/material.dart';
// //
// // class NotesPage extends StatefulWidget {
// //   @override
// //   _NotesPageState createState() => _NotesPageState();
// // }
// //
// // class _NotesPageState extends State<NotesPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: Center(
// //         child: Text("Notes Page"),
// //       ),
// //     );
// //   }
// // }
// // THIS IS TOKEN
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:project1/drawer/var.dart';
// import 'package:web3dart/web3dart.dart';
//
// void main() {
//   runApp(tokenApp());
// }
//
// class tokenApp extends StatelessWidget {
//   const tokenApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//           primaryColor: Color(0xFF6c5ed0),
//           fontFamily: 'Montserrat',
//           scaffoldBackgroundColor: Colors.white),
//       home: const MyHomePage(title: 'AMITY1'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Client httpClient;
//   late Web3Client ethClient;
//   bool data = false;
//   int myAmount = 0;
//   late String userAddress ;
//   //final mainAddress = "0x876738c8C912f0694243be128F3464dF699Ea5c2";
//
//   TextEditingController userAddressController = TextEditingController();
//
//
//   var myData;
//
//   @override
//   void initState() {
//     super.initState();
//     httpClient = Client();
//     ethClient = Web3Client(
//         "https://speedy-nodes-nyc.moralis.io/d6e5c12dbac5ac115c4d9aa2/polygon/mumbai",
//         httpClient);
//     balanceOf(userAddress);
//   }
//
//   Future<DeployedContract> loadContract() async {
//     String abi = await rootBundle.loadString("assets/abi.json");
//     String contractAddress = "0x2f706C42B3f33fD7E88a2d078d58d0eD9A613b6b";
//
//     final contract = DeployedContract(ContractAbi.fromJson(abi, "AMITY"),
//         EthereumAddress.fromHex(contractAddress));
//
//     return contract;
//   }
//
//   Future<List<dynamic>> query(dynamic functionName, List<dynamic> args) async {
//     final contract = await loadContract();
//     final ethFunction = contract.function(functionName);
//     final result = await ethClient.call(
//         contract: contract, function: ethFunction, params: args);
//
//     return result;
//   }
//
//   Future<void> balanceOf(String userAddress) async {
//     EthereumAddress address = EthereumAddress.fromHex(userAddress);
//
//     var result = await query("balanceOf", [address]);
//
//     myData = result[0];
//     data = true;
//     setState(() {});
//   }
//
//   Future<String> submit(String functionName, List<dynamic> args) async {
//     EthPrivateKey credentials = EthPrivateKey.fromHex(
//         "d21990b5d4c6fe3da52563e973d9c6224532c6a707d2087e7a32c5deb067a073");
//
//     DeployedContract contract = await loadContract();
//
//     final ethFunction = contract.function(functionName);
//
//     final result = await ethClient.sendTransaction(
//         credentials,
//         Transaction.callContract(
//             contract: contract, function: ethFunction, parameters: args),
//         chainId: 80001);
//
//     return result;
//   }
//
//   Future<String> transfer() async {
//     var bigAmount = 20;
//     EthereumAddress address = EthereumAddress.fromHex(userAddressController.text);
//     var response = await submit("transfer", [address, bigAmount]);
//
//     print("Claimed");
//     return response;
//   }
//
//   // Future<String> withdrawCoin() async {
//   //   var bigAmount = BigInt.from(myAmount);
//   //
//   //   var response = await submit("withdrawBalance", [bigAmount]);
//   //
//   //   print("Withdrawn");
//   //   return response;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: Text("\$AMITY"),
//         //   centerTitle: true,
//         //   titleTextStyle: TextStyle(
//         //     color: Colors.white,
//         //     fontFamily: 'Montserrat',
//         //     fontSize: 21,
//         //   ),
//         // ),
//         body: Stack(children: <Widget>[
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.all(20.0),
//                   margin: EdgeInsets.all(50),
//                   height: 120,
//                   width: 300,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           'Token Balance',
//                           style: TextStyle(
//                             fontSize: 21.0,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         child: data
//                             ? Text(
//                           "\$${myData}",
//                           style:
//                           TextStyle(fontSize: 21, color: Colors.white),
//                         )
//                             : CircularProgressIndicator(
//                           strokeWidth: 1,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF6c5ed0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 15.0, // soften the shadow
//                         spreadRadius: 3.0, //extend the shadow
//                         offset: Offset(
//                           9.0, // Move to right 10  horizontally
//                           9.0, // Move to bottom 10 Vertically
//                         ),
//                       )
//                     ],
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//
//                     //color: Colors.blue,
//                   ),
//                 ),
//
//                 Container(
//                   child: Text("Claimable Tokens: \$${amityTokenBalance}", style: TextStyle(
//                     fontSize: 20,
//                   ),),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextField(
//                     controller: userAddressController,
//                     decoration: InputDecoration(
//                         hintText: 'Enter Wallet Address',
//                         labelText: 'Enter Wallet Address',
//                         labelStyle: TextStyle(color: Colors.black),
//                         border: OutlineInputBorder(),
//                         prefixIcon: Icon(Icons.account_balance_wallet)),
//                     keyboardType: TextInputType.number,
//                     maxLength: 35,
//                     maxLines: 1,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ElevatedButton.icon(
//                               onPressed: () => balanceOf(userAddress),
//                               icon: Icon(Icons.refresh_rounded),
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15)),
//                                 primary: Colors.deepPurple,
//                               ),
//                               label: Text(
//                                 'Refresh',
//                               )),
//                         )),
//                     Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ElevatedButton.icon(
//                               onPressed: () {
//                                 transfer();
//                                 balanceOf(userAddress);
//                               },
//                               icon: Icon(Icons.call_received),
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15)),
//                                 primary: Colors.deepPurple,
//                               ),
//                               label: Text(
//                                 'Claim Tokens',
//                               )),
//                         ))
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   mainAxisSize: MainAxisSize.max,
//                 ),
//               ],
//             ),
//           ),
//         ]));
//   }
// }


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(tokenApp());
}

class tokenApp extends StatelessWidget {
  const tokenApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Color(0xFF6c5ed0),
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.white),
      home: const MyHomePage(title: 'AMITY1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Client httpClient;
  late Web3Client ethClient;
  bool data = false;
  int myAmount = 0;

  final mainAddress = "0x876738c8C912f0694243be128F3464dF699Ea5c2";
  final userAddress = "0xD86Bd322026DB7e3B9a5baE4DaF1507b56Cc0A9D";

  TextEditingController myAmountController = TextEditingController();

  var myData;

  @override
  void initState() {
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(
        "https://speedy-nodes-nyc.moralis.io/d6e5c12dbac5ac115c4d9aa2/polygon/mumbai",
        httpClient);
    balanceOf(userAddress);
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x2f706C42B3f33fD7E88a2d078d58d0eD9A613b6b";

    final contract = DeployedContract(ContractAbi.fromJson(abi, "AMITY"),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<List<dynamic>> query(dynamic functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<void> balanceOf(String userAddress) async {
    EthereumAddress address = EthereumAddress.fromHex(userAddress);

    var result = await query("balanceOf", [address]);

    myData = result[0];
    data = true;
    setState(() {});
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(
        "d21990b5d4c6fe3da52563e973d9c6224532c6a707d2087e7a32c5deb067a073");

    DeployedContract contract = await loadContract();

    final ethFunction = contract.function(functionName);

    final result = await ethClient.sendTransaction(
        credentials,
        Transaction.callContract(
            contract: contract, function: ethFunction, parameters: args),
        chainId: 80001);

    return result;
  }

  Future<String> transfer() async {
    var bigAmount = BigInt.parse(myAmountController.text);
    EthereumAddress address = EthereumAddress.fromHex(userAddress);
    var response = await submit("transfer", [address, bigAmount]);

    print("Claimed");
    return response;
  }

  // Future<String> withdrawCoin() async {
  //   var bigAmount = BigInt.from(myAmount);
  //
  //   var response = await submit("withdrawBalance", [bigAmount]);
  //
  //   print("Withdrawn");
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("\$AMITY"),
        //   centerTitle: true,
        //   titleTextStyle: TextStyle(
        //     color: Colors.white,
        //     fontFamily: 'Montserrat',
        //     fontSize: 21,
        //   ),
        // ),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(50),
                  height: 120,
                  width: 300,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Token Balance',
                          style: TextStyle(
                            fontSize: 21.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: data
                            ? Text(
                          "\$${myData}",
                          style:
                          TextStyle(fontSize: 21, color: Colors.white),
                        )
                            : CircularProgressIndicator(
                          strokeWidth: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF6c5ed0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          9.0, // Move to right 10  horizontally
                          9.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                    //color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: myAmountController,
                    decoration: InputDecoration(
                        hintText: 'Claimable Tokens',
                        labelText: 'Claimable Tokens',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_balance_wallet)),
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    maxLines: 1,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              onPressed: () => balanceOf(userAddress),
                              icon: Icon(Icons.refresh_rounded),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                primary: Colors.deepPurple,
                              ),
                              label: Text(
                                'Refresh',
                              )),
                        )),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                transfer();
                                balanceOf(userAddress);
                              },
                              icon: Icon(Icons.call_received),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                primary: Colors.deepPurple,
                              ),
                              label: Text(
                                'Claim Tokens',
                              )),
                        ))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                ),
              ],
            ),
          ),
        ]));
  }
}
