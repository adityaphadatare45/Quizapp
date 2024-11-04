
import 'package:flutter/material.dart'; // import all necessery packages 
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answers_button.dart';
import 'package:quizapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key, // super.key passes a key to the superclass for widgwt identification 
    required this.onSelectAnswer, // a callback fuuction that takes a string as parameter
  });

  final void Function(String answer) onSelectAnswer; // initialization of onSelectAnswer

  @override
  State<QuestionsScreen> createState() { // create an instance of _QuestionsScreenState, which manages the state of this widget.
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> { 
  var currentQuestionIndex = 0; // an integer that keeps track of which question is currently being displayed

  void answerQuestion(String selectedAnswer) { // this method is called when an answer is selected
    widget.onSelectAnswer(selectedAnswer);
   
    setState(() { // calls to update the current state of the question 
      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) { // build method 
    final currentQuestion = questions[currentQuestionIndex]; //retrives the current question from the questions list 

    return SizedBox( // a widget that expands to take the full width of its parent
      width: double.infinity,
      child: Container( // uesd to add margins around the content 
        margin: const EdgeInsets.all(40),
        child: Column( // 
          mainAxisAlignment: MainAxisAlignment.center, // centers rhe children vertically 
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretches the children horizontally to fill the available space.
          children: [ // Create vertiacl array of children
            Text(
              currentQuestion.text, // displays the current question
              style: GoogleFonts.lato( // properties for text 
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // adds distance between text and button
            ...currentQuestion.shuffledAnswers.map((answer) {  // shows the questions list in random order
              return AnswerButton(
                answerText: answer,
                onTap: () { 
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
