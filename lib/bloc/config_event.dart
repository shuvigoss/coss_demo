import 'package:coss_demo/pages/models/config_item.dart';
import 'package:equatable/equatable.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends ConfigEvent {}

class Add extends ConfigEvent {
  final ConfigItem item;

  const Add(this.item);
}

class Delete extends ConfigEvent {
  final String name;

  const Delete(this.name);
}
