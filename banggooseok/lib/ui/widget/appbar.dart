import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

    final Widget title;
    final bool leading;
    final Widget backdrop;
    final Widget bottom;
    final Widget body;
    final bool collapsed;

    CustomAppBar({ this.title, this.leading = true, this.backdrop, this.bottom, this.body, this.collapsed = true });

    @override
    Widget build(BuildContext context) {
        return CustomScrollView(
            physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
                SliverAppBar(
                    backgroundColor: Colors.transparent,
                    actions: [
                        IconButton(icon: Icon(Icons.share), onPressed: () {}),
                        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                    ],
                    leading: IconButton(
                        color: Colors.black,
                        onPressed: () {
                            Navigator.pop(context);
                        },
                        icon: Icon(
                            Icons.arrow_back,
                        ),
                    ),
                    automaticallyImplyLeading: leading,
                    bottom: bottom != null ? bottom : null,
                    iconTheme: IconThemeData(
                        color: Colors.black,
                        opacity: 0.9,
                    ),
                    elevation: 0,
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: collapsed ? 0 : MediaQuery.of(context).size.height * 0.4,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        stretchModes: [
                            StretchMode.zoomBackground,
                            StretchMode.blurBackground,
                        ],
                        title: title,
                        background: backdrop,
                    ),
                ),
                body
            ],
        );
    }

}