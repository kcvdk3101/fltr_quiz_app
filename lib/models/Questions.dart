class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "What is Flutter ?",
    "options": ['Android Development Kit', 'IOS Development Kit', 'Web Development Kit', 'SDK to build app'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Which programing language is used by Flutter ?",
    "options": ['Java', 'Dart', 'Kotlin', 'Ruby'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Who created Dart programing language ?",
    "options": ['Lars Bak & Kasper Lund', 'Brendan Eich', 'Bjarne Stroustrup', 'Jeremy Ashkenas'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Flutter is mainly optimized for 2D mobile apps that can run on ?",
    "options": ['Android', 'iOS', 'Both 1 and 2', 'None of the above'],
    "answer_index": 2,
  },
  {
    "id": 7,
    "question": "A widget that allows us to refresh the screen is called a ______",
    "options": ['Stateless widgets', 'Stateful widget', 'Statebuild widget', 'All of the above'],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "The examples of the Stateless widget are ?",
    "options": ['Text', 'Row', 'Column', 'All of the above'],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question": "pubspec.yaml file does not contain ?",
    "options": ['Project general settings', 'Project dependencies', 'Project language', 'Project assets'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Which of the following are the advantages of Flutter ?",
    "options": ['Cross-platform Development', 'Faster Development', 'Minimal code', 'All of the above'],
    "answer_index": 3,
  },
];
