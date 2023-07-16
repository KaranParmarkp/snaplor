
import 'package:jyotishee/app/utils/utils.dart';

class ApproveBidRequestModel {
  String? id;
  int? rating;
  String? feedback;
  String? bonus;
  ApproveBidRequestModel({this.rating,this.feedback,this.bonus,this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = rating ?? 0;
    data['feedback'] = feedback ?? "";
    data['timesheet_level_bonus'] = bonus!.isNotEmpty ? bonus : "0";
    return data;
  }
}