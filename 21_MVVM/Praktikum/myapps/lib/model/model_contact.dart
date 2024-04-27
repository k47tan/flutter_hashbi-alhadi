class ContactModel {
  final String title;
  final String subtitle;
  final String date;
  final String color;
  final String? file;

  ContactModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
    this.file,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      title: json['title'],
      subtitle: json['subtitle'],
      date: json['date'],
      color: json['color'],
      file: json['file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'date': date,
      'color': color,
      'file': file,
    };
  }

  ContactModel copyWith(
      {String? title,
      String? subtitle,
      String? date,
      String? color,
      String? file}) {
    return ContactModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      date: date ?? this.date,
      color: color ?? this.color,
      file: file ?? this.file,
    );
  }
}
