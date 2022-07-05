class DetailsModel {
  DetailsModel({
      double? aspectRatio,
    double? height,
      dynamic iso6391, 
      String? filePath, 
      double? voteAverage, 
      int? voteCount,
    double? width,}){
    _aspectRatio = aspectRatio;
    _height = height;
    _iso6391 = iso6391;
    _filePath = filePath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _width = width;
}

  DetailsModel.fromJson(dynamic json) {
    _aspectRatio = double.parse( (json['aspect_ratio']??'0').toString());
    _height = double.parse(( json['height']??'0').toString());
    _iso6391 = json['iso_639_1']??'';
    _filePath = json['file_path']??'';
    _voteAverage = double.parse(( json['vote_average']??'0').toString());
    _voteCount = json['vote_count']??0;
    _width =double.parse( (json['width']??'0').toString());
  }
  double? _aspectRatio;
  double? _height;
  dynamic _iso6391;
  String? _filePath;
  double? _voteAverage;
  int? _voteCount;
  double? _width;

  double? get aspectRatio => _aspectRatio;
  double? get height => _height;
  dynamic get iso6391 => _iso6391;
  String? get filePath => _filePath;
  double? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;
  double? get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aspect_ratio'] = _aspectRatio;
    map['height'] = _height;
    map['iso_639_1'] = _iso6391;
    map['file_path'] = _filePath;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    map['width'] = _width;
    return map;
  }

}