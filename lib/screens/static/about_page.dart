import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/helpers/static_layout.dart';

class AboutPage extends StatelessWidget {
  static const String id = 'about_page';
  @override
  Widget build(BuildContext context) {
    return StaticLayout(
      title: 'About Nkuzi Igbo',
      content: '<p><strong>About Nkuzi Igbo</strong></p>'
          '<p><span style="font-weight: 400;">Nkuzi Igbo is a startup language '
          'learning platform in Igbo language, it hopes to become the most downloaded Igbo education '
          'learning app in the world, with millions of users. Our mission is to make the learning '
          'of the Igbo language fun and accessible to all. Nkuzi Igbo is gamified to make learning effective. '
          'There are several basic learning materials in the learning of Igbo as well as a huge content base '
          'for learners of the indigenous Nigerian Language who want to progress in their learning.</span></p>',
    );
  }
}
