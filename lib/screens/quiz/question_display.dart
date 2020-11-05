import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:nkuzi_igbo/ui_widgets/network_image_cache.dart';
import 'package:nkuzi_igbo/utils/constants.dart';
import 'package:nkuzi_igbo/utils/functions.dart';

class QuestionDisplay extends StatelessWidget {
  final String top;
  final String image;
  final String bottom;
  final bool isRegular;

  QuestionDisplay({this.isRegular, this.top, this.image, this.bottom});
  Widget get _child {
    if (isRegular ?? false) {
      return RegularQuestion(
        top: top,
        bottom: bottom,
        image: image,
      );
    }
    return IrregularQuestion(
      top: top,
      bottom: bottom,
      image: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class RegularQuestion extends StatelessWidget {
  final String top;
  final String image;
  final String bottom;
  RegularQuestion({this.top, this.image, this.bottom});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(alignment: Alignment.topCenter, child: HtmlWidget(top ?? '')),
        SizedBox(
          height: 20,
        ),
        kAppDivider,
        SizedBox(
          height: image == null ? 0 : 20,
        ),
        if (!isNullOrEmpty(image))
          Expanded(
            child: AppNetworkImage(
              image: image,
            ),
          ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: Align(
                alignment: Alignment.topCenter,
                child: HtmlWidget(bottom ?? ''))),
      ],
    );
  }
}

class IrregularQuestion extends StatelessWidget {
  final String top;
  final String image;
  final String bottom;
  IrregularQuestion({this.top, this.image, this.bottom});

  bool get _imageOnly => !isNullOrEmpty(image) && isNullOrEmpty(bottom);

  Widget get _child {
    if (_imageOnly) {
      return CachedNetworkImage(
        key: GlobalKey(),
        imageUrl: image,
        placeholder: (context, url) => Image.asset('assets/images/shimmer.gif'),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }
    return IrregularContainer(
      image: image,
      text: bottom,
      key: GlobalKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(top);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HtmlWidget(
          top ?? '',
        ),
        SizedBox(
          height: 30,
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: _child,
          ),
        ),
      ],
    );
  }
}

class IrregularContainer extends StatefulWidget {
  final String image;
  final String text;
  final Key key;
  IrregularContainer({this.text, this.image, this.key}) : super(key: key);

  @override
  _IrregularContainerState createState() => _IrregularContainerState();
}

class _IrregularContainerState extends State<IrregularContainer> {
  GlobalKey _imgKey = GlobalKey();
  GlobalKey _textKey = GlobalKey();
  double _columnHeight = double.infinity;
  void _columnSize() {
    RenderBox imgBox = _imgKey.currentContext?.findRenderObject();
    RenderBox textBox = _textKey.currentContext?.findRenderObject();
    print('image box: ${imgBox?.size?.height}');
    print('text box: ${textBox?.size?.height}');
    double combinedHeight = 0;
    if (imgBox != null) {
      combinedHeight += imgBox.size.height;
    }
    if (textBox != null) {
      combinedHeight += textBox.size.height;
    }
    print('height is $combinedHeight');
    setState(() {
      _columnHeight = combinedHeight + 100;
      print('column height is $_columnHeight');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _columnSize());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      height: _columnHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
        borderRadius: kAppInnerBorderRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isNullOrEmpty(widget.image))
            Expanded(
              key: _imgKey,
              child: CachedNetworkImage(
                imageUrl: widget.image,
                placeholder: (context, url) =>
                    Image.asset('assets/images/shimmer.gif'),
                errorWidget: (context, url, error) => SizedBox(),
              ),
            ),
          if (!isNullOrEmpty(widget.text))
            Flexible(
              child: HtmlWidget(
                widget.text ?? '',
                key: _textKey,
              ),
            )
        ],
      ),
    );
  }
}
