const String getUsersEndpoint = 'https://api.github.com/users';
const int perPage = 20;

const String token = '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';
const Map<String, String> headers = {
  'Content-Type': "application/json",
  'Authorization': 'bearer ${token}'
};