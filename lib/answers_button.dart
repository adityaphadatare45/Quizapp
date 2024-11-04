
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget { // Stateless widget does not have mutable state
  const AnswerButton({
    super.key, // super.key passes a key to the superclass for widgwt identification 
    required this.answerText, // required string property to specify the text displayed on the button 
    required this.onTap,  // required callback function that is triggered whan the button is pressed
  });

  final String answerText; // Variable initilization 
  final void Function() onTap;

  @override
  Widget build(BuildContext context) { 
    return ElevatedButton( // the elevated button is widget that is elevated above the background 
      onPressed: onTap,    // when the button is pressed the ontap function is called.
      style: ElevatedButton.styleFrom(   // customizes the appearance of the button.
        padding: const EdgeInsets.symmetric(  // properties for that button 
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text( 
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
