extension ListExtension<E> on List<E> {
  List<T> mapIndexed<T>(T Function(E, int) f) {
    var index = 0;
    return map((e) => f(e, index++)).toList();
  }

  bool isSimilar(List<E> other) {
    if (length != other.length) return false;
    for (var i = 0; i < length; i++) {
      if (this[i] != other[i]) return false;
    }
    return true;
  }

  List<E> reverse(bool condition) {
    if (condition) {
      return reversed.toList();
    }
    return this;
  }
}
