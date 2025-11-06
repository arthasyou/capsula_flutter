import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../models/health_data_model.dart';
import '../../widgets/health_data/page_header.dart';
import '../../widgets/health_data/data_collection_grid.dart';
import '../../widgets/health_data/quick_filters.dart';
import '../../widgets/health_data/tag_filters.dart';
import '../../widgets/health_data/health_data_card.dart';
import '../../widgets/health_data/data_import_dialog.dart';

@RoutePage()
class HealthDataPage extends StatefulWidget {
  const HealthDataPage({super.key});

  @override
  State<HealthDataPage> createState() => _HealthDataPageState();
}

class _HealthDataPageState extends State<HealthDataPage> {
  String _selectedFilter = 'all';
  String _selectedTag = 'all';
  bool _isListView = true;

  // 模拟数据
  final List<HealthDataRecord> _mockData = [
    HealthDataRecord(
      id: '1',
      type: HealthDataType.bloodPressure,
      content: '收缩压: 120 mmHg\n舒张压: 80 mmHg',
      dateTime: DateTime(2023, 6, 15, 8, 30),
      source: DataSource.device,
      tags: const [
        HealthTag(id: '1', name: '血压'),
        HealthTag(id: '2', name: '日常监测'),
      ],
      notes: '欧姆龙血压计',
    ),
    HealthDataRecord(
      id: '2',
      type: HealthDataType.bloodSugar,
      content: '空腹血糖: 5.6 mmol/L',
      dateTime: DateTime(2023, 6, 15, 7, 15),
      source: DataSource.device,
      tags: const [
        HealthTag(id: '3', name: '血糖'),
        HealthTag(id: '2', name: '日常监测'),
      ],
      notes: '三诺血糖仪',
    ),
    HealthDataRecord(
      id: '3',
      type: HealthDataType.checkup,
      content: '年度体检报告（2023）',
      dateTime: DateTime(2023, 5, 20, 10, 0),
      source: DataSource.upload,
      tags: const [
        HealthTag(id: '4', name: '体检'),
        HealthTag(id: '5', name: '年度'),
      ],
    ),
    HealthDataRecord(
      id: '4',
      type: HealthDataType.heartRate,
      content: '静息心率: 72 次/分',
      dateTime: DateTime(2023, 6, 14, 22, 0),
      source: DataSource.device,
      tags: const [
        HealthTag(id: '6', name: '心率'),
        HealthTag(id: '7', name: '可穿戴设备'),
      ],
      notes: 'Apple Watch',
    ),
    HealthDataRecord(
      id: '5',
      type: HealthDataType.medication,
      content: '药物: 阿司匹林\n剂量: 100mg',
      dateTime: DateTime(2023, 6, 14, 19, 30),
      source: DataSource.manual,
      tags: const [
        HealthTag(id: '8', name: '用药'),
        HealthTag(id: '9', name: '日常用药'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 页面标题
          const SliverToBoxAdapter(
            child: PageHeader(
              title: '我的健康数据',
              subtitle: '全方位记录和管理您的健康信息',
            ),
          ),

          // 数据采集区
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.add_circle,
                        color: theme.colorScheme.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '数据采集',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DataCollectionGrid(
                    onMethodTap: (method) {
                      DataImportDialog.show(
                        context,
                        method: method,
                        onSave: () {
                          // TODO: 保存数据
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // 数据管理区
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Iconsax.menu_board,
                            color: theme.colorScheme.primary,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '数据管理',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Iconsax.search_normal),
                            onPressed: () {
                              // TODO: 实现搜索功能
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              _isListView ? Iconsax.element_3 : Iconsax.menu,
                            ),
                            onPressed: () {
                              setState(() {
                                _isListView = !_isListView;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  QuickFilters(
                    selectedFilter: _selectedFilter,
                    onFilterSelected: (filter) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TagFilters(
                    selectedTag: _selectedTag,
                    onTagSelected: (tag) {
                      setState(() {
                        _selectedTag = tag;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // 数据列表
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final record = _mockData[index];
                  return HealthDataCard(
                    record: record,
                    onTap: () {
                      // TODO: 查看详情
                    },
                    onEdit: () {
                      // TODO: 编辑
                    },
                    onView: () {
                      // TODO: 查看
                    },
                  );
                },
                childCount: _mockData.length,
              ),
            ),
          ),

          // 底部间距
          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          DataImportDialog.show(
            context,
            onSave: () {
              // TODO: 保存数据
            },
          );
        },
        icon: const Icon(Iconsax.add),
        label: const Text('添加数据'),
      ),
    );
  }
}
