class User {
  final String userName;
  final int id;
  final String avatarUrl;
  final String type;

  User({
    required this.userName,
    required this.id,
    required this.avatarUrl,
    required this.type
  });
  
  factory User.fromMap(dynamic data){
    return User(
        userName: data['login'],
        id: data['id'],
        avatarUrl: data['avatar_url'],
        type: data['type']
    );
  }
}

