class PersonModel {
  PersonModel({
    bool? adult,
    int? gender,
    int? id,
    List<KnownFor>? knownFor,
    String? knownForDepartment,
    String? name,
    double? popularity,
    String? profilePath,
  }) {
    _adult = adult;
    _gender = gender;
    _id = id.toString();
    _knownFor = knownFor;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _popularity = popularity;
    _profilePath = profilePath;
  }

  PersonModel.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'].toString();
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(KnownFor.fromJson(v));
      });
    }
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
  }

  bool? _adult;
  int? _gender;
  String? _id;
  List<KnownFor>? _knownFor;
  String? _knownForDepartment;
  String? _name;
  double? _popularity;
  String? _profilePath;

  bool? get adult => _adult;

  int? get gender => _gender;

  String? get id => _id;

  List<KnownFor>? get knownFor => _knownFor;

  String? get knownForDepartment => _knownForDepartment;

  String? get name => _name;

  double? get popularity => _popularity;

  String? get profilePath => _profilePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    if (_knownFor != null) {
      map['known_for'] = _knownFor?.map((v) => v.toJson()).toList();
    }
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    return map;
  }
}

class KnownFor {
  KnownFor({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _mediaType = mediaType;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  KnownFor.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    _id = json['id'];
    _mediaType = json['media_type'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'].toDouble();
    _voteCount = json['vote_count'];
  }

  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _mediaType;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;

  bool? get adult => _adult;

  String? get backdropPath => _backdropPath;

  List<int>? get genreIds => _genreIds;

  int? get id => _id;

  String? get mediaType => _mediaType;

  String? get originalLanguage => _originalLanguage;

  String? get originalTitle => _originalTitle;

  String? get overview => _overview;

  String? get posterPath => _posterPath;

  String? get releaseDate => _releaseDate;

  String? get title => _title;

  bool? get video => _video;

  double? get voteAverage => _voteAverage;

  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['media_type'] = _mediaType;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['release_date'] = _releaseDate;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }
}
