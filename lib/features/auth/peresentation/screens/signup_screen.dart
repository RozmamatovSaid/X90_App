import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x90/core/router/routes.dart';
import 'package:x90/core/widgets/custom_button.dart';
import 'package:x90/core/widgets/custom_textfield.dart';
import 'package:x90/core/widgets/gap.dart';
import 'package:x90/core/widgets/global_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: GlobalText(
          "What's you remail address?",
          fontSize: 24,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 16, left: 16, top: 24),
        child: Column(spacing: 20, children: [EmailTextField()]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              text: 'Next',
              height: 40,
              onPressed: () => context.push(AppRoutes.enterTheCode),
            ),
          ],
        ),
      ),
    );
  }
}

class EnterTheCode extends StatelessWidget {
  const EnterTheCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalText(
              'Welcome to X90',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            20.g,
            GlobalText('Enter the 4-digit code sent to you at:'),
            GlobalText("caidcode@gmail.com"),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              text: 'Next',
              height: 40,
              onPressed: () => context.push(AppRoutes.enterTheCode),
            ),
          ],
        ),
      ),
    );
  }
}
