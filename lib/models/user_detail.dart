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
    /*final String login = data['login'];
    final int id = data['id'] ?? 0;
    final String avatarUrl = data['avatar_url'];
    final String email = data['email'] ?? '';
    final String type = data['type'] ?? '';
    final String weblink = data['html_url'];
    final String name = data['name'];
    final String company = data['company'];
    final int publicrepos = data['public_repos'];
    final int followersize = data['followers'];
    final int followingsize = data['following'];
    final DateTime created = DateTime.parse(data['created_at']);
    final DateTime updated = DateTime.parse(data['updated_at']);
    final String location = data['location'];*/
    return UserDetails(
        userName: data['login'],
        id: data['id'],
        avatarUrl: data['avatar_url'] ?? '',
        type: data['type'] ?? '',
        webLink: data['html_url'] ?? '',
        name: data['name'] ?? '',
        company: data['company'] ?? '',
        email: data['email'] ?? '',
        publicRepos: data['public_repos'],
        followersSize: data['followers'],
        followingSize: data['following'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
        location: data['location'] ?? ''
    );
  }
}