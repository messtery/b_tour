class PariwisataDetailParam {
  int id;
  PariwisataDetailParam(
    this.id,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
