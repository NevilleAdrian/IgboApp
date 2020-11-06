import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/providers/auth_provider.dart';
import 'package:nkuzi_igbo/utils/constants.dart';

import 'home_screen_slivers.dart';

class HomeScreenPageHeader implements SliverPersistentHeaderDelegate {
  HomeScreenPageHeader({
    this.onTap,
    this.minExtent,
    @required this.maxExtent,
  });
  final double minExtent;
  final Function onTap;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final String learnText = 'What will you like to learn today';
    print(shrinkOffset);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      learnText,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black.withOpacity(
                          reverseTitleOpacity(shrinkOffset),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SearchButton(
                onTap: onTap,
              )
              // Row(
              //   children: [
              //     CircleAvatar(
              //       radius: 28,
              //       backgroundImage: NetworkImage(
              //           'https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Text(
              //       learnText,
              //       style: TextStyle(
              //           fontSize: 14.0,
              //           color: Colors.black
              //               .withOpacity(reverseTitleOpacity(shrinkOffset))),
              //     )
              //   ],
              // ),
              // SearchButton(
              //   onTap: onTap,
              // )
            ],
          ),
          Expanded(
            child: Opacity(
              opacity: titleOpacity(shrinkOffset),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hello ${(toBeginningOfSentenceCase(Auth.authProvider(context).user?.name ?? ''))}',
                    textAlign: TextAlign.left,
                    style: kAuthTextBig.copyWith(
                        fontFamily: 'Baloo',
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 22.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    learnText,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(color: Colors.grey, height: 0.3),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  double reverseTitleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 0.0 + max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider get vsync => null;
}
// Stack(
// fit: StackFit.expand,
// children: [
// Image.asset(
// 'assets/images/onboarding.png',
// fit: BoxFit.cover,
// ),
// Container(
// color: Colors.purple,
// ),
// Positioned(
// left: 16.0,
// right: 16.0,
// bottom: 16.0,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// 'Hello ${(toBeginningOfSentenceCase(Auth.authProvider(context).user?.name ?? ''))}',
// textAlign: TextAlign.left,
// style: kAuthTextBig.copyWith(
// fontFamily: 'Baloo',
// fontWeight: FontWeight.w900,
// color: Colors.black,
// fontSize: 22.0),
// ),
// SizedBox(
// height: 5.0,
// ),
// Text(
// learnText,
// style: TextStyle(fontSize: 14.0, color: Colors.black),
// ),
// SizedBox(
// height: 25.0,
// ),
// Container(color: Colors.grey, height: 0.3),
// SizedBox(
// height: 25.0,
// ),
// ],
// ),
// ),
// ],
// );
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 20.0),
// child: Stack(
// fit: StackFit.expand,
// children: [
// Align(
// alignment: Alignment.topLeft,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Expanded(
// child: Row(
// children: [
// CircleAvatar(
// radius: 28,
// backgroundImage: NetworkImage(
// 'https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&w=1000&q=80'),
// ),
// SizedBox(
// width: 20,
// ),
// Text(
// learnText,
// style: TextStyle(
// fontSize: 14.0,
// color: Colors.black.withOpacity(
// reverseTitleOpacity(shrinkOffset))),
// )
// ],
// ),
// ),
// SearchButton(
// onTap: onTap,
// )
// ],
// ),
// ),
// Align(
// alignment: Alignment.bottomLeft,
// child: Opacity(
// opacity: (titleOpacity(shrinkOffset)),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// 'Hello ${(toBeginningOfSentenceCase(Auth.authProvider(context).user?.name ?? ''))}',
// textAlign: TextAlign.left,
// style: kAuthTextBig.copyWith(
// fontFamily: 'Baloo',
// fontWeight: FontWeight.w900,
// color: Colors.black,
// fontSize: 22.0),
// ),
// SizedBox(
// height: 5.0,
// ),
// Text(
// learnText,
// style: TextStyle(fontSize: 14.0, color: Colors.black),
// ),
// SizedBox(
// height: 25.0,
// ),
// Container(color: Colors.grey, height: 0.3),
// SizedBox(
// height: 25.0,
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// );
