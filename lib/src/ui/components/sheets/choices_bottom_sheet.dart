import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:osama_core/osama_core.dart';
import 'package:osama_core/src/ui/components/form_components/text_fields/search_text_field.dart';
import 'package:osama_core/src/ui/components/general_components/empty_search_result.dart';

class ChoicesBottomSheet<T> extends StatefulWidget {
  const ChoicesBottomSheet({
    super.key,
    required this.label,
    required this.items,
    required this.onChange,
    required this.initialSelectedItem,
    required this.type,
    required this.selectionType,
    required this.initialSelectedItems,
    this.onPagination,
    this.onSearch,
    this.onMultiSelectionItemChanged,
    this.onConfirm,
    this.onReset,
    this.selectedColor,
    this.iconAlignment = IconAlignment.end,
    this.boldEffect = false,
    this.backgroundItemHoverEffect = false,
    this.borderColor,
  });

  final String label;
  final List<GenericDropdownMenuItem<T>> items;
  final void Function(List<GenericDropdownMenuItem<T>>) onChange;
  final GenericDropdownMenuItem<T>? initialSelectedItem;
  final List<GenericDropdownMenuItem<T>>? initialSelectedItems;
  final DropDownType type;
  final DropDownSelectionType selectionType;
  final Color? selectedColor;
  final bool boldEffect;
  final IconAlignment iconAlignment;
  final bool backgroundItemHoverEffect;
  final Future<List<GenericDropdownMenuItem<T>>> Function(String search)?
      onPagination;
  final Future<List<GenericDropdownMenuItem<T>>> Function(String value)?
      onSearch;
  final void Function(dynamic)? onMultiSelectionItemChanged;
  final void Function(List<GenericDropdownMenuItem<T>>)? onConfirm;
  final void Function()? onReset;
  final Color? borderColor;

  static Future<void> openSheet<T>(
    BuildContext context, {
    required String label,
    required List<GenericDropdownMenuItem<T>> items,
    required void Function(List<GenericDropdownMenuItem<T>>) onChange,
    Color? selectedColor,
    IconAlignment iconAlignment = IconAlignment.end,
    bool boldEffect = false,
    bool backgroundItemHoverEffect = false,
    DropDownType type = DropDownType.normal,
    DropDownSelectionType selectionType = DropDownSelectionType.singleSelection,
    GenericDropdownMenuItem<T>? initialSelectedItem,
    List<GenericDropdownMenuItem<T>> initialSelectedItems = const [],
    Future<List<GenericDropdownMenuItem<T>>> Function(String search)?
        onPagination,
    Future<List<GenericDropdownMenuItem<T>>> Function(String value)? onSearch,
    void Function(dynamic)? onMultiSelectionItemChanged,
    void Function(List<GenericDropdownMenuItem<T>>)? onConfirm,
    void Function()? onReset,
    Color? borderColor,
  }) =>
      showModalBottomSheet<dynamic>(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        builder: (_) => ChoicesBottomSheet<T>(
          label: label,
          onChange: onChange,
          items: items,
          initialSelectedItem: initialSelectedItem,
          type: type,
          selectionType: selectionType,
          initialSelectedItems: initialSelectedItems,
          onSearch: onSearch,
          onPagination: onPagination,
          onMultiSelectionItemChanged: onMultiSelectionItemChanged,
          onConfirm: onConfirm,
          onReset: onReset,
          selectedColor: selectedColor,
          iconAlignment: iconAlignment,
          boldEffect: boldEffect,
          backgroundItemHoverEffect: backgroundItemHoverEffect,
          borderColor: borderColor,
        ),
      );

  @override
  State createState() => _ChoicesBottomSheetState<T>();
}

class _ChoicesBottomSheetState<T> extends State<ChoicesBottomSheet<T>> {
  GenericDropdownMenuItem<T>? _selectedIndex;
  late List<GenericDropdownMenuItem<T>> _selectedIndexes;
  List<GenericDropdownMenuItem<T>> _items = [];
  final RefreshController _refreshController = RefreshController();

  bool _isLoading = false;
  String? _searchQuery;
  bool _isSingleSelectionProcessing =
      false; // Prevent rapid single selection taps

