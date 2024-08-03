// header.dart

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String userName;
  final String? avatarUrl;
  final VoidCallback onNotificationPressed;

  const Header({
    Key? key,
    required this.userName,
    this.avatarUrl,
    required this.onNotificationPressed,
  }) : super(key: key);

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    if (nameParts.length > 0) initials += nameParts[0][0];
    if (nameParts.length > 1) initials += nameParts[1][0];
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              avatarUrl != null && avatarUrl!.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl!),
                      radius: 20.0,
                    )
                  : CircleAvatar(
                      radius: 20.0,
                      child: Text(
                        getInitials(userName),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              SizedBox(width: 8.0),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: onNotificationPressed,
          ),
        ],
      ),
    );
  }
}
