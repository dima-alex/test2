import 'package:the_cat_api/models/user.dart';
import 'package:the_cat_api/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<Url>> getAllUsers() => _usersProvider.getUser();
}
