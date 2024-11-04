
class QuizQuestion {  // Creation  of class and constructor 
  const QuizQuestion(
    this.text,  // Initializes both text and answer when creating the instance of quiz questions.
    this.answers
    );

  final String text; // Variable declaration and initialization 
  final List<String> answers; // List of strings declared as final 

  List<String> get shuffledAnswers { // To get shuffeled answers but not change the content 
    final shuffledList = List.of(answers); // Creates the list of modified answers but we cannot change the list of answers
    shuffledList.shuffle(); // Shuffles the elements of shuffledList randomly in place.
    return shuffledList; // the method then return shuffeld version of the answers.
  }
}
