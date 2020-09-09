// import 'package:flutter/material.dart';
//
// class RavePay extends StatefulWidget {
//   @override
//   _RavePayState createState() => _RavePayState();
// }
//
// class _RavePayState extends State<RavePay> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Builder(
//         builder: (context) => SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Pay Me',
//               ),
//               FlatButton.icon(
//                 onPressed: () {
//                   _pay(context);
//                 },
//                 icon: Icon(Icons.email),
//                 label: Text("Pay"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _pay(BuildContext context) {
//     final _rave = RaveCardPayment(
//       isDemo: true,
//       encKey: "c53e399709de57d42e2e36ca",
//       publicKey: "FLWPUBK-d97d92534644f21f8c50802f0ff44e02-X",
//       transactionRef: "SCH${DateTime.now().millisecondsSinceEpoch}",
//       amount: 100,
//       email: "demo1@example.com",
//       onSuccess: (response) {
//         print("$response");
//         print("Transaction Successful");
//
//         if (mounted) {
//           Scaffold.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Transaction Sucessful!"),
//               backgroundColor: Colors.green,
//               duration: Duration(
//                 seconds: 5,
//               ),
//             ),
//           );
//         }
//       },
//       onFailure: (err) {
//         print("$err");
//         print("Transaction failed");
//       },
//       onClosed: () {
//         print("Transaction closed");
//       },
//       context: context,
//     );
//
//     _rave.process();
//   }
// }
