// common search text field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';
import 'package:osama_core/osama_core.dart';

typedef SearchValue = void Function(String);
typedef ClearValue = void Function();

enum SearchTextFieldStyle { primary, outline }

class SearchTextField extends StatefulWidget {
  final bool readOnly;
  final bool autoFocus;
  final void Function()? onTap;
  final void Function(String text)? onChange;
  final SearchValue? onSubmit;
  final bool showTrailing;
  final ClearValue? onClear;
  final TextEditingController? controller;
  final bool hasScan;
  final bool isActive;
  final bool isFromVideoScreen;
  final SearchTextFieldStyle style;
  final bool debounce;
  final Duration debounceDuration;
  final VoidCallback? onScan;

  const SearchTextField({
    super.key,
    this.readOnly = false,
    this.onTap,
    this.autoFocus = false,
    this.onSubmit,
    this.showTrailing = false,
    this.onClear,
    this.controller,
    this.onChange,
    this.onScan,
    this.hasScan = false,
    this.isActive = false,
    this.isFromVideoScreen = false,
    this.style = SearchTextFieldStyle.primary,
    this.debounce = false,
    this.debounceDuration = const Duration(milliseconds: 500),
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _searchSubject = BehaviorSubject<String>();

  @override
  void initState() {
    _searchSubject
        .debounceTime(widget.debounceDuration)
        .listen((value) {
      if (widget.onChange != null) {
        widget.onChange!(value);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchSubject.close();
    super.dispose();
  }

  void _onChangedDebounced(String text) {
    final query = text.trim();
    if(widget.debounce) {
      _searchSubject.add(query);
    } else {
      if (widget.onChange != null) {
        widget.onChange!(query);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: widget.style == SearchTextFieldStyle.outline
            ? Colors.transparent
            : AppColors.colorF5F5F5,
        borderRadius: BorderRadius.circular(12.h),
        border: widget.style == SearchTextFieldStyle.outline
            ? Border.all(color: AppColors.lightSecondaryColor)
            : null,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/svg/search.svg",
            width: 20.w,
            colorFilter: ColorFilter.mode(
              widget.isActive ? AppColors.mainText : AppColors.placeHolderColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: widget.controller,
              autofocus: widget.autoFocus,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              onSubmitted: (value) => widget.onSubmit!(value),
              onChanged: _onChangedDebounced,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: context.l10n.search,
                hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.color909090,
                    ),
              ),
              cursorColor: AppColors.color909090,
              // cursorHeight: 15.toHeight,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z\u0621-\u064A\s0-9#_]")),
              ],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.color1C1B13),
            ),
          ),
          SizedBox(width: 16.w),
          widget.showTrailing
              ? GestureDetector(
                  onTap: () {
                    widget.controller?.clear();
                    widget.onClear!();
                  },
                  child: Container(
                    // margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorF0F0EF,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.color1C1B13,
                      size: 16,
                    ),
                  ),
                )
              : widget.hasScan
                  ? InkWell(
                      onTap: widget.onScan,
                      child: SvgPicture.asset(
                        "assets/svg/QRcode.svg",
                        width: 24.w,
                      ),
                    )
                  : SizedBox(
                      height: 1.h,
                      width: 1.w,
                    )
        ],
      ),
    );
  }
}
