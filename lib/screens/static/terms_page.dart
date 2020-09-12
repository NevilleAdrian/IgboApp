import 'package:flutter/material.dart';
import 'package:nkuzi_igbo/helpers/static_layout.dart';

class TermsPage extends StatelessWidget {
  static const String id = 'terms_page';
  @override
  Widget build(BuildContext context) {
    return StaticLayout(
      title: 'Terms of Service',
      content:
          '<p>Quisque suscipit ipsum est, eu venenatis leo ornare eget. Ut porta facilisis elementum. '
          'Sed condimentum sed massa quis ullamcorper. Donec at scelerisque neque. Pellentesque sagittis, massa sodales sodales finibus, felis ligula tempus lorem, eu porttitor </p>'
          '<p>ex lacus vel felis. Vivamus egestas scelerisque consectetur. Vestibulum faucibus enim urna, fermentum aliquet quam euismod non. Proin cursus, '
          'libero quis semper elementum, diam metus eleifend magna, in placerat sem velit vitae lacus. Vivamus tempor fringilla nisl, id condimentum felis dignissim nec. Quisque suscipit ipsum est, eu venenatis leo ornare eget. Ut porta facilisis elementum. Sed condimentum sed massa quis ullamcorper. Donec at scelerisque neque. Pellentesque sagittis, massa sodales sodales finibus, felis ligula tempus lorem, eu porttitor ex lacus vel felis. Vivamus egestas scelerisque '
          'consectetur. Vestibulum faucibus enim urna, fermentum aliquet quam euismod non.</p>'
          '<p>ex lacus vel felis. Vivamus egestas scelerisque consectetur. Vestibulum faucibus enim urna, fermentum aliquet quam euismod non. Proin cursus, '
          'libero quis semper elementum, diam metus eleifend magna, in placerat sem velit vitae lacus. Vivamus tempor fringilla nisl, id condimentum felis dignissim nec. Quisque suscipit ipsum est, eu venenatis leo ornare eget. '
          'Ut porta facilisis elementum. Sed condimentum sed massa quis ullamcorper. Donec at scelerisque neque. Pellentesque sagittis, massa sodales sodales finibus, felis ligula tempus lorem, eu porttitor ex lacus vel felis. Vivamus egestas scelerisque '
          'consectetur. Vestibulum faucibus enim urna, fermentum aliquet quam euismod non.</p>',
    );
  }
}
