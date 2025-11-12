import 'package:capsula_flutter/providers/health_data_view/health_data_view_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('HealthDataView provider', () {
    test('exposes default state values', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(healthDataViewProvider);

      expect(state.selectedFilter, 'all');
      expect(state.selectedTag, '全部标签');
      expect(state.searchKeyword, isEmpty);
      expect(state.isListView, isTrue);
    });

    test('state mutations update selected fields', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(healthDataViewProvider.notifier);

      notifier.selectFilter('bp');
      notifier.selectTag('血糖');
      notifier.setSearchKeyword('心率');
      notifier.toggleViewMode();

      final state = container.read(healthDataViewProvider);

      expect(state.selectedFilter, 'bp');
      expect(state.selectedTag, '血糖');
      expect(state.searchKeyword, '心率');
      expect(state.isListView, isFalse);
    });
  });
}
