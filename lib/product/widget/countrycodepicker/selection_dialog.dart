import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/page_padding.dart';

import 'country_code.dart';
import 'country_localizations.dart';

class SelectionDialog extends StatefulWidget {
  final List<CountryCode> elements;
  final bool? showCountryOnly;

  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final WidgetBuilder? emptySearchBuilder;
  final bool? showFlag;
  final double flagWidth;
  final Decoration? flagDecoration;
  final Size? size;

  final Icon? closeIcon;

  final Color? barrierColor;

  const SelectionDialog(
    this.elements, {
    super.key,
    this.showCountryOnly,
    this.emptySearchBuilder,
    InputDecoration searchDecoration = const InputDecoration(),
    this.textStyle,
    this.boxDecoration,
    this.showFlag,
    this.flagDecoration,
    this.flagWidth = 32,
    this.size,
    this.barrierColor,
    this.closeIcon,
  });

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  late List<CountryCode> filteredElements;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.zero,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: widget.size?.width ?? context.width,
          height: widget.size?.height ?? context.height * 0.85,
          decoration: widget.boxDecoration ??
              BoxDecoration(
                color: context.colorScheme.onSecondary,
                borderRadius: PageBorderRadius.allHeight(),
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 20,
                icon: widget.closeIcon!,
                onPressed: () => context.pop(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search country",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: _filterElements,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: PagePadding.allDefault(),
                  children: [
                    if (filteredElements.isEmpty)
                      _buildEmptySearchWidget(context)
                    else
                      ...filteredElements.map(
                        (e) => SimpleDialogOption(
                          child: _buildOption(e),
                          onPressed: () {
                            _selectItem(e);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildOption(CountryCode e) {
    return Padding(
      padding: PagePadding.verticaLow(),
      child: SizedBox(
        width: 400,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            if (widget.showFlag!)
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: widget.flagDecoration,
                  clipBehavior:
                      widget.flagDecoration == null ? Clip.none : Clip.hardEdge,
                  child: Image.asset(
                    e.flagUri!,
                    width: widget.flagWidth,
                  ),
                ),
              ),
            Expanded(
              flex: 4,
              child: Text(
                widget.showCountryOnly!
                    ? e.toCountryStringOnly()
                    : e.toLongString(),
                overflow: TextOverflow.fade,
                style: widget.textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder!(context);
    }

    return Center(
      child: Column(
        children: [
          Text(CountryLocalizations.of(context)?.translate('no_country') ??
              'No country found'),
        ],
      ),
    );
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) =>
              e.code!.contains(s) ||
              e.dialCode!.contains(s) ||
              e.name!.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(CountryCode e) {
    Navigator.pop(context, e);
  }
}
