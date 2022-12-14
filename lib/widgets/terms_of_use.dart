import 'package:flutter/material.dart';

import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:omicronapp/widgets/policy_dialog.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "By confirming setup, you are agreeing to our\n",
          style: const TextStyle(
            color: Color.fromARGB(255, 245, 124, 0),
          ),
          children: [
            TextSpan(
              text: "Terms & Conditions ",
              style: const TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showModal(
                    context: context,
                    configuration: const FadeScaleTransitionConfiguration(),
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'assets/terms_and_conditions.md',
                      );
                    },
                  );
                },
            ),
            const TextSpan(text: "and "),
            TextSpan(
              text: "Privacy Policy! ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'assets/privacy_policy.md',
                      );
                    },
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
