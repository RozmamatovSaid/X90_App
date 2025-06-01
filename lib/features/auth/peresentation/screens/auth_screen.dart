import 'package:flutter/material.dart';
import 'package:x90/core/widgets/global_text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: GlobalText.title('X90'),),);
  }
}
