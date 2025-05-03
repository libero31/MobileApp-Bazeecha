import 'package:bazeecha/utils/colors.dart';
import 'package:bazeecha/utils/dimensions.dart';

import 'package:bazeecha/widgets/text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 3;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(
        textHeight.toInt() + 1,
        widget.text.length,
      );
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          secondHalf.isEmpty
              ? RText(
                text: firstHalf,
                color: Color.fromARGB(255, 81, 80, 80),
                size: 10,
              )
              : Column(
                children: [
                  RText(
                    color: Color.fromARGB(255, 81, 80, 80),
                    text:
                        hiddenText
                            ? ("$firstHalf...")
                            : (firstHalf + secondHalf),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        RText(
                          text: hiddenText ? ("Show more") : ("Show less"),
                          color: AppColor.red,
                          size: 10,
                        ),
                        Icon(
                          hiddenText
                              ? (Icons.arrow_drop_down)
                              : (Icons.arrow_drop_up),
                          color: AppColor.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
