class FavItemModel {
  final int id;
  final String userId;
  final String imageId;
  final String subId;
  final DateTime createdAt;
  final ImageModel image;

  FavItemModel({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
  });

  factory FavItemModel.fromJson(Map<String, dynamic> json) {
    return FavItemModel(
      id: json['id'],
      userId: json['user_id'],
      imageId: json['image_id'],
      subId: json['sub_id'],
      createdAt: DateTime.parse(json['created_at']),
      image: ImageModel.fromJson(json['image']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'sub_id': 'my-user-1234',
    };
  }

  factory FavItemModel.fromPlaceHolder() {
    return FavItemModel(
      id: 0,
      userId: '',
      imageId: '',
      subId: '',
      createdAt: DateTime.now(),
      image: ImageModel(id: '', url: ''),
    );
  }
}

class ImageModel {
  final String id;
  final String url;

  ImageModel({
    required this.id,
    required this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['url'],
    );
  }
}
