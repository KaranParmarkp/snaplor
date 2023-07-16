import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/enums.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/models/models.dart';
import '../../../../app/utils/constants/api_config.dart';
import '../network_services/api_service.dart';

class ShiftsService extends ApiService {
  Future<Response<GenericResponse>> creditProfile() async {
    return getData(
      ApiConfig.creditProfile,
    );
  }

  Future<Response<GenericResponse>> getDashboard() async {
    return getData(
      ApiConfig.dashboard,
    );
  }

  Future<Response<GenericResponse>> shiftList(
      ShiftListRequestModel model) async {
    switch (model.shiftsType) {
      case ShiftsTypes.totalTodayShiftType:
        return getData(ApiConfig.todayTotalShifts);
      case ShiftsTypes.unfilledTodayShiftType:
        return getData(ApiConfig.todayFilledShift);
      case ShiftsTypes.totalTomorrowShiftType:
        return getData(ApiConfig.tomorrowTotalShift);
      case ShiftsTypes.unfilledTomorrowShiftType:
        return getData(ApiConfig.todayFilledShift);
      case ShiftsTypes.completedTodayShiftType:
        return getData(ApiConfig.todayCompletedShift);
      case ShiftsTypes.missedTodayShiftType:
        return getData(ApiConfig.todayMissedShift);
      case ShiftsTypes.acceptBidShiftType:
        return getData(ApiConfig.acceptBidList);
      case ShiftsTypes.shiftList:
        return getData(ApiConfig.shiftList, queryParameters: model.toJson());
    }
  }

  Future<Response<GenericResponse>> getShiftDetails(String id) async {
    return getData(
      ApiConfig.shiftList + "/" + id,
    );
  }

  Future<Response<GenericResponse>> cancelShift(String id) async {
    return postData(
      ApiConfig.cancelShift + id,
    );
  }

  Future<Response<GenericResponse>> publishShift(String id) async {
    return postData(ApiConfig.publishShift, data: {"id": id});
  }

  Future<Response<GenericResponse>> unPublishShift(String id) async {
    return postData(ApiConfig.unPublishShift, data: {"id": id});
  }

  Future<Response<GenericResponse>> shiftsOptions() async {
    return getData(
      ApiConfig.shiftOptions,
    );
  }

  Future<Response<GenericResponse>> approveTimesList(String? status) async {
    return await getData(
      status.isNotNull ?ApiConfig.times+"status="+status! :ApiConfig.approvedTimeList,
    );
  }

  Future<Response<GenericResponse>> approvedBid(
      ApproveBidRequestModel model) async {
    return postData(ApiConfig.approveBid + "${model.id}/approve",
        data: model.toJson());
  }

  Future<Response<GenericResponse>> rejectBid(String id,String reason) async {
    return postData(ApiConfig.approveBid + "${id}/reject",
        data: {"reason":reason});
  }


  Future<Response<GenericResponse>> approveTimeNCNSStatus(
      String id, String status) async {
    return postData(ApiConfig.approveTimeNCNSStatus,
        queryParameters: {"ids[]": id, "status": status});
  }

  Future<Response<GenericResponse>> approveBidDetails(String id) async {
    return getData(
      ApiConfig.approveBidDetails + id,
    );
  }

  Future<Response<GenericResponse>> addTimePreview(
      AddTimePreviewRequestModel model, bool preview) async {
    return postData(
        preview ? ApiConfig.addTimePreview : ApiConfig.addTimeSubmit,
        queryParameters: await model.toJson(),
        data: model.breakTimes?.toJson());
  }
  Future<Response<GenericResponse>> updateApproveTime(String id,
      AddTimePreviewRequestModel model) async {
    return postData(
         ApiConfig.approveBid+id+ApiConfig.updateApproveTime,
        queryParameters: await model.toJsonUpdate(),
        data: model.breakTimes?.toJson());
  }

  Future<Response<GenericResponse>> needToProcessCallOffs() async {
    return await getData(
      ApiConfig.callOffs,
    );
  }

  Future<Response<GenericResponse>> creditProfileDetails(CreditSpend credit) async {
    switch(credit){
      case CreditSpend.outStandingInvoices:
        return getData(ApiConfig.outStanding);
      case CreditSpend.runningShifts:
        return getData(ApiConfig.runningShift);
      case CreditSpend.confirmedShifts:
        return getData(ApiConfig.confirmShift);
      case CreditSpend.unInvoiceTimesheet:
        return getData(ApiConfig.unInvoice);
    }

  }


}
