class Report {
  String? id;
  String? camera;
  String? startDate;
  String? detectionDate;
  String? detectionTime;
  String? isPhoto;
  String? isVideo;
  String? photo;
  String? video;

  Report({
    this.id,
    this.camera,
    this.startDate,
    this.detectionDate,
    this.detectionTime,
    this.isPhoto,
    this.isVideo,
    this.photo,
    this.video,
  });

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    camera = json['camera'];
    startDate = json['start_date'];
    detectionDate = json['detection_date'];
    detectionTime = json['detection_time'];
    isPhoto = json['is_photo'];
    isVideo = json['is_video'];
    photo = json['photo'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['camera'] = camera;
    data['start_date'] = startDate;
    data['detection_date'] = detectionDate;
    data['detection_time'] = detectionTime;
    data['is_photo'] = isPhoto;
    data['is_video'] = isVideo;
    data['photo'] = photo;
    data['video'] = video;
    return data;
  }
}
