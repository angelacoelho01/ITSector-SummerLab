void main() {
  const myAge = 20;
  final String message;

  if (myAge >= 13 && myAge <= 18) {
    message = 'You are a teenager';
  } else {
    message = 'You are not a teenager';
  }

  print('message = $message');

  const anotherMessage = (myAge >= 13 && myAge <= 18)
      ? 'You are a teenager'
      : 'You are not a teenager';

  print('anotherMessage = $anotherMessage');
}
