void main() {
  var character = {
    'name': 'Ratatast the Smelly',
    'strength': 'weak',
    'intelligence': 'brilliant',
    'dexterity': 'clumsy'
  };

  for (var value in character.values) print('$value');
}
