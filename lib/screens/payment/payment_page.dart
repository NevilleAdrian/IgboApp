import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
  bool _loading = true;

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
        setState(() {
          _loading = false;
        });
      },
      onWebViewCreated: (controller) {
        _webViewController = controller;
        _webViewController.loadUrl(url);
      },
    );
  }

  Widget _showWeb(String url) {
    return WebviewScaffold(
        url: url,
        appBar: AppBar(
          title: Text('PAYMENT'),
        ),
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: CircularProgressIndicator(backgroundColor: kPrimary),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    PayModel model = ModalRoute.of(context).settings.arguments;
    String url =
        '$kPayUrl?fullname=${model.name}&email=${model.email}&phone=${model.phone}'
        '&amount=${model.amount}&subId=${model.subId}&currency=${model.currency}';
    return SafeArea(child: _showWeb(url));
  }
}
