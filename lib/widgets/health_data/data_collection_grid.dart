import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:capsula_flutter/models/health_data_model.dart';

/// 数据采集网格组件
class DataCollectionGrid extends StatelessWidget {
  final Function(DataCollectionMethod) onMethodTap;

  const DataCollectionGrid({super.key, required this.onMethodTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: DataCollectionMethod.methods.length,
      itemBuilder: (context, index) {
        final method = DataCollectionMethod.methods[index];
        return _CollectionMethodCard(
          method: method,
          onTap: () => onMethodTap(method),
        );
      },
    );
  }
}

/// 单个采集方式卡片
class _CollectionMethodCard extends StatelessWidget {
  final DataCollectionMethod method;
  final VoidCallback onTap;

  const _CollectionMethodCard({required this.method, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForMethod(method.icon),
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              method.title,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              method.description,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForMethod(String icon) {
    switch (icon) {
      case 'camera':
        return Iconsax.camera;
      case 'upload':
        return Iconsax.document_upload;
      case 'keyboard':
        return Iconsax.keyboard;
      case 'bluetooth':
        return Iconsax.bluetooth;
      case 'microphone':
        return Iconsax.microphone;
      default:
        return Iconsax.add;
    }
  }
}
