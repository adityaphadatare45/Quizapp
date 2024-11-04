   // import the neccesary packages 
import 'package:flutter/material.dart';
import 'package:quizapp/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary( // constructor
    this.summaryData, // takes summary data as parameter 
     {super.key}      //  Passes a key to the superclass (StatelessWidget) for identification purposes.
     );

  final List<Map<String, Object>> summaryData; // variable initialization

  @override // build method for widget 
  Widget build(BuildContext context) {
    return SizedBox(   // widget for height 
      height: 400,
      child: SingleChildScrollView( //allows the content to be scrollable 
        child: Column(              // widget for arranging its children vertically .
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
