class Menu {
  final String id;
  final String title;
  final String desc;

  Menu({
    this.id,
    this.title,
    this.desc,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      title: json['menu_name'],
      desc: json['menu_description'],
    );
  }
}
