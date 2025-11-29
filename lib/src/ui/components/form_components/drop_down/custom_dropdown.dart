import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

enum DropDownType { normal, search }

enum DropDownSelectionType { singleSelection, multiSelection }

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.labelText,
    required this.items,
    this.hintText,
    this.selectedItem,
    this.focusNode,
    this.onChanged,
    this.validator,
    this.isLoading = false,
    this.isRequired = true,
    this.type = DropDownType.normal,
    this.selectionType = DropDownSelectionType.singleSelection,
    this.isDisabled = false,
    this.selectedItems,
    this.onMultiSelectionChanged,
    this.onPagination,
    this.onSearch,
    this.borderColor,
  });

  final String labelText;
  final List<GenericDropdownMenuItem<T>> items;
  final String? hintText;
  final T? selectedItem;
  final List<T>? selectedItems;
  final FocusNode? focusNode;
  final void Function(dynamic)? onChanged;
  final void Function(List<T>)? onMultiSelectionChanged;
  final String? Function(T?)? validator;
  final bool isLoading;
  final bool isRequired;
  final DropDownType type;
  final DropDownSelectionType selectionType;
  final bool isDisabled;
  final Color? borderColor;
  final Future<List<GenericDropdownMenuItem<T>>> Function(String search)?
      onPagination;
  final Future<List<GenericDropdownMenuItem<T>>> Function(String value)?
      onSearch;

  @override
  State createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>>
    with SingleTickerProviderStateMixin {
  bool _hasFocus = false;

  late final FocusNode _focusNode;
  late final AnimationController _transformController;
  late Animation<double> _animation;

  GenericDropdownMenuItem<T>? _selectedValue;
  List<GenericDropdownMenuItem<T>> _selectedValues = [];
  List<T> _tempSelectedItems =
      []; // Internal temp selection for normal multi-selection

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_checkFocus);
    _transformController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0, end: -7).animate(_transformController);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_checkFocus);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _transformController.dispose();
    super.dispose();
  }

  void _checkFocus() {
    if (_focusNode.hasFocus && !_hasFocus) {
      setState(() {
        _hasFocus = true;
      });
    } else if (!_focusNode.hasFocus && _hasFocus) {
      setState(() {
        _hasFocus = false;
      });
    }
  }

  @override
  void didUpdateWidget(covariant CustomDropDown<T> oldWidget) {
    if (widget.selectedItem == null) {
      _selectedValue = null;
    }
    if (widget.selectedItems == null || widget.selectedItems!.isEmpty) {
      _selectedValues.clear();
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Convert selected items to GenericDropdownMenuItem for internal use
  List<GenericDropdownMenuItem<T>> _getSelectedItemsAsDropdownItems() {
    // Only use tempSelectedItems when it's multiSelection AND normal type
    final shouldUseTempSelection =
        widget.selectionType == DropDownSelectionType.multiSelection &&
            widget.type == DropDownType.normal;

    final itemsToUse = shouldUseTempSelection
        ? _tempSelectedItems
        : (widget.selectedItems ?? []);

    return itemsToUse
        .map((item) => widget.items
            .firstWhere((dropdownItem) => dropdownItem.value == item))
        .toList();
  }

  /// Initialize temp selection from selectedItems when opening dropdown
  void _initializeTempSelection() {
    if (widget.selectionType == DropDownSelectionType.multiSelection &&
        widget.type == DropDownType.normal) {
      _tempSelectedItems = List.from(widget.selectedItems ?? []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                if (widget.isDisabled) return;
                // Initialize temp selection from selectedItems when opening dropdown
                _initializeTempSelection();
                bool wasConfirmed = false;
                await ChoicesBottomSheet.openSheet<T>(
                  context,
                  label: widget.labelText,
                  items: widget.items,
                  initialSelectedItem: _selectedValue,
                  type: widget.type,
                  selectionType: widget.selectionType,
                  initialSelectedItems: widget.selectionType ==
                          DropDownSelectionType.multiSelection
                      ? _getSelectedItemsAsDropdownItems()
                      : _selectedValues,
                  onSearch: widget.onSearch,
                  onPagination: widget.onPagination,
                  onMultiSelectionItemChanged: widget.selectionType ==
                              DropDownSelectionType.multiSelection &&
                          widget.type == DropDownType.normal
                      ? (item) {
                          // Update internal temp selection
                          if (_tempSelectedItems.contains(item)) {
                            _tempSelectedItems.remove(item);
                          } else {
                            _tempSelectedItems.add(item);
                          }
                          setState(() {}); // Update UI to reflect temp changes
                        }
                      : null,
                  onConfirm: widget.selectionType ==
                              DropDownSelectionType.multiSelection &&
                          widget.type == DropDownType.normal
                      ? (value) {
                          // Only call onMultiSelectionChanged from confirm button for normal multi-selection
                          wasConfirmed = true;
                          widget.onMultiSelectionChanged
                              ?.call(value.map((e) => e.value).toList());
                          _selectedValues = value;
                          _transformController.forward();
                        }
                      : null,
                  onReset: widget.selectionType ==
                              DropDownSelectionType.multiSelection &&
                          widget.type == DropDownType.normal
                      ? () {
                          // Only call onMultiSelectionChanged from confirm button for normal multi-selection
                          wasConfirmed = true;
                          widget.onMultiSelectionChanged?.call([]);
                          _selectedValues = [];
                          _transformController.forward();
                          _tempSelectedItems = [];
                        }
                      : null,
                  onChange: (value) {
                    switch (widget.selectionType) {
                      case DropDownSelectionType.singleSelection:
                        widget.onChanged?.call(value.first.value);
                        _selectedValue = value.first;
                        _transformController.forward();
                        break;
                      case DropDownSelectionType.multiSelection:
                        // For normal multi-selection, don't call onMultiSelectionChanged here
                        // It should only be called from the confirm button via onConfirm
                        if (widget.type != DropDownType.normal) {
                          // For search multi-selection, update immediately (old behavior)
                          widget.onMultiSelectionChanged
                              ?.call(value.map((e) => e.value).toList());
                          _selectedValues = value;
                          _transformController.forward();
                        }
                        break;
                    }
                  },
                  borderColor: widget.borderColor,
                );

                // If sheet was dismissed without confirmation, reset temp selection to original selectedItems
                if (!wasConfirmed &&
                    widget.selectionType ==
                        DropDownSelectionType.multiSelection &&
                    widget.type == DropDownType.normal) {
                  _tempSelectedItems = List.from(widget.selectedItems ?? []);
                }

                setState(() {});
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color:
                      state.hasError ? AppColors.lightErrorColor : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: state.hasError
                          ? AppColors.errorColor
                          : _hasFocus
                              ? AppColors.mainPrimary
                              : AppColors.basicBorderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: state.hasError
                          ? AppColors.errorColor.withOpacity(0.17)
                          : _hasFocus
                              ? AppColors.mainPrimary.withOpacity(0.14)
                              : AppColors.colorC4C4C4.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, _) {
                              return Transform(
                                transform: Matrix4.translationValues(
                                    0, _animation.value, 0),
                                child: AnimatedDefaultTextStyle(
                                  style: context.textTheme.labelSmall!.copyWith(
                                    fontSize: _selectedValue != null ||
                                            _getSelectedItemsAsDropdownItems()
                                                .isNotEmpty
                                        ? 12.sp
                                        : 14.sp,
                                    fontWeight: FontWeight.w400,
                                    // height: 18 / 12,
                                    color: _selectedValue != null ||
                                            _getSelectedItemsAsDropdownItems()
                                                .isNotEmpty
                                        ? AppColors.secondText
                                        : AppColors.placeHolderColor,
                                  ),
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                  child: Text(widget.labelText),
                                ),
                              );
                            },
                          ),
                          if (_selectedValue != null ||
                              _getSelectedItemsAsDropdownItems().isNotEmpty)
                            Text(
                              _selectedValue != null
                                  ? _selectedValue!.title
                                  : _getSelectedItemsAsDropdownItems()
                                      .map((e) => e.title)
                                      .join(", "),
                              style: context.textTheme.labelSmall?.copyWith(
                                color: AppColors.mainText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    SvgPicture.asset(
                      "assets/svg/arrow_down_sharp.svg",
                      width: 24.w,
                      theme: const SvgTheme(
                          currentColor: AppColors.placeHolderColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 6.h),
            AppErrorWidget(
              state.hasError,
              state.errorText ?? "",
              img: 'assets/svg/red_warning.svg',
            ),
          ],
        );
      },
    );
  }
}
