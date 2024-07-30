// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';

class HSEnhancedHtmlEditor extends StatefulWidget {
  const HSEnhancedHtmlEditor({Key? key, required this.controller, this.initialValue, this.initialHeight = 150}) : super(key: key);
  final HtmlEditorController controller;
  final String? initialValue;
  final double? initialHeight;

  @override
  State<HSEnhancedHtmlEditor> createState() => _HSEnhancedHtmlEditor();
}

class _HSEnhancedHtmlEditor extends State<HSEnhancedHtmlEditor> {
  int wordcount = 0;
  bool firstLoad = true;
  late HtmlEditorController controller;
  late Size screenSize;
  double? initialHeight = 0;
  String initialText = "Có lỗi khi lấy nội dung...";
  String contentValidationMessage = '';

  @override
  Widget build(BuildContext context) {
    controller = widget.controller;
    screenSize = MediaQuery.of(context).size;
    if (firstLoad) {
      firstLoadData();
      firstLoad = false;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          width: (screenSize.width * 0.9),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Set the color of the border
              width: 0.3, // Set the width of the border
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: HtmlEditor(
            controller: widget.controller,
            htmlEditorOptions: HtmlEditorOptions(
              hint: "Kéo ngang thanh editor để xem thêm định dạng.",
              initialText: '<div style="color: white;">&nbsp;</div>$initialText', // Initial text with white color
            ),
            htmlToolbarOptions: const HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.aboveEditor,
              defaultToolbarButtons: [
                FontButtons(),
                ParagraphButtons(caseConverter: false, textDirection: false, lineHeight: false),
                
                OtherButtons(
                  undo: true,
                  redo: true,
                  fullscreen: false,
                  codeview: false,
                  help: false,
                ),
              ],
              buttonColor: ColorConstants.bgWhite,
            ),
            callbacks: Callbacks(
              onChangeContent: (newText) {
                if (newText != null && newText != "") {
                  initialText = newText;
                  wordcount = newText.split(' ').length;
                } else {
                  wordcount = 0;
                }

                setState(() {});
              },
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(3.0)),
        Align(
          alignment: Alignment.centerRight,
          child: Text(wordcount.toString() + Strings.words),
        ),
        Text(contentValidationMessage, style: const TextStyle(color: Colors.red)),
      ],
    );
  }

  void firstLoadData() {
    if (widget.initialHeight != null) {
      initialHeight = widget.initialHeight;
    } else {
      initialHeight = screenSize.height * 0.65;
    }

    if (widget.initialValue != null) {
      initialText = widget.initialValue!;

      if (!isHtmlFormatted(initialText)) {
        initialText = parseFragment(initialText).text!;
      }
    }
  }

  bool isHtmlFormatted(String text) {
    final htmlTagPattern = RegExp(r'<[^>]*>');
    return htmlTagPattern.hasMatch(text);
  }
}
