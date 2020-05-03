
import 'package:AS01/src/repository/user_repository.dart';
import 'package:AS01/src/ui/register/register_screen.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('CREATE AN ACCOUNT',style: TextStyle(color: Colors.deepPurpleAccent),),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RegisterScreen(userRepository: _userRepository);
        }));
      },
    );
  }
}
