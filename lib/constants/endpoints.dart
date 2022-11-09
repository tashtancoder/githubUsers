const String getUsersEndpoint = 'https://api.github.com/users';

const String token = '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';
const Map<String, String> headers = {
  'Content-Type': "application/json",
  'Authorization': 'bearer ${token}'
};