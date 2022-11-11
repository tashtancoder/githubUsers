const String getUsersEndpoint = 'https://api.github.com/users';
const int perPage = 20;

const String token = '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';
const Map<String, String> headers = {
  'Content-Type': "application/json",
  'Authorization': 'bearer ${token}'
};