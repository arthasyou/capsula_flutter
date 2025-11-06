import 'package:flutter/material.dart';

/// 标签筛选组件
class TagFilters extends StatelessWidget {
  final String selectedTag;
  final Function(String) onTagSelected;

  const TagFilters({
    super.key,
    required this.selectedTag,
    required this.onTagSelected,
  });

  static const List<String> tags = [
    '全部标签',
    '血压',
    '血糖',
    '心率',
    '体检',
    '日常监测',
    '用药',
    '可穿戴设备',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '按标签筛选',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags.map((tag) {
            final isSelected = selectedTag == tag;
            return ChoiceChip(
              label: Text(tag),
              selected: isSelected,
              onSelected: (selected) => onTagSelected(tag),
              backgroundColor:
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              selectedColor: theme.colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
                fontSize: 12,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
