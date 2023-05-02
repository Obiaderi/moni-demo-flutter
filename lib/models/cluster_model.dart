import 'dart:convert';

class ClusterModel {
  final int clusterPurseBalance;
  final int totalInterestEarned;
  final int totalOwedByMembers;
  final List<dynamic> overdueAgents;
  final String clusterName;
  final double clusterRepaymentRate;
  final String clusterRepaymentDay;
  final List<dynamic> dueAgents;

  ClusterModel({
    required this.clusterPurseBalance,
    required this.totalInterestEarned,
    required this.totalOwedByMembers,
    required this.overdueAgents,
    required this.clusterName,
    required this.clusterRepaymentRate,
    required this.clusterRepaymentDay,
    required this.dueAgents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clusterPurseBalance': clusterPurseBalance,
      'totalInterestEarned': totalInterestEarned,
      'totalOwedByMembers': totalOwedByMembers,
      'overdueAgents': overdueAgents,
      'clusterName': clusterName,
      'clusterRepaymentRate': clusterRepaymentRate,
      'clusterRepaymentDay': clusterRepaymentDay,
      'dueAgents': dueAgents,
    };
  }

  factory ClusterModel.fromMap(Map<String, dynamic> map) {
    return ClusterModel(
        clusterPurseBalance: map['cluster_purse_balance'] as int,
        totalInterestEarned: map['total_interest_earned'] as int,
        totalOwedByMembers: map['total_owed_by_members'] as int,
        overdueAgents:
            List<dynamic>.from((map['overdue_agents'] as List<dynamic>)),
        clusterName: map['cluster_name'] as String,
        clusterRepaymentRate: map['cluster_repayment_rate'] as double,
        clusterRepaymentDay: map['cluster_repayment_day'] as String,
        dueAgents: List<dynamic>.from(
          (map['due_agents'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory ClusterModel.fromJson(String source) =>
      ClusterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
