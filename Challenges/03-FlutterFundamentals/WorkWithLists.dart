void main() {
  const grades = [82, 76, 88, 92];
  var sum = 0;

  for (int i = 0; i < grades.length; i++) {
    sum += grades[i];
  }

  double avg = sum / grades.length;
  print('avg = $avg');
}
