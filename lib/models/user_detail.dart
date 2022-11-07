class UserDetails {
  final String userName;
  final int id;
  final String avatarUrl;
  final String type;
  final String webLink;
  final String name;
  final String company;
  final String email;
  final int publicRepos;
  final int followersSize;
  final int followingSize;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String location;
  UserDetails({
    required this.userName,
    required this.id,
    required this.avatarUrl,
    required this.type,
    required this.webLink,
    required this.name,
    required this.company,
    required this.email,
    required this.publicRepos,
    required this.followersSize,
    required this.followingSize,
    required this.createdAt,
    required this.updatedAt,
    required this.location
  });

  factory UserDetails.fromMap(dynamic data){
    return UserDetails(
        userName: data['login'],
        id: data['id'],
        avatarUrl: data['avatar_url'],
        type: data['type'],
        webLink: data['html_url'],
        name: data['name'],
        company: data['company'],
        email: data['email'],
        publicRepos: data['public_repos'],
        followersSize: data['followers'],
        followingSize: data['following'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
        location: data['location']
    );
  }
}