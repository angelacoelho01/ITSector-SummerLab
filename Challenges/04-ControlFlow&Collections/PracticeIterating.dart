void main() {
  var words = ['This', 'space', 'for', 'rent'];
  var sentence = '';

  for (var word in words) sentence += '$word ';

  print('sentence = $sentence');

  var anotherSentence = ' ';

  for (int i = 0; i < words.length; i++) anotherSentence += '${words[i]} ';

  print('anotherSentence = $anotherSentence');
}
