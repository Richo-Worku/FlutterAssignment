// ignore_for_file: public_member_api_docs, sort_constructors_first

class DataLength {
  late final int length;
  late final bool isLoading;

  // final int left;
  DataLength({this.length = 0, this.isLoading = true
      // this.left = 0,
      });

  DataLength copyWith({
    int? length,
    //  int? left,
    bool? isLoading,
  }) {
    return DataLength(
        length: length ?? this.length, isLoading: isLoading ?? this.isLoading);
  }

  @override
  bool operator ==(covariant DataLength other) {
    if (identical(this, other)) return true;

    return other.length == length && other.length == length;
  }

  @override
  int get hashCode => length.hashCode;
}
