class ListItem {
  List<String> repo = ['a', 'b', 'c', 'aa', 'bb', 'abc'];
  List<String> getItems(String searchItem){
    List<String> result = [];

    for (String element in repo) {
      if (element.contains(searchItem)) {
        result.add(element);
      }
    }

    return result;
  }

  get getAll => repo;
}