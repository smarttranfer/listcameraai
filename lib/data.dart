class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Marcus Ng',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    title: 'Camera 1',
    thumbnailUrl: 'rtsp://admin:Admin123@cmhggtpthminhkhai.vncctv.info:554/cam/realmonitor?channel=2&subtype=0',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    id: 'vrPk6LB9bjo',
    title:
    'Camera 2',
    thumbnailUrl: 'rtsp://admin:Admin123@cmhggtpthminhkhai.vncctv.info:554/cam/realmonitor?channel=2&subtype=0',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'vrPk6LB9bjo',
    title:
    'Camera 3',
    thumbnailUrl: 'rtsp://admin:Admin123@cmhggtpthminhkhai.vncctv.info:554/cam/realmonitor?channel=2&subtype=0',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'vrPk6LB9bjo',
    title:
        'Camera 4',
    thumbnailUrl: 'rtsp://vmstayninh.hcdt.vn:3444/7e44b4e6-e518-4498-85d1-c98e5a9a5160?username=admin&password=admin',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    title: 'Camera 5',
    thumbnailUrl: 'rtsp://vmstayninh.hcdt.vn:3444/7e44b4e6-e518-4498-85d1-c98e5a9a5160?username=admin&password=admin',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];


