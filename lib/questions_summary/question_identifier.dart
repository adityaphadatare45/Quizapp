 // import the neccesary package
import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,                     // super.key passes a key to the superclass for widgwt identification 
    required this.isCorrectAnswer, // 
    required this.questionIndex,   // 
  });

  final int questionIndex; // variable declaration and initialization 
  final bool isCorrectAnswer;

  @override  // build method 
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1; // converts the zero based system to one based system
    return Container(  // widget
      width: 30, // properties to widget 
      height: 30,
      alignment: Alignment.center,  // align the container to center 
      decoration: BoxDecoration( // decoration for the container
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 150, 198, 241)
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(  // text widget 
        questionNumber.toString(), // converts question number to string for display
        style: const TextStyle(   // adds style to text 
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56), // adds color to the text
        ),
      ),
    );
  }
}
