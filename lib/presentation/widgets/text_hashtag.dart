import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class TextHashtag extends StatefulWidget {
  const TextHashtag({super.key, required this.text, this.name});
  final String text;
  final String? name;

  @override
  State<TextHashtag> createState() => _TextHashtagState();
}

class _TextHashtagState extends State<TextHashtag> {
  bool showFullText = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          buildHighlightedText(widget.name,widget.text,showFullText),
          if(widget.text.length>=50)InkWell(
              onTap: () {
                showFullText = !showFullText;
                setState(() {

                });
              },
              child: Text(!showFullText ? "...more" : "...less",style: AppStyle.hintGray12,))
        ],
      ),
    );
  }

  List<String> getAllHashtags(String text) {
    final regexp = RegExp(r'\#[a-zA-Z0-9]+\b()');

    List<String> hashtags = [];

    regexp.allMatches(text).forEach((element) {
      if (element.group(0) != null) {
        hashtags.add(element.group(0).toString());
      }
    });

    return hashtags;
  }

  List<String> getAllMentions(String text) {
    final regexp = RegExp(r'\@[a-zA-Z0-9]+\b()');

    List<String> mentions = [];

    regexp.allMatches(text).forEach((element) {
      if (element.group(0) != null) {
        mentions.add(element.group(0).toString());
      }
    });

    return mentions;
  }

  RichText buildHighlightedText(String? name,String text,bool showFull) {
    // clean the text
    text = cleanText(text);

    List<String> validMentions = ["@mention1", "@mention2"];

    List<String> hashtags = getAllHashtags(text);
    List<String> mentions = getAllMentions(text);

    List<TextSpan> textSpans = [];
    if(name.isNotNull){
      textSpans.add(TextSpan(
        text: '$name ',
        style: AppStyle.black12w600,
      ));

    }
    text.split(" ").forEach((value) {
      if (hashtags.contains(value)) {
        textSpans.add(TextSpan(
          text: '$value ',
          style: AppStyle.black12.copyWith(color: Colors.blue,),
        ));
      } else if (mentions.contains(value) && validMentions.contains(value)) {
        textSpans.add(TextSpan(
          text: '$value ',
          style: AppStyle.black12.copyWith(color: Colors.blue,),
        ));
      } else {
        textSpans.add(TextSpan(text: '$value ',style: AppStyle.black12));
      }
    });

    return RichText(text: TextSpan(children: textSpans,style: AppStyle.black12,),textAlign: TextAlign.start,maxLines: showFull ? null : 3,);
  }

  String cleanText(String text) {
    text = text.replaceAllMapped(
        RegExp(r'\w#+'), (Match m) => "${m[0]?.split('').join(" ")}");

    text = text.replaceAllMapped(
        RegExp(r'\w@+'), (Match m) => "${m[0]?.split('').join(" ")}");

    return text;
  }
}
