class GenericUserModel {
  final String? id;
  final String? name;
  final String? userName;
  final String? image;
  final bool? isVerified;
  final dynamic order;
  final dynamic experience;
  final dynamic role;

  GenericUserModel({
    this.id,
    this.name,
    this.userName,
    this.image,
    this.isVerified,
    this.order,
    this.experience,
    this.role
  });

  GenericUserModel copyWith({
    String? id,
    String? name,
    String? userName,
    String? image,
    bool? isVerified,
    dynamic order,
    dynamic experience,
    dynamic role
  }) =>
      GenericUserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        image: image ?? this.image,
        isVerified: isVerified ?? this.isVerified,
        order: order ?? this.order,
        experience: experience ?? this.experience,
        role: role ?? this.role,
      );

  factory GenericUserModel.fromJson(Map<String, dynamic> json) => GenericUserModel(
    id: json["id"] ?? json["_id"],
    name: json["first_name"] !=null ?  (json["first_name"] ?? ""+json["last_name"] ?? "") : "",
    image: json["image"] ?? json["profile_image"],
    order: json["order"] ?? "",
    experience: json["experience"] ?? "",
    isVerified: json["is_verified"],
    role: json["role"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}