const String getUsersEndpoint = 'https://api.github.com/users';
const int perPage = 20;

const String token = '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';
const Map<String, String> headers = {
  'Content-Type': "application/json",
  'Authorization': 'bearer ${token}'
};