import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/user.dart';
import '../../../../domain/repositories/account_repository.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  User? _user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _init(),
    );
  }

  Future<void> _init() async {
    final user = await context.read<AccountRepository>().getProfile();
    if (mounted) {
      setState(() {
        _user = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _user != null
            ? Column(
                children: [
                  const Text('Account'),
                  Text('ID: ${_user!.id}'),
                  Text('Name: ${_user!.username}'),
                  Text('Age: ${_user!.age}'),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _user = _user!.copyWith(
                          id: 34173,
                          age: 18,
                        );
                      });
                    },
                    child: Image.network(
                      _user!.avatar,
                    ),
                  ),
                  Text('Occupations: \n${_user!.occupations.map((e) => e.name).join(',\n')}'),
                  // Text('Hash: ${_user!.hash}'),
                  // Text('Birthday: ${_user!.birthday}'),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
