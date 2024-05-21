import 'package:flutter/material.dart';
import 'package:okoa/core/presentation/components/avatar.dart';
import 'package:okoa/features/feature_auth/domain/model/okoa_user.dart';

class SosPartnerContentPartnerCard extends StatelessWidget {

  final OkoaUser partner;

  const SosPartnerContentPartnerCard({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColorLight
        ),
        child: Row(
          children: [
            //  avatar
            Avatar(avatarUrl: partner.avatarUrl, size: const Size(35, 35)),
            const SizedBox(width: 16),
            Text(partner.userName, style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
      ),
    );
  }
}
