import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/cluster_model.dart';
import 'package:http/http.dart' as http;

import '../models/cluster_response.dart';

class ClusterProvider with ChangeNotifier {
  final ClusterResponse _clusterResponse = ClusterResponse(
    success: false,
    message: '',
    data: ClusterModel(
      clusterPurseBalance: 0,
      totalInterestEarned: 0,
      totalOwedByMembers: 0,
      overdueAgents: [],
      clusterName: '',
      clusterRepaymentRate: 0.0,
      clusterRepaymentDay: '',
      dueAgents: [],
    ),
  );

  ClusterResponse get clusterResponse => _clusterResponse;

  final baseUrl = 'https://moni-staging-1.vercel.app/api/loans';

  Future<void> addClusterModel() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final clusterModel =
          ClusterModel.fromMap(responseData['data'] as Map<String, dynamic>);
      _clusterResponse.data = clusterModel;
      _clusterResponse.success = true;
      _clusterResponse.message = 'ClusterModel fetched successfully';
      print(_clusterResponse.data.clusterPurseBalance);
      notifyListeners();
    } catch (error) {
      _clusterResponse.success = false;
      _clusterResponse.message = 'ClusterModel fetch failed';
      notifyListeners();
    }
  }
}

// {
//   "rules": {
//     ".read": "auth != null",
//     ".write": "auth != null",
//       "products": {
//         ".indexOn": ["creatorId"]
//       }
//   }
// }
