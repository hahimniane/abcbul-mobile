import '../../../core/app_export.dart';

/// This class is used in the [depthframefivechipview_item_widget] screen.
class DepthframefivechipviewItemModel {
  DepthframefivechipviewItemModel({
    this.open,
    this.isSelected,
  }) {
    open = open ?? "Open";
    isSelected = isSelected ?? false;
  }

  String? open;

  bool? isSelected;
}
