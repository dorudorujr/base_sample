import 'package:base_sample/model/entities/entities.dart';

abstract class Parameterizable {
  Map<String, dynamic> toJson();
}

/// Query Parameters用
abstract class PathParameterizable extends Parameterizable {
  PathParameterizable({required this.queryParameters});

  Map<String, String> queryParameters;
}