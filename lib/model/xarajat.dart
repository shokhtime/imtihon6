class Xarajat {
  final int? id;
  final double summa;
  final String category;
  final DateTime time;
  final String description;

  Xarajat(
    this.id,
    this.summa,
    this.category,
    this.time,
    this.description,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'summa': summa,
      'category': category,
      'time': time,
      'comment': description,
    };
  }

  factory Xarajat.fromMap(Map<String, dynamic> map) {
    return Xarajat(
      map['id'],
      map['summa'],
      map['category'],
      map['time'],
      map['description'],
    );
  }
}
