class Menu {
  final String id;
  final String title;
  final String desc;
  final String assetName;

  Menu({
    this.id,
    this.title,
    this.desc,
    this.assetName,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      title: json['menu_name'],
      desc: json['menu_description'],
    );
  }
}
