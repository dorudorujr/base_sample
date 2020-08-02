abstract class Parameterizable {
  Map<String, dynamic> toJson();
}

/// Query Parameters用
abstract class PathParameterizable extends Parameterizable {
  Map<String, String> queryParameters;
}