void main() {
  var passengers = {'Raunaq', 'Jean', 'Eric', 'Yogesh', 'Sally'};
  var vegetarian = {'Raunaq', 'Eric'};
  var sickPassengers = passengers.difference(vegetarian);

  print('People who ate fish:');
  for (var sickPassenger in sickPassengers) print('$sickPassenger');
}
