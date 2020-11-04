import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/models/pay_model.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  static const String id = 'payment_page';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _webViewController = null;
    super.dispose();
  }

  WebView _showWebView(String url) {
    return WebView(
      debuggingEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (url) {
        print('url is $url');
      },
      onWebViewCreated: (controller) {
        _webViewController = controller;
        _webViewController.loadUrl(url);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    PayModel model = ModalRoute.of(context).settings.arguments;
    String url =
        '$kPayUrl?fullname=${model.name}&email=${model.email}&phone=${model.phone}'
        '&amount=${model.amount}&subId=${model.subId}';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PAYMENT'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _showWebView(url),
            ),
          ],
        ),
      ),
    );
  }
}
