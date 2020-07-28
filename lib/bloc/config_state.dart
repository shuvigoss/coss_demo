import 'package:coss_demo/pages/models/config_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ConfigState extends Equatable {
  const ConfigState();

  @override
  List<Object> get props => [];
}

class InitialConfigState extends ConfigState {
  @override
  List<Object> get props => [];
}

class Loading extends ConfigState {}

class Loaded extends ConfigState {
  final List<ConfigItem> items;

  const Loaded({@required this.items});

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'Loaded { items: ${items.length} }';
}

class Failure extends ConfigState {}
