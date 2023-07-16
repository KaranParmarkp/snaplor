import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';

abstract class ShiftsRepository{
  Future<CreditAvailableModel> creditProfile();
  Future<DashBoardModel> getDashboard();
  Future<List<ModelShiftCalenderList>> shiftList(ShiftListRequestModel model);
  Future<ShiftTemplatePreviewModel> getShiftDetails(String id);
  Future<GenericResponse> cancelShift(String id);
  Future<GenericResponse> publishShift(String id);
  Future<GenericResponse> unPublishShift(String id);
  Future<PostShiftModel> shiftOptions();
  Future<List<CallOffModel>> getApproveTimesList(String? status);
  Future<GenericResponse> approveBid(ApproveBidRequestModel model);
  Future<GenericResponse> rejectBid(String id,String reason);
  Future<GenericResponse> approveTimeNCNSStatus(String id, String status);
  Future<CallOffModel> approveBidDetails(String id);
  Future<GenericResponse<PreviewModel?>> addTimePreview(AddTimePreviewRequestModel model,bool preview);
  Future<GenericResponse<PreviewModel?>> updateApproveTime(String id,AddTimePreviewRequestModel model,);
  Future<List<CallOffModel>> needToProcessCallOffs();
  Future<List<TimeSheetDetailModel>> creditProfileDetails(CreditSpend credit);
}