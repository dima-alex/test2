import 'package:the_cat_api/bloc/user_event.dart';
import 'package:the_cat_api/bloc/user_state.dart';
import 'package:the_cat_api/models/user.dart';
import 'package:the_cat_api/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<Url> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}
