abstract class Enum<T> {
  final T value;

  const Enum(this.value);

  @override
  String toString() => value.toString();
}
