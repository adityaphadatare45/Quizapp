   // import the neccesary packeges
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem( // constructor 
    this.itemData, // constructor take itemdata as argument and initializes it 
     {super.key} // passes key to the parent widget 
     );

  final Map<String, Object> itemData; // variable declaration and initialization 

  @override // build method 
  Widget build(BuildContext context) { 
    final isCorrectAnswer =                // matches with the correct answer 
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(   // adds vertical padding around the row widget 
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(         // adds row 
        crossAxisAlignment: CrossAxisAlignment.start, // alignes the widget 
        children: [
          QuestionIdentifier(  // custom widget that shows answer is corrct or not 
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question'] as int,
          ),
          const SizedBox(width: 20), // adds spacing 
          Expanded(                 // allows to column to take remaining space 
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start, // gives alignment to column 
              children: [ 
                Text(                            // text widget 
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(                           // dispalys the users answers
                  itemData['user_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 202, 171, 252),
                    )
                  ),
                Text(                          // displays the corrct answers
                  itemData['correct_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 254, 246),
                    )
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
