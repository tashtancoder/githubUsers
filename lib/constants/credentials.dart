const String getUsersEndpoint = 'https://api.github.com/users';
const int perPage = 20;

const String token = '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';
const Map<String, String> headers = {
  'Content-Type': "application/json",
  'Authorization': 'bearer ${token}'
};