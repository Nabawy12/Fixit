import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers_state_mange/settings/settings.dart';


class ServiceTile extends StatelessWidget {
  final IconData icon;
  final String label;

  ServiceTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 23,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
        ),
      ],
    );
  }
}