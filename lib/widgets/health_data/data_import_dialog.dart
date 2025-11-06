import 'package:flutter/material.dart';
import '../../models/health_data_model.dart';

/// 数据导入对话框
class DataImportDialog extends StatelessWidget {
  final DataCollectionMethod? method;
  final VoidCallback? onSave;

  const DataImportDialog({super.key, this.method, this.onSave});

  /// 显示对话框的静态方法
  static Future<void> show(
    BuildContext context, {
    DataCollectionMethod? method,
    VoidCallback? onSave,
  }) {
    return showDialog(
      context: context,
      builder: (context) => DataImportDialog(method: method, onSave: onSave),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(method != null ? '${method!.title} - 数据导入' : '数据导入'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNameField(),
            const SizedBox(height: 16),
            _buildDateTimeFields(),
            const SizedBox(height: 16),
            _buildSourceField(),
            const SizedBox(height: 16),
            _buildNotesField(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
        ElevatedButton(
          onPressed: () {
            onSave?.call();
            Navigator.pop(context);
          },
          child: const Text('保存'),
        ),
      ],
    );
  }

  Widget _buildNameField() {
    return const TextField(
      decoration: InputDecoration(
        labelText: '数据名称',
        hintText: '例如：2023年6月血压测量',
      ),
    );
  }

  Widget _buildDateTimeFields() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(labelText: '数据日期'),
            onTap: () async {
              // TODO: 日期选择器
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(labelText: '数据时间'),
            onTap: () async {
              // TODO: 时间选择器
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSourceField() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: '数据来源'),
      items: const [
        DropdownMenuItem(value: 'camera', child: Text('拍照')),
        DropdownMenuItem(value: 'upload', child: Text('文件上传')),
        DropdownMenuItem(value: 'manual', child: Text('手动输入')),
        DropdownMenuItem(value: 'device', child: Text('设备同步')),
        DropdownMenuItem(value: 'voice', child: Text('语音录入')),
      ],
      onChanged: (value) {},
    );
  }

  Widget _buildNotesField() {
    return const TextField(
      decoration: InputDecoration(labelText: '备注说明'),
      maxLines: 3,
    );
  }
}
