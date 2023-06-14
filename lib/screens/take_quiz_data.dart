class Takequiz {
  final int number;
  final String topic;
  final String Question;
  final String Answer;
  final String Counter;

  Takequiz(this.number, this.topic, this.Question, this.Answer, this.Counter);
}

List<Takequiz> takequiz = [
  Takequiz(1, 'Geo', 'Which city hosted Fifa 22 ?', 'Qatar', '4'),
  Takequiz(
      2, 'History', 'When did Bharat originated in RigVeda Text?', '', '3'),
  Takequiz(3, 'Science ', 'Space Exploration ', 'NASA', '2'),
  Takequiz(4, 'Anatoomy', 'Mention three parts of brain', 'Cerebelleum', '6'),
  Takequiz(
      5, 'Tech', 'When did Apple releases its first product?', '1982', '5'),
];
