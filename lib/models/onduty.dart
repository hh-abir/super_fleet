import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnDuty {
  final bool onduty;
  final String currentMeter;

  OnDuty({
    required this.onduty,
    required this.currentMeter,
  });

  factory OnDuty.fromJson(Map<String, dynamic> json) {
    return OnDuty(
      onduty: json['onduty'],
      currentMeter: json['currentMeter'],
    );
  }
}

const jsonString = ''' 
[
  {
    "onduty": true,
    "currentMeter": "12345"
  }
]
''';

final onDutyList = FutureProvider<List<OnDuty>>((ref) async {
  final List<OnDuty> duty = (jsonDecode(jsonString) as List)
      .map((json) => OnDuty.fromJson(json))
      .toList();
  return duty;
});

class OnDutyNotifier extends StateNotifier<List<OnDuty>> {
  OnDutyNotifier(List<OnDuty> initialData) : super(initialData);

  void updateOnDutyList(List<OnDuty> newList) {
    state = newList;
  }
}

final onDutyProvider =
    StateNotifierProvider<OnDutyNotifier, List<OnDuty>>((ref) {
  final asyncValue = ref.watch(onDutyList);

  List<OnDuty> initialData = [OnDuty(onduty: false, currentMeter: "23")];
  if (asyncValue is AsyncData<List<OnDuty>>) {
    initialData = asyncValue.value;
  }

  return OnDutyNotifier(initialData);
});
