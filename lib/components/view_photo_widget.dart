import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ViewPhotoWidget extends StatefulWidget {
  const ViewPhotoWidget({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  final String? imagePath;

  @override
  _ViewPhotoWidgetState createState() => _ViewPhotoWidgetState();
}

class _ViewPhotoWidgetState extends State<ViewPhotoWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: FlutterFlowExpandedImageView(
              image: Image.network(
                widget.imagePath!,
                fit: BoxFit.contain,
              ),
              allowRotation: false,
              tag: widget.imagePath!,
              useHeroAnimation: true,
            ),
          ),
        );
      },
      child: Hero(
        tag: widget.imagePath!,
        transitionOnUserGestures: true,
        child: Image.network(
          widget.imagePath!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
