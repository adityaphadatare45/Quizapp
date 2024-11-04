  // import necessary packeges 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget { 
  const ResultsScreen({
    super.key, // super.key passes a key to the superclass for widgwt identification 
    required this.chosenAnswers, // list of answers selected by user 
    required this.onRestart,
  });

  final void Function() onRestart; // variable declarartion and initialization 
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {    // Used to generate list of map 
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i, // index of the questions 
          'question': questions[i].text, // the question text 
          'correct_answer': questions[i].answers[0], // the correct answer of that question 
          'user_answer': chosenAnswers[i] // users answer   
        },
      );
    }

    return summary; // returns the symmary of the quiz 
  }

  @override // build method 
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;  // variable initialization and declaration
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'], // this function compares the user answers to correct answers 
        )
        .length;
 
    return SizedBox(                 // expands the child as the size of the parent
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40), // adds margin around the content 
        child: Column(                                   // arranges the child vertically 
          mainAxisAlignment: MainAxisAlignment.center,  // gives alignment to the content 
          children: [
            Text(                                    // displays how many questions are correct that answered by the user
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // gives alignment to the text 
            ),
            const SizedBox( // adds the distance between the text and the button
              height: 30,
            ),
            QuestionsSummary(summaryData),  // widget that displays the detailed summary the quiz 
            const SizedBox(
              height: 30,
            ),
            TextButton.icon( /// text button for restarting the quiz
              onPressed: onRestart,  
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
