import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedTextFormField extends StatefulWidget {
  const AnimatedTextFormField({
    required this.searchQueries,
    this.typeSpeed = const Duration(milliseconds: 150),
    this.delay = const Duration(seconds: 1),
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textAlign= TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled,
    this.maxLines,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.textCapitalization = TextCapitalization.none,
    this.enableSuggestions = true,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.initialValue,
    this.autovalidateMode,
    this.useTextSelectionToolbar = true,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.onTapOutside,
  });

  final List<String> searchQueries;
  final Duration typeSpeed;
  final Duration delay;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final TextCapitalization textCapitalization;
  final bool enableSuggestions;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final String? initialValue;
  final AutovalidateMode? autovalidateMode;
  final bool useTextSelectionToolbar;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  State<AnimatedTextFormField> createState() => _AnimatedTextFormFieldState();
}

class _AnimatedTextFormFieldState extends State<AnimatedTextFormField> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String> _hintTextNotifier = ValueNotifier<String>('');
  int _queryIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypingEffect();
  }

  Future<void> _startTypingEffect() async {
    while (true) {
      for (var i = 0; i <= widget.searchQueries[_queryIndex].length; i++) {
        await Future<dynamic>.delayed(widget.typeSpeed);
        _hintTextNotifier.value =
            widget.searchQueries[_queryIndex].substring(0, i);
      }
      await Future<dynamic>.delayed(widget.delay);
      for (var i = widget.searchQueries[_queryIndex].length; i >= 0; i--) {
        await Future<dynamic>.delayed(widget.typeSpeed);
        _hintTextNotifier.value =
            widget.searchQueries[_queryIndex].substring(0, i);
      }
      await Future<dynamic>.delayed(widget.delay);
      _queryIndex = (_queryIndex + 1) % widget.searchQueries.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _hintTextNotifier,
      builder: (context, hintText, child) {
        return TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search for $hintText',
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          textCapitalization: widget.textCapitalization,
          enableSuggestions: widget.enableSuggestions,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          buildCounter: widget.buildCounter,
          scrollPhysics: widget.scrollPhysics,
          scrollController: widget.scrollController,
          initialValue: widget.initialValue,
          autovalidateMode: widget.autovalidateMode,
          mouseCursor: widget.mouseCursor,
          contextMenuBuilder: widget.contextMenuBuilder,
          onTapOutside: widget.onTapOutside,
        );
      },
    );
  }

  @override
  void dispose() {
    _hintTextNotifier.dispose();
    _controller.dispose();
    super.dispose();
  }
}
