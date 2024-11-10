/*
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                child: Icon(Icons.home, color: Colors.grey[700]),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kristin Watson',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '(406) 555-0120',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Text(
            'Address :',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '3891 Ranchview Dr. Richardson, California - 62639, USA.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '• Set as a primary location',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 13,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.grey[700]),
                    onPressed: () {
                      // Edit action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red[300]),
                    onPressed: () {
                      // Delete action
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/
