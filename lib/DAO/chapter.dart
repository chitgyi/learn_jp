class Chapter{
  final String titile;
  final int id;

  Chapter({this.id, this.titile});

  Chapter.fromMap(Map<String, dynamic> map):titile=map['title'],id=map['chId'];
}