import 'package:flutter/material.dart';
import 'package:spotsound/pages/_music/widget/bottom_sheet.dart';
import 'package:spotsound/themes/app_color.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  // Indicate if application has permission to the library.
  bool _hasPermission = false;

  @override
  void initState() {
    LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    _audioQuery.setLogConfig(logConfig);

    // Check and request for permission.
    checkAndRequestPermissions();
    super.initState();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    // The param 'retryRequest' is false, by default.
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    // Only call update the UI if application has all required permissions.
    _hasPermission ? setState(() {}) : null;
  }

  Widget noAccessToLibraryWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'No ha sido posible obtener acceso a la biblioteca de musica',
            style: TextStyle(
              fontSize: 16,
              color: AppColor.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () => checkAndRequestPermissions(retry: true),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xff95B9F3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Solicitar acceso',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String formatDuration(int duration) {
    int minutes = duration ~/ 60000;
    int seconds = (duration % 60000) ~/ 1000;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void _showBottomSheetWidget(context) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.95,
      //isScrollControlled: true,
      context: context,
      builder: (context) => const BottomSheetPlayer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SpotSound',
          style: TextStyle(
            letterSpacing: 7,
            color: AppColor.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: !_hasPermission
              ? noAccessToLibraryWidget()
              : FutureBuilder(
                  future: _audioQuery.querySongs(
                    sortType: null,
                    orderType: OrderType.ASC_OR_SMALLER,
                    uriType: UriType.EXTERNAL,
                    ignoreCase: true,
                  ),
                  builder: (context, item) {
                    // Display error, if any
                    if (item.hasError) {
                      return Text(
                        'Error--: ${item.error.toString()}',
                      );
                    }

                    // Waiting content
                    if (item.data == null) {
                      return const CircularProgressIndicator();
                    }

                    // Library is empty
                    if (item.data!.isEmpty) return const Text('No encontrado');

                    return ListView.builder(
                      itemCount: item.data!.length,
                      itemBuilder: (context, index) {
                        return SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showBottomSheetWidget(context);
                                  },
                                  child: ListTile(
                                    // Titulo de la cancion
                                    title: Text(
                                      item.data![index].title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    // Nombre de los artistas
                                    subtitle: Text(
                                      item.data![index].artist ?? "No Artist",
                                      style: TextStyle(
                                        color:
                                            AppColor.grisClaro.withOpacity(0.5),
                                        fontSize: 14,
                                      ),
                                    ),

                                    // Image de la musica
                                    leading: QueryArtworkWidget(
                                      controller: _audioQuery,
                                      id: item.data![index].id,
                                      type: ArtworkType.AUDIO,
                                    ),

                                    //ClipRRect(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   child: const Image(
                                    //     image: NetworkImage(
                                    //       'https://www.lahiguera.net/musicalia/artistas/morat/disco/13257/tema/29722/morat_feo-portada.jpg',
                                    //     ),
                                    //     width: 50,
                                    //     height: 50,
                                    //   ),
                                    // ),
                                    // Minutos de la musica
                                    trailing: Text(
                                      formatDuration(
                                        item.data![index].duration!.toInt(),
                                      ),
                                      style: TextStyle(
                                        color:
                                            AppColor.grisClaro.withOpacity(0.5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
