import '../../../core/app_export.dart';

/// This class is used in the [acceptedjobspage_item_widget] screen.
class AcceptedjobspageItemModel {
  AcceptedjobspageItemModel({
    this.groceryImage,
    this.groceryText,
    this.deliveryText,
    this.daysLeftText,
    this.id,
  }) {
    groceryImage = groceryImage ?? ImageConstant.imgDepth5Frame01;
    groceryText = groceryText ?? "Pick up groceries at Safeway";
    deliveryText = deliveryText ?? "Delivery in San Francisco, CA";
    daysLeftText = daysLeftText ?? "7 days left to start";
    id = id ?? "";
  }

  String? groceryImage;

  String? groceryText;

  String? deliveryText;

  String? daysLeftText;

  String? id;
}
