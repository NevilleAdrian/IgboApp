import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

class LoadingButton extends StatelessWidget {
  final bool isLoading;
  final Widget display;
  final Function action;
  final Color color;
  final bool isFlat;
  LoadingButton({
    this.display,
    this.isLoading,
    this.action,
    this.color = kButtonColor,
    this.isFlat = true,
  });

  Widget _spinner(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(kPrimary),
    );
  }

  void _showFlush(BuildContext context, String message) {
    Flushbar(
      backgroundColor: kAccent,
      message: message,
      duration: Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);
  }

  Future<void> _onPressed(BuildContext context) async {
    try {
      await action();
    } catch (ex) {
      _showFlush(context, ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isFlat
        ? FlatButton(
            color: color,
            onPressed: () async {
              await _onPressed(context);
            },
            child: isLoading ? _spinner(context) : display,
          )
        : OutlineButton(
            color: color,
            onPressed: () async {
              await _onPressed(context);
            },
            child: isLoading ? _spinner(context) : display,
          );
  }
}
