class Dbms {
  final int id; //ID ДЛЯ БАЗЫ ДАННЫХ
  final String name;
  final String desc;
  final String imagePath;

  const Dbms({
    required this.id, // Обязательное поле
    required this.name,
    required this.desc,
    required this.imagePath,
  });
}