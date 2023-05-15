import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedText extends StatelessWidget {
  final String text;

  const LinkedText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Linkify(
      onOpen: (link) async {
        if (await canLaunchUrl(Uri.parse(link.url))) {
          await launchUrl(Uri.parse(link.url));
        } else {
          throw 'Could not launch $link';
        }
      },
      text: text,
    );
  }
}
