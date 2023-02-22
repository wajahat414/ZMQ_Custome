import 'dart:collection';
import 'dart:typed_data';

class ZFrame {
  /// The payload that was received or is to be sent
  final Uint8List payload;

  /// Is this frame part of an unfinished multi-part message?
  final bool hasMore;

  ZFrame(this.payload, {this.hasMore = false});

  @override
  String toString() => 'ZFrame[$payload]';
}

/// ZMessage provides a list-like container interface,
/// with methods to work with the overall container. ZMessage messages are
/// composed of zero or more ZFrame objects.
// typedef ZMessage = Queue<ZFrame>;
class ZMessage implements Queue<ZFrame> {
  final DoubleLinkedQueue<ZFrame> frames = DoubleLinkedQueue();

  @override
  Iterator<ZFrame> get iterator => frames.iterator;

  @override
  void add(ZFrame value) => frames.add(value);

  @override
  void addAll(Iterable<ZFrame> iterable) => frames.addAll(iterable);

  @override
  void addFirst(ZFrame value) => frames.addFirst(value);

  @override
  void addLast(ZFrame value) => frames.addLast(value);

  @override
  void clear() => frames.clear();

  @override
  bool remove(Object? value) => frames.remove(value);

  @override
  ZFrame removeFirst() => frames.removeFirst();

  @override
  ZFrame removeLast() => frames.removeLast();

  @override
  void removeWhere(bool Function(ZFrame element) test) =>
      frames.removeWhere(test);

  @override
  void retainWhere(bool Function(ZFrame element) test) =>
      frames.retainWhere(test);

  @override
  bool any(bool Function(ZFrame element) test) => frames.any(test);

  @override
  Queue<R> cast<R>() => frames.cast<R>();

  @override
  bool contains(Object? element) => frames.contains(element);

  @override
  ZFrame elementAt(int index) => frames.elementAt(index);

  @override
  bool every(bool Function(ZFrame element) test) => frames.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(ZFrame element) toElements) =>
      frames.expand(toElements);

  @override
  ZFrame get first => frames.first;

  @override
  ZFrame firstWhere(bool Function(ZFrame element) test,
          {ZFrame Function()? orElse}) =>
      frames.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue,
          T Function(T previousValue, ZFrame element) combine) =>
      frames.fold(initialValue, combine);

  @override
  Iterable<ZFrame> followedBy(Iterable<ZFrame> other) =>
      frames.followedBy(other);

  @override
  void forEach(void Function(ZFrame element) action) => frames.forEach(action);

  @override
  bool get isEmpty => frames.isEmpty;

  @override
  bool get isNotEmpty => frames.isNotEmpty;

  @override
  String join([String separator = '']) => frames.join(separator);

  @override
  ZFrame get last => frames.last;

  @override
  ZFrame lastWhere(bool Function(ZFrame element) test,
          {ZFrame Function()? orElse}) =>
      frames.lastWhere(test, orElse: orElse);

  @override
  int get length => frames.length;

  @override
  Iterable<T> map<T>(T Function(ZFrame e) toElement) => frames.map(toElement);

  @override
  ZFrame reduce(ZFrame Function(ZFrame value, ZFrame element) combine) =>
      frames.reduce(combine);

  @override
  ZFrame get single => frames.single;

  @override
  ZFrame singleWhere(bool Function(ZFrame element) test,
          {ZFrame Function()? orElse}) =>
      frames.singleWhere(test, orElse: orElse);

  @override
  Iterable<ZFrame> skip(int count) => frames.skip(count);

  @override
  Iterable<ZFrame> skipWhile(bool Function(ZFrame value) test) =>
      frames.skipWhile(test);

  @override
  Iterable<ZFrame> take(int count) => frames.take(count);

  @override
  Iterable<ZFrame> takeWhile(bool Function(ZFrame value) test) =>
      frames.takeWhile(test);

  @override
  List<ZFrame> toList({bool growable = true}) =>
      frames.toList(growable: growable);

  @override
  Set<ZFrame> toSet() => frames.toSet();

  @override
  Iterable<ZFrame> where(bool Function(ZFrame element) test) =>
      frames.where(test);

  @override
  Iterable<T> whereType<T>() => frames.whereType<T>();

  @override
  String toString() =>
      IterableBase.iterableToFullString(this, 'ZMessage[', ']');
}