  @override
  void initState() {
    _items.addAll(widget.items);
    _selectedIndexes = widget.initialSelectedItems ?? [];
    _selectedIndex = widget.initialSelectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAppBottomSheet(
      hasDragButton: true,
      margin: EdgeInsets.zero,
      dragButtonSpace: 12.h,
      title: widget.label,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      padding: const EdgeInsets.symmetric(vertical: 24).copyWith(bottom: 16),
      appbarPadding: const EdgeInsets.symmetric(horizontal: 20).w,
      resizeToAvoidBottomInset: true,
      onCloseClicked: () {
        widget.onSearch?.call('');
      },
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),
            if (widget.onSearch != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SearchTextField(
                  style: SearchTextFieldStyle.outline,
                  debounce: true,
                  onChange: (value) async {
                    if (_searchQuery == value) return;
                    _isLoading = true;
                    _searchQuery = value;
                    setState(() {});
                    _items = await widget.onSearch!.call(value);
                    _isLoading = false;
                    _refreshController.resetNoData();
                    setState(() {});
                  },
                ),
              ),
            SizedBox(height: 8.h),
            Flexible(
              child: _isLoading
                  ? ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 0.4.sh,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : _items.isEmpty
                      ? ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 0.35.sh,
                          ),
                          child: const EmptySearchResult(),
                        )
                      : widget.onPagination != null
                          ? ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).viewInsets.bottom > 0
                                        ? 0.3.sh
                                        : widget.selectionType ==
                                                DropDownSelectionType
                                                    .multiSelection
                                            ? 0.55.sh
                                            : 0.65.sh,
                              ),
                              child: SmartRefresher(
                                controller: _refreshController,
                                enablePullUp: true,
                                enablePullDown: false,
                                onLoading: () async {
                                  final result = await widget.onPagination
                                      ?.call(_searchQuery ?? '');
                                  if (_items.length == result?.length) {
                                    return _refreshController.loadNoData();
                                  }
                                  if (result != null && result.isNotEmpty) {
                                    _items
                                      ..clear()
                                      ..addAll(result);
                                    setState(() {});
                                  }
                                  if (result?.isEmpty == true) {
                                    _refreshController.loadNoData();
                                  } else {
                                    _refreshController.loadComplete();
                                  }
                                },
                                child: choicesList(),
                              ),
                            )
                          : ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: .75.sh,
                              ),
                              child: choicesList(),
                            ),
            ),
            if (widget.selectionType ==
                DropDownSelectionType.multiSelection) ...[
              SizedBox(height: 32.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: MainButton(
                        buttonStyle: MainButtonStyle.outline,
                        text: context.l10n.reset,
                        isEnabled: _selectedIndexes.isNotEmpty,
                        borderColor: widget.borderColor,
                        onTap: () {
                          _selectedIndexes.clear();
                          widget.onSearch?.call('');
                          widget.onReset?.call();
                          setState(() {});
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 3,
                      child: MainButton(
                        buttonStyle: MainButtonStyle.primary,
                        text: context.l10n.confirm,
                        isEnabled: _selectedIndexes.isNotEmpty,
                        onTap: () {
                          // Call onConfirm if available, otherwise fall back to onChange
                          if (widget.onConfirm != null) {
                            widget.onConfirm!(_selectedIndexes);
                          } else {
                            widget.onChange(_selectedIndexes);
                          }
                          Navigator.pop(context);
                          widget.onSearch?.call('');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget choicesList() {
    return ListView.separated(
      itemCount: _items.length,
      // itemCount: 50,
      shrinkWrap: true,
      separatorBuilder: (_, index) => const Divider(
        color: AppColors.basicBorderColor,
        thickness: 1.5,
        height: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = _items[index];
        return GenericRadioChip(
          label: item.title,
          image: item.image,
          isSelected:
              widget.selectionType == DropDownSelectionType.multiSelection
                  ? _selectedIndexes.contains(item)
                  : _selectedIndex == item,
          boldTextEffect: widget.boldEffect,
          iconAlignment: widget.iconAlignment,
          selectedColor: widget.selectedColor,
          backgroundItemHoverEffect: widget.backgroundItemHoverEffect,
          isMultiSelection:
              widget.selectionType == DropDownSelectionType.multiSelection,
          onTap: () async {
            switch (widget.selectionType) {
              case DropDownSelectionType.singleSelection:
                // Prevent rapid multiple taps
                if (_isSingleSelectionProcessing) return;
                _isSingleSelectionProcessing = true;

                _selectedIndex = item;
                widget.onChange([_selectedIndex!]);
                setState(() {});
                await Future<void>.delayed(const Duration(milliseconds: 400));
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
                widget.onSearch?.call('');
                break;
              case DropDownSelectionType.multiSelection:
                if (_selectedIndexes.contains(item)) {
                  _selectedIndexes.remove(item);
                } else {
                  _selectedIndexes.add(item);
                }
                // Call onMultiSelectionItemChanged with the selected item when in multi-selection mode
                widget.onMultiSelectionItemChanged?.call(item.value);
                setState(() {});
                break;
            }
          },
        );
      },
    );
  }
}
