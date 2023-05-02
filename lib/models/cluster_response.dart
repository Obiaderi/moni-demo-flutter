import 'cluster_model.dart';

class ClusterResponse {
  late bool success;
  late String message;
  late ClusterModel data;

  ClusterResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}
