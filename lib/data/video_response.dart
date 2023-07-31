class VideoResponse {
  final int? page;
  final int? perPage;
  final List<VideoEntity>? videos;
  final int? totalResults;
  final String? nextPage;
  final String? prevPage;
  final String? url;

  VideoResponse({
    this.page,
    this.perPage,
    this.videos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
    this.url,
  });

  VideoResponse copyWith({
    int? page,
    int? perPage,
    List<VideoEntity>? videos,
    int? totalResults,
    String? nextPage,
    String? prevPage,
    String? url,
  }) =>
      VideoResponse(
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        videos: videos ?? this.videos,
        totalResults: totalResults ?? this.totalResults,
        nextPage: nextPage ?? this.nextPage,
        prevPage: prevPage ?? this.prevPage,
        url: url ?? this.url,
      );

  factory VideoResponse.fromJson(Map<String, dynamic> json) => VideoResponse(
    page: json["page"],
    perPage: json["per_page"],
    videos: json["videos"] == null ? [] : List<VideoEntity>.from(json["videos"]!.map((x) => VideoEntity.fromJson(x))),
    totalResults: json["total_results"],
    nextPage: json["next_page"],
    prevPage: json["prev_page"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x.toJson())),
    "total_results": totalResults,
    "next_page": nextPage,
    "prev_page": prevPage,
    "url": url,
  };
}

class VideoEntity {
  final int? id;
  final int? width;
  final int? height;
  final int? duration;
  final dynamic fullRes;
  final List<dynamic>? tags;
  final String? url;
  final String? image;
  final dynamic avgColor;
  final User? user;
  final List<VideoFile>? videoFiles;
  final List<VideoPicture>? videoPictures;

  VideoEntity({
    this.id,
    this.width,
    this.height,
    this.duration,
    this.fullRes,
    this.tags,
    this.url,
    this.image,
    this.avgColor,
    this.user,
    this.videoFiles,
    this.videoPictures,
  });

  VideoEntity copyWith({
    int? id,
    int? width,
    int? height,
    int? duration,
    dynamic fullRes,
    List<dynamic>? tags,
    String? url,
    String? image,
    dynamic avgColor,
    User? user,
    List<VideoFile>? videoFiles,
    List<VideoPicture>? videoPictures,
  }) =>
      VideoEntity(
        id: id ?? this.id,
        width: width ?? this.width,
        height: height ?? this.height,
        duration: duration ?? this.duration,
        fullRes: fullRes ?? this.fullRes,
        tags: tags ?? this.tags,
        url: url ?? this.url,
        image: image ?? this.image,
        avgColor: avgColor ?? this.avgColor,
        user: user ?? this.user,
        videoFiles: videoFiles ?? this.videoFiles,
        videoPictures: videoPictures ?? this.videoPictures,
      );

  factory VideoEntity.fromJson(Map<String, dynamic> json) => VideoEntity(
    id: json["id"],
    width: json["width"],
    height: json["height"],
    duration: json["duration"],
    fullRes: json["full_res"],
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    url: json["url"],
    image: json["image"],
    avgColor: json["avg_color"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    videoFiles: json["video_files"] == null ? [] : List<VideoFile>.from(json["video_files"]!.map((x) => VideoFile.fromJson(x))),
    videoPictures: json["video_pictures"] == null ? [] : List<VideoPicture>.from(json["video_pictures"]!.map((x) => VideoPicture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "width": width,
    "height": height,
    "duration": duration,
    "full_res": fullRes,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "url": url,
    "image": image,
    "avg_color": avgColor,
    "user": user?.toJson(),
    "video_files": videoFiles == null ? [] : List<dynamic>.from(videoFiles!.map((x) => x.toJson())),
    "video_pictures": videoPictures == null ? [] : List<dynamic>.from(videoPictures!.map((x) => x.toJson())),
  };
}

class User {
  final int? id;
  final String? name;
  final String? url;

  User({
    this.id,
    this.name,
    this.url,
  });

  User copyWith({
    int? id,
    String? name,
    String? url,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
  };
}

class VideoFile {
  final int? id;
  final String? quality;
  final String? fileType;
  final int? width;
  final int? height;
  final double? fps;
  final String? link;

  VideoFile({
    this.id,
    this.quality,
    this.fileType,
    this.width,
    this.height,
    this.fps,
    this.link,
  });

  VideoFile copyWith({
    int? id,
    String? quality,
    String? fileType,
    int? width,
    int? height,
    double? fps,
    String? link,
  }) =>
      VideoFile(
        id: id ?? this.id,
        quality: quality ?? this.quality,
        fileType: fileType ?? this.fileType,
        width: width ?? this.width,
        height: height ?? this.height,
        fps: fps ?? this.fps,
        link: link ?? this.link,
      );

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
    id: json["id"],
    quality: json["quality"],
    fileType: json["file_type"],
    width: json["width"],
    height: json["height"],
    fps: json["fps"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quality": quality,
    "file_type": fileType,
    "width": width,
    "height": height,
    "fps": fps,
    "link": link,
  };
}

class VideoPicture {
  final int? id;
  final int? nr;
  final String? picture;

  VideoPicture({
    this.id,
    this.nr,
    this.picture,
  });

  VideoPicture copyWith({
    int? id,
    int? nr,
    String? picture,
  }) =>
      VideoPicture(
        id: id ?? this.id,
        nr: nr ?? this.nr,
        picture: picture ?? this.picture,
      );

  factory VideoPicture.fromJson(Map<String, dynamic> json) => VideoPicture(
    id: json["id"],
    nr: json["nr"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nr": nr,
    "picture": picture,
  };
}
