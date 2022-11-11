const String getUsersEndpoint = 'https://api.github.com/users';
const int perPage = 20;

const String token = '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';
const Map<String, String> headers = {
  'Content-Type': "application/json",
  'Authorization': 'bearer ${token}'
};