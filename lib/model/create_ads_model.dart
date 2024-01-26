class CreateAdsModel {
  const CreateAdsModel({
    this.title,
    this.description,
    this.lat,
    this.lon,
  });

  final String? title;
  final String? description;
  final double? lat;
  final double? lon;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'description': description,
    'lon': lon,
    'lat': lat,
  };
}