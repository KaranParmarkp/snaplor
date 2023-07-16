import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/models/model_shift_calender_list.dart';
import 'package:jyotishee/data/models/shift_template_preview_model.dart';
import 'package:jyotishee/data/sources/remote/services/shifts_service.dart';
import 'package:jyotishee/data/sources/remote/services/shifts_service.dart';
import 'package:jyotishee/presentation/screens/dashboard/credit/credit_profile_screen.dart';

import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';
import '../../network_services/abstract_api.dart';
import '../../services/auth_service.dart';
import 'shifts_repository.dart';

class ShiftsRepositoryImpl extends AbstractApi implements ShiftsRepository {
  final ShiftsService service = ShiftsService();

  @override
  Future<CreditAvailableModel> creditProfile() {
    return serviceHandler(
      serviceFunction: () => service.creditProfile(),
      successFunction: (response) async {
        return await CreditAvailableModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<DashBoardModel> getDashboard() {
    return serviceHandler(
      serviceFunction: () => service.getDashboard(),
      successFunction: (response) async {
        return await DashBoardModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<List<ModelShiftCalenderList>> shiftList(ShiftListRequestModel model) {
    return serviceHandler(
      serviceFunction: () => service.shiftList(model),
      successFunction: (response) async {
        List<ModelShiftCalenderList> list = [];
        if (response.data.isNotEmpty)
          list = List<ModelShiftCalenderList>.from(
              response.data.map((x) => ModelShiftCalenderList.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<ShiftTemplatePreviewModel> getShiftDetails(String id) {
    return serviceHandler(
      serviceFunction: () => service.getShiftDetails(id),
      successFunction: (response) async {
        return await ShiftTemplatePreviewModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<GenericResponse> cancelShift(String id) {
    return serviceHandler(
      serviceFunction: () => service.cancelShift(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> publishShift(String id) {
    return serviceHandler(
      serviceFunction: () => service.publishShift(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> unPublishShift(String id) {
    return serviceHandler(
      serviceFunction: () => service.unPublishShift(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<PostShiftModel> shiftOptions() {
    return serviceHandler(
      serviceFunction: () => service.shiftsOptions(),
      successFunction: (response) async {
        return PostShiftModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<List<CallOffModel>> getApproveTimesList(String? status) {
    return serviceHandler(
      serviceFunction: () => service.approveTimesList(status),
      successFunction: (response) async {
        List<CallOffModel> list = [];
        if (response.data.isNotEmpty)
          list = List<CallOffModel>.from(
              response.data.map((x) => CallOffModel.fromJson(x)));
        return list.reversed.toList();
      },
    );
  }

  @override
  Future<GenericResponse> approveBid(ApproveBidRequestModel model) {
    return serviceHandler(
      serviceFunction: () => service.approvedBid(model),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> rejectBid(String id,String reason) {
    return serviceHandler(
      serviceFunction: () => service.rejectBid(id, reason),
      successFunction: (response) async {
        return response;
      },
    );
  }


  @override
  Future<GenericResponse> approveTimeNCNSStatus(String id, String status) {
    return serviceHandler(
      serviceFunction: () => service.approveTimeNCNSStatus(id, status),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<CallOffModel> approveBidDetails(String id) {
    return serviceHandler(
      serviceFunction: () => service.approveBidDetails(id),
      successFunction: (response) async {
        return CallOffModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<GenericResponse<PreviewModel?>> addTimePreview(AddTimePreviewRequestModel model, bool preview) {
    return serviceHandler(
      serviceFunction: () => service.addTimePreview(model, preview),
      successFunction: (response) async {
        return GenericResponse(
            code: response.code,
            message: response.message,
            data: response.data!=null
                ? PreviewModel.fromJson(response.data)
                : null);
      },
    );
  }
  @override
  Future<GenericResponse<PreviewModel?>> updateApproveTime(String id,AddTimePreviewRequestModel model,) {
    return serviceHandler(
      serviceFunction: () => service.updateApproveTime(id,model),
      successFunction: (response) async {
        return GenericResponse(
            code: response.code,
            message: response.message,
            data: response.data!=null
                ? PreviewModel.fromJson(response.data)
                : null);
      },
    );
  }

  @override
  Future<List<CallOffModel>> needToProcessCallOffs() {
    return serviceHandler(
      serviceFunction: () => service.needToProcessCallOffs(),
      successFunction: (response) async {
        List<CallOffModel> list = [];
        if (response.data.isNotEmpty)
          list = List<CallOffModel>.from(
              response.data.map((x) => CallOffModel.fromJson(x)));
        return list.reversed.toList();
      },
    );
  }

  @override
  Future<List<TimeSheetDetailModel>> creditProfileDetails(CreditSpend credit) {
    return serviceHandler(
      serviceFunction: () => service.creditProfileDetails(credit),
      successFunction: (response) async {
        List<TimeSheetDetailModel> list = [];
        if (response.data.isNotEmpty)
          list = List<TimeSheetDetailModel>.from(
              response.data.map((x) => TimeSheetDetailModel.fromJson(x)));
        return list;
      },
    );
  }


}
