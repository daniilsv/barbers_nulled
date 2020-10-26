import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef OnChooseCallback<T> = Function(T);

const BoxDecoration itemsContainerDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      blurRadius: 8,
      offset: Offset(0, 4),
      color: Color.fromRGBO(0, 0, 0, 0.2),
    ),
  ],
);

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    this.onChoose,
    this.items,
    this.value,
    this.valueText,
    this.containerDecoration,
    this.containerHint,
    this.inactiveTextStyle,
    this.activeTextStyle,
    this.itemBuilder,
    this.itemHeight,
  });
  final List<T> items;
  final Function onChoose;
  final T value;
  final String valueText;
  final BoxDecoration containerDecoration;
  final String containerHint;
  final TextStyle inactiveTextStyle;
  final TextStyle activeTextStyle;
  final double itemHeight;
  final Widget Function(BuildContext context, T item) itemBuilder;
  @override
  _CustomDropDownState createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown> {
  List<T> get items => widget.items;
  Widget Function(BuildContext context, T item) get itemBuilder => widget.itemBuilder;

  OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void didUpdateWidget(CustomDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    closeOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if ((widget.items ?? []).isEmpty) return;
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(_overlayEntry);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: widget.containerDecoration,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.value == null || (widget.items ?? []).isEmpty
                      ? (widget.containerHint ?? '')
                      : widget.valueText ?? "",
                  style: BRStyle.text16,
                ),
              ),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> closeOverlay() async {
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
      return false;
    }
    return true;
  }

  OverlayEntry _createOverlayEntry() {
    final RenderObject renderBox = context.findRenderObject();
    final size = (renderBox as RenderBox).size;

    return OverlayEntry(
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: closeOverlay,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Text(''),
                  ),
                ),
              ),
              CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 3),
                child: Container(
                  width: size.width,
                  height: items.length * widget.itemHeight + 30,
                  padding: const EdgeInsets.all(15),
                  decoration: itemsContainerDecoration,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => widget.onChoose(items[index]),
                        child: itemBuilder(context, items[index]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
