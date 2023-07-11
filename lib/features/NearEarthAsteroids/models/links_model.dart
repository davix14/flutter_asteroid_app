
class LinksModel {
  LinksModel({
    required this.next,
    required this.previous,
    required this.self,
  });

  final String? previous;
  final String? next;
  final String self;

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      next: json['next'],
      previous: json['previous'],
      self: json['self'],
    );
  }

  @override
  String toString() {
    return 'LinksModel{previous: $previous, next: $next, self: $self}';
  }
}
