main() {
  for (var i = 0; i < 5; i++) {
    print(i);
  }

  var names = ['why', 'kobe', 'curry'];
  for (var name in names) {
    print(name);
  }


  var direction = 'east';
  switch (direction) {
    case 'east':
      print('东面');
      break;
    case 'south':
      print('南面');
      break;
    case 'west':
      print('西面');
      break;
    case 'north':
      print('北面');
      break;
    default:
      print('其他方向');
  }

}