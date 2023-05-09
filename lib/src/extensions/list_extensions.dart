extension ListExtensions<E> on List<E> {
  /// Like Iterable<T>.map but the callback has index as second argument
  /// and the index is start from 0
  /// Grock ForLoop example:
  void forLoop(void Function(E value, int index) f) {
    var index = 0;
    for (int i = 0; i < length; i++) {
      f(elementAt(i), index);
      index++;
    }
  }

  /// Like Iterable<T>.map but the callback has index as second argument
  /// and the index is start from 0
  /// Grock ForLoop example:
  void forLoopReverse(void Function(E value, int index) f) {
    var index = length - 1;
    for (int i = length - 1; i >= 0; i--) {
      f(elementAt(i), index);
      index--;
    }
  }

  List<T> mapIndexed<T>(T Function(E value, int index) f) {
    var i = 0;
    return map((e) => f(e, i++)).toList();
  }

  List<E> seperated(E separator) {
    final newList = <E>[];
    for (var i = 0; i < length; i++) {
      if (i == 0) {
        newList.add(this[i]);
      } else {
        newList.add(separator);
        newList.add(this[i]);
      }
    }
    return newList;
  }

  void whereAdd(bool Function(E e) f, E value) {
    if (f(value)) {
      add(value);
    }
  }

  List<E> seperatedIndexed(E Function(int index) separator) {
    final newList = <E>[];
    for (var i = 0; i < length; i++) {
      if (i == 0) {
        newList.add(this[i]);
      } else {
        newList.add(separator(i));
        newList.add(this[i]);
      }
    }
    return newList;
  }

  List<E> seperatedIndexedValue(E Function(int index, E value) separator) {
    final newList = <E>[];
    for (var i = 0; i < length; i++) {
      if (i == 0) {
        newList.add(this[i]);
      } else {
        newList.add(separator(i, this[i]));
        newList.add(this[i]);
      }
    }
    return newList;
  }

  /// groupBy extension for List
  /// Grock GroupBy
  Map<K, List<E>> groupBy<K>(K Function(E value) f) {
    final map = <K, List<E>>{};
    for (final element in this) {
      final key = f(element);
      map.putIfAbsent(key, () => <E>[]).add(element);
    }
    return map;
  }

  /// groupBy extension for List
  /// Grock GroupBy
  Map<K, List<E>> groupByIndexed<K>(K Function(E value, int index) f) {
    final map = <K, List<E>>{};
    var i = 0;
    for (final element in this) {
      final key = f(element, i++);
      map.putIfAbsent(key, () => <E>[]).add(element);
    }
    return map;
  }

  /// groupBy extension for List
  /// Grock GroupBy
  Map<K, List<E>> groupByIndexedAndWhere<K>(K Function(E value, int index) f) {
    final map = <K, List<E>>{};
    var i = 0;
    for (final element in this) {
      final key = f(element, i++);
      if (key != null) {
        map.putIfAbsent(key, () => <E>[]).add(element);
      }
    }
    return map;
  }

  /// groupBy extension for List
  /// Grock GroupBy
  Map<K, List<E>> groupByIndexedAndWhereNotNull<K>(K Function(E value, int index) f) {
    final map = <K, List<E>>{};
    var i = 0;
    for (final element in this) {
      final key = f(element, i++);
      if (key != null) {
        map.putIfAbsent(key, () => <E>[]).add(element);
      }
    }
    return map;
  }

  /// groupBy extension for List
  /// Grock GroupBy
  Map<K, List<E>> groupByIndexedAndWhereNotNullAndNotEmpty<K>(K Function(E value, int index) f) {
    final map = <K, List<E>>{};
    var i = 0;
    for (final element in this) {
      final key = f(element, i++);
      if (key != null && key.toString().isNotEmpty) {
        map.putIfAbsent(key, () => <E>[]).add(element);
      }
    }
    return map;
  }

  List<E> mapIndexedWhere<T>(T Function(E value, int index) f) {
    var i = 0;
    return map((e) => f(e, i++)).whereType<E>().toList();
  }

  List<E> mapIndexedWhereNotNull<T>(T Function(E value, int index) f) {
    var i = 0;
    return map((e) => f(e, i++)).whereType<E>().where((element) => element != null).toList();
  }

  List<E> mapFiltered<T>(T Function(E value) f) {
    return map((e) => f(e)).whereType<E>().toList();
  }

  List<E> mapFilteredWhereNotNull<T>(T Function(E value) f) {
    return map((e) => f(e)).whereType<E>().where((element) => element != null).toList();
  }

  List<E> reverseList() {
    return reversed.toList();
  }
}
