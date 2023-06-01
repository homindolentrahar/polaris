abstract class ListHelper {
  static List<List<T>> getGrouppedList<T>(
      {required List<T> list, int count = 2}) {
    final List<List<T>> grouppedList = [];

    for (var i = 0; i < list.length; i += count) {
      grouppedList.add(
        list.sublist(
          i,
          i + count >= list.length ? list.length : i + count,
        ),
      );
    }

    return grouppedList;
  }
}
