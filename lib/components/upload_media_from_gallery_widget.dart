import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadMediaFromGalleryWidget extends StatefulWidget {
  const UploadMediaFromGalleryWidget({Key? key}) : super(key: key);

  @override
  _UploadMediaFromGalleryWidgetState createState() =>
      _UploadMediaFromGalleryWidgetState();
}

class _UploadMediaFromGalleryWidgetState
    extends State<UploadMediaFromGalleryWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

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
        final selectedMedia = await selectMedia(
          mediaSource: MediaSource.photoGallery,
          multiImage: false,
        );
        if (selectedMedia != null &&
            selectedMedia
                .every((m) => validateFileFormat(m.storagePath, context))) {
          setState(() => isMediaUploading = true);
          var downloadUrls = <String>[];
          try {
            showUploadMessage(
              context,
              'Uploading file...',
              showLoading: true,
            );
            downloadUrls = (await Future.wait(
              selectedMedia.map(
                (m) async => await uploadData(m.storagePath, m.bytes),
              ),
            ))
                .where((u) => u != null)
                .map((u) => u!)
                .toList();
          } finally {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            isMediaUploading = false;
          }
          if (downloadUrls.length == selectedMedia.length) {
            setState(() => uploadedFileUrl = downloadUrls.first);
            showUploadMessage(context, 'Success!');
          } else {
            setState(() {});
            showUploadMessage(context, 'Failed to upload media');
            return;
          }
        }
      },
      child: FlutterFlowMediaDisplay(
        path: uploadedFileUrl,
        imageBuilder: (path) => ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Image.network(
            path,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
          path: path,
          width: 300,
          autoPlay: false,
          looping: true,
          showControls: true,
          allowFullScreen: true,
          allowPlaybackSpeedMenu: false,
        ),
      ),
    );
  }
}
