import 'package:the_cat_api/bloc/user_bloc.dart';
import 'package:the_cat_api/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_event.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          userBloc.add(UserLoadEvent());
        }
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is UserLoadedState) {
          IconData icon = Icons.favorite_border;
          return ListView.builder(
              itemCount: state.loadedUser.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    title: GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: SizedBox(
                          width: double.infinity,
                          height: state.loadedUser[index].height.toDouble() /
                              (state.loadedUser[index].width.toDouble() /
                                  MediaQuery.of(context).size.width),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.white24, width: 5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          state.loadedUser[index].url),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                right: 30,
                                child: IconButton(
                                  icon: Icon(
                                    icon,
                                    color: Colors.white54,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    if (icon == Icons.favorite_border) {
                                      print('QWERQWER');
                                      icon = Icons.favorite;
                                    } else {
                                      icon = Icons.favorite_border;
                                    }
                                  },
                                ),
//                                Icon(Icons.favorite_border),
//                                FittedBox(
//                                  fit: BoxFit.scaleDown,
//                                  alignment: Alignment.centerLeft,
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(30),
//                                      color: Colors.white,
//                                    ),
//                                    height: 20,
//                                    width: 75,
//                                    child: Center(
//                                      child: Text(
//                                        '5 коробок',
//                                        style: TextStyle(
//                                            color: Colors.green,
//                                            fontSize: 12,
//                                            fontWeight: FontWeight.bold),
//                                      ),
//                                    ),
//                                  ),
//                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        }

        if (state is UserErrorState) {
          print(state);
          return Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return null;
      },
    );
  }
}
