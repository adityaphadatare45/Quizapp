  //  import the neccesary packages 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(  // constructor 
    this.startQuiz,   
     {super.key}    // // super.key passes a key to the superclass for widgwt identification 
     );

  final void Function() startQuiz; // declaration and initialization 

  @override
  Widget build(context) {  // build method 
    return Center( 
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset( // images widget 
            'assets/images/quiz-logo.png', // gets the image that stored in assets folder
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
         
          const SizedBox(height: 80),
          Text(  // text widget 
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30), // adds distance 
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
