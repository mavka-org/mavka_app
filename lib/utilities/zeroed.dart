String getZeroed(int num, int max) {
  final zeros = max.toString().length - num.toString().length;
  var str = num.toString();

  for (var i = 0; i < zeros; i++) {
    str = '0$str';
  }

  return str;
}
