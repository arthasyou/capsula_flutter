import 'package:flutter/material.dart';

/// 快捷筛选组件
class QuickFilters extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const QuickFilters({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  static const List<Map<String, String>> filters = [
    {'id': 'all', 'label': '全部数据'},
    {'id': '7days', 'label': '最近7天'},
    {'id': 'checkup', 'label': '体检报告'},
    {'id': 'bp', 'label': '血压数据'},
    {'id': 'bs', 'label': '血糖数据'},
    {'id': 'device', 'label': '可穿戴设备'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter['id'];
          return FilterChip(
            label: Text(filter['label']!),
            selected: isSelected,
            onSelected: (selected) => onFilterSelected(filter['id']!),
            backgroundColor: theme.colorScheme.surface,
            selectedColor: theme.colorScheme.primary,
            labelStyle: TextStyle(
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onSurface,
              fontSize: 12,
            ),
          );
        },
      ),
    );
  }
}
