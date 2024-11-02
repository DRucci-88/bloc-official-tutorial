class CounterRepository {
  int _counter = 0;

  int get counter => _counter;

  Future<int> increment(int value) async {
    await Future.delayed(Duration(seconds: value));
    _counter += value;
    return counter;
  }

  Future<int> decrement(int value) async {
    await Future.delayed(Duration(seconds: value));
    _counter -= value;
    return counter;
  }
}
