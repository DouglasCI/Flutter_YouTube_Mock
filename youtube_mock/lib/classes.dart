import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClosedSideBarButton extends StatelessWidget {
  final dynamic icon;
  final String text;

  const ClosedSideBarButton({
    super.key,
    required this.icon, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text, 
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 2.0),
            Text(
              text,
              style: const TextStyle(fontSize: 10.0, color: Colors.black),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class OpenedSideBarButton extends StatelessWidget {
  final dynamic icon;
  final String text;

  const OpenedSideBarButton({
    super.key,
    required this.icon, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text, 
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 24.0),
            Flexible(
              flex: 10,
              fit: FlexFit.tight,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            const Spacer(),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class TagFilterButton extends StatelessWidget {
  final String text;

  const TagFilterButton ({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tooltip(
        message: text,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              )
            ),
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.onInverseSurface
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14.0, 
              color: Colors.black, 
              fontWeight: FontWeight.bold
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

Future<dynamic> _getVideoMetadata(String url) async {
  String embedUrl = "https://www.youtube.com/oembed?url=$url&format=json";

  var response = await http.get(Uri.parse(embedUrl));

  try {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      return null;
    }
  } on FormatException catch (e) {
    log('Error: invalid JSON ${e.toString()}');
    return null;
  }
}

class VideoThumbnail extends StatefulWidget {
  final String url;

  const VideoThumbnail(this.url, {super.key});

  @override
  State<VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  Future<dynamic>? metadata;

  @override
  void initState() {
    super.initState();
    metadata = _getVideoMetadata(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Thumbnail
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,  
            hoverColor: Colors.transparent,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FutureBuilder<dynamic>(
                future: metadata,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      snapshot.data['thumbnail_url'].toString().replaceAll('hqdefault', 'hq720'),
                      scale: 3.8,
                    );
                  } else {
                    // Empty widget while it loads
                    return Card(color: Theme.of(context).colorScheme.onPrimary);
                  }
                },
              ),
            ),
            onPressed: () {},
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,  
                    hoverColor: Colors.transparent,
                    icon: ClipOval(
                      child: Image.asset(
                        'icons/user_avatar.png',
                        width: 35,
                        height: 35,
                        fit: BoxFit.fill,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 45),
                ],
              ),

              const SizedBox(width: 6.0),

              Expanded(
                child: SizedBox(
                  width: 200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FutureBuilder<dynamic>(
                        future: metadata,
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                              ),
                              child: Text(
                                snapshot.data['title'],
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                              onPressed: () {},
                            );
                          } else {
                            return const Text ('');
                          }
                        },
                      ),
                      
                      FutureBuilder<dynamic>(
                        future: metadata,
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                height: 20.0,
                                child: TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                                  ),
                                  child: Text(
                                    snapshot.data['author_name'],
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14.0,
                                      color: Color.fromARGB(255, 105, 105, 105),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else {
                            return const Text ('');
                          }
                        },
                      ),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          height: 20.0,
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                            ),
                            child: const Text(
                              '216 mil visualizações • há 2 semanas',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 105, 105, 105),
                              )
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}