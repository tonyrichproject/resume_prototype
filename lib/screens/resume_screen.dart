import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../utils.dart' as util;
import '../const.dart' as cons;
import '../models/display_screen.dart';
import '../widgets/backdrop_widget.dart';
import '../widgets/content_item_widget.dart';
import '../widgets/content_transformer.dart';

class ResumeScreen extends StatefulWidget {
  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  var _currentIndex = cons.cStartingIndex;
  @override
  Widget build(BuildContext context) {
    DisplayScreen().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: util.displayHeight() * 0.18,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Tony Free Dev',
                    style: TextStyle(
                      fontSize: cons.cCaptionTextSize,
                      fontWeight: FontWeight.bold,
                      color: cons.cTextFeatureColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      BackdropWidget(contentList: util.contentList, resumeContent: util.contentList[_currentIndex]),
                      _buildResumePage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResumePage() {
    return Container(
      child: TransformerPageView(
        itemCount: util.contentList.length,
        scrollDirection: Axis.vertical,
        transformer: ContentTransformer(),
        itemBuilder: (context, id) =>
            ContentItemWidget(contentList: util.contentList, resumeContent: util.contentList[id]),
        onPageChanged: (currID) {
          setState(() {
            _currentIndex = currID;
          });
        },
      ),
    );
  }
}
