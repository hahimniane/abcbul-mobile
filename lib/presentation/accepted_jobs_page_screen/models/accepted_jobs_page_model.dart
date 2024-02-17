import '../../../core/app_export.dart';
import 'acceptedjobspage_item_model.dart';

class AcceptedJobsPageModel {
  List<AcceptedjobspageItemModel> acceptedjobspageItemList = [
    AcceptedjobspageItemModel(
        groceryImage: ImageConstant.imgDepth5Frame01,
        groceryText: "Pick up groceries at Safeway",
        deliveryText: "Delivery in San Francisco, CA",
        daysLeftText: "7 days left to start"),
    AcceptedjobspageItemModel(
        groceryImage: ImageConstant.imgDepth5Frame02,
        groceryText: "Pick up food from Little Star Pizza",
        deliveryText: "Delivery in San Francisco, CA",
        daysLeftText: "5 days left to start"),
    AcceptedjobspageItemModel(
        groceryImage: ImageConstant.imgDepth5Frame03,
        groceryText: "Pick up laundry at Washio",
        deliveryText: "Delivery in San Francisco, CA",
        daysLeftText: "2 days left to start")
  ];
}
