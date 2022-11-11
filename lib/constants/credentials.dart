const String getUsersEndpoint = 'https://api.github.com/users';
const int perPage = 20;

const String token = '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';
const Map<String, String> headers = {
  'Content-Type': "application/json",
  'Authorization': 'bearer ${token}'
};