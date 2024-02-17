import 'package:flutter/material.dart';
import 'classes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Mock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const YoutubeHomePage(),
    );
  }
}

class YoutubeHomePage extends StatefulWidget {
  const YoutubeHomePage({super.key});

  @override
  State<YoutubeHomePage> createState() => _YoutubeHomePageState();
}

class _YoutubeHomePageState extends State<YoutubeHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showSideBar = false;
  bool _youSectionShowMore = false;
  bool _subsSectionShowMore = false;

  IntrinsicWidth _sideBarClosed() {
    return const IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
      
          ClosedSideBarButton(
            icon: Icon(Icons.home, color: Colors.black, size: 30.0,),
            text: 'Início'
          ),
      
          SizedBox(height: 30.0),
      
          ClosedSideBarButton(
            icon: ImageIcon(
              AssetImage('icons/yt_shorts_icon.png'),
              color: Colors.black,
              size: 30,
            ),
            text: 'Shorts'
          ),
      
          SizedBox(height: 30.0),
      
          ClosedSideBarButton(
            icon: ImageIcon(
              AssetImage('icons/yt_subscriptions_icon.png'),
              color: Colors.black,
              size: 26,
            ),
            text: 'Inscrições'
          ),
      
          SizedBox(height: 30.0),
      
          ClosedSideBarButton(
            icon: ImageIcon(
              AssetImage('icons/yt_you_icon.png'),
              color: Colors.black,
              size: 26,
            ),
            text: 'Você'
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _sideBarOpened() {
    return SingleChildScrollView(
      child: SizedBox(
        width: 230.0,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(end: 20.0),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16.0),
                    
                const OpenedSideBarButton(
                  icon: Icon(Icons.home, color: Colors.black, size: 30.0,),
                  text: 'Início',
                ),
                    
                const SizedBox(height: 16.0),
                    
                const OpenedSideBarButton(
                  icon: ImageIcon(
                    AssetImage('icons/yt_shorts_icon.png'),
                    color: Colors.black,
                    size: 30,
                  ),
                  text: 'Shorts',
                ),
                    
                const SizedBox(height: 16.0),
                    
                const OpenedSideBarButton(
                  icon: ImageIcon(
                    AssetImage('icons/yt_subscriptions_icon.png'),
                    color: Colors.black,
                    size: 26,
                  ),
                  text: 'Inscrições'
                ),
                    
                const Divider(
                  height: 36,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.grey,
                ),
                    
                Column(
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                        )
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Você',
                            style: TextStyle(
                              fontSize: 16.0, 
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right_sharp, color: Colors.black,),
                          Spacer(),
                        ],
                      ),
                      onPressed: () {},
                    ),

                    const SizedBox(height: 16.0),

                    const OpenedSideBarButton(
                      icon: ImageIcon(
                        AssetImage('icons/your_channel_icon.png'),
                        color: Colors.black,
                        size: 26,
                      ),
                      text: 'Seu canal'
                    ),

                    const SizedBox(height: 16.0),

                    const OpenedSideBarButton(
                      icon: ImageIcon(
                        AssetImage('icons/history_icon.png'),
                        color: Colors.black,
                        size: 26,
                      ),
                      text: 'Histórico'
                    ),

                    const SizedBox(height: 16.0),

                    const OpenedSideBarButton(
                      icon: ImageIcon(
                        AssetImage('icons/your_videos_icon.png'),
                        color: Colors.black,
                        size: 26,
                      ),
                      text: 'Seus vídeos'
                    ),

                    const SizedBox(height: 16.0),

                    const OpenedSideBarButton(
                      icon: ImageIcon(
                        AssetImage('icons/your_courses_icon.png'),
                        color: Colors.black,
                        size: 26,
                      ),
                      text: 'Seus cursos'
                    ),

                    const SizedBox(height: 16.0),

                    const OpenedSideBarButton(
                      icon: ImageIcon(
                        AssetImage('icons/watch_later_icon.png'),
                        color: Colors.black,
                        size: 26,
                      ),
                      text: 'Assistir mais tarde'
                    ),

                    const SizedBox(height: 16.0),

                    const OpenedSideBarButton(
                      icon: ImageIcon(
                        AssetImage('icons/your_clips_icon.png'),
                        color: Colors.black,
                        size: 26,
                      ),
                      text: 'Seus clipes'
                    ),

                    const SizedBox(height: 16.0),

                    if (_youSectionShowMore) ...[
                      const OpenedSideBarButton(
                        icon: ImageIcon(
                          AssetImage('icons/liked_videos_icon.png'),
                          color: Colors.black,
                          size: 26,
                        ),
                        text: 'Vídeos marcados com gostei',
                      ),

                      const SizedBox(height: 16.0),

                      TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                          )
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_upward, color: Colors.black,),
                            SizedBox(width: 24.0),
                            Text(
                              'Mostrar menos',
                              style: TextStyle(fontSize: 14.0, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            _youSectionShowMore = !_youSectionShowMore;
                          });
                        },
                      ),
                    ] else ...[
                      TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                          )
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_downward, color: Colors.black,),
                            SizedBox(width: 24.0),
                            Text(
                              'Mostrar mais',
                              style: TextStyle(fontSize: 14.0, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            _youSectionShowMore = !_youSectionShowMore;
                          });
                        },
                      ),
                    ],
                  ]
                ),

                const Divider(
                  height: 36,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.grey,
                ),

                Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Inscrições',
                            style: TextStyle(
                              fontSize: 16.0, 
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16.0),

                    OpenedSideBarButton(
                      icon: ClipOval(
                        child: Image.asset(
                          'icons/user_avatar.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill  
                        ),
                      ),
                      text: 'Inscrição1'
                    ),

                    const SizedBox(height: 16.0),

                    OpenedSideBarButton(
                      icon: ClipOval(
                        child: Image.asset(
                          'icons/user_avatar.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill  
                        ),
                      ),
                      text: 'Inscrição2'
                    ),

                    const SizedBox(height: 16.0),

                    OpenedSideBarButton(
                      icon: ClipOval(
                        child: Image.asset(
                          'icons/user_avatar.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill  
                        ),
                      ),
                      text: 'Inscrição3'
                    ),

                    const SizedBox(height: 16.0),

                    OpenedSideBarButton(
                      icon: ClipOval(
                        child: Image.asset(
                          'icons/user_avatar.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill  
                        ),
                      ),
                      text: 'Inscrição4'
                    ),

                    const SizedBox(height: 16.0),

                    OpenedSideBarButton(
                      icon: ClipOval(
                        child: Image.asset(
                          'icons/user_avatar.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill  
                        ),
                      ),
                      text: 'Inscrição5'
                    ),

                    const SizedBox(height: 16.0),

                    if (_subsSectionShowMore) ...[
                      OpenedSideBarButton(
                        icon: ClipOval(
                          child: Image.asset(
                            'icons/user_avatar.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.fill  
                          ),
                        ),
                        text: 'Inscrição6'
                      ),

                      const SizedBox(height: 16.0),

                      OpenedSideBarButton(
                        icon: ClipOval(
                          child: Image.asset(
                            'icons/user_avatar.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.fill  
                          ),
                        ),
                        text: 'Inscrição7'
                      ),

                      const SizedBox(height: 16.0),

                      OpenedSideBarButton(
                        icon: ClipOval(
                          child: Image.asset(
                            'icons/user_avatar.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.fill  
                          ),
                        ),
                        text: 'Inscrição8'
                      ),

                      const SizedBox(height: 16.0),

                      TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                          )
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_upward, color: Colors.black,),
                            SizedBox(width: 24.0),
                            Text(
                              'Mostrar menos',
                              style: TextStyle(fontSize: 14.0, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            _subsSectionShowMore = !_subsSectionShowMore;
                          });
                        },
                      ),
                    ] else ...[
                      TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                          )
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_downward, color: Colors.black,),
                            SizedBox(width: 24.0),
                            Text(
                              'Mostrar mais',
                              style: TextStyle(fontSize: 14.0, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            _subsSectionShowMore = !_subsSectionShowMore;
                          });
                        },
                      ),
                    ],
                  ],
                ),

                const Divider(
                  height: 36,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.grey,
                ),

                const OpenedSideBarButton(
                  icon: Icon(Icons.settings, color: Colors.black,),
                  text: 'Configurações'
                ),

                const SizedBox(height: 16.0),

                const OpenedSideBarButton(
                  icon: Icon(Icons.flag, color: Colors.black,),
                  text: 'Histórico de denúncias'
                ),

                const SizedBox(height: 16.0),

                const OpenedSideBarButton(
                  icon: Icon(Icons.help, color: Colors.black,),
                  text: 'Ajuda'
                ),

                const SizedBox(height: 16.0),

                const OpenedSideBarButton(
                  icon: Icon(Icons.feedback, color: Colors.black,),
                  text: 'Enviar feedback'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const ImageIcon(
                    AssetImage('icons/drawer_icon.png'),
                    color: Color.fromARGB(255, 160, 153, 153),
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      _showSideBar = !_showSideBar;
                    });
                  },
                ),

                const SizedBox(width: 10),

                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,  
                  hoverColor: Colors.transparent,
                  tooltip: 'Página inicial do Youtube',
                  icon: Image.asset(
                    'icons/youtube_logo.png',
                    width: 134,
                    height: 30,
                    fit: BoxFit.fill  
                  ),
                  onPressed: () {},
                ),

                const Spacer(),

                SizedBox(
                  width: 700.0,
                  height: 40.0,
                  child: TextField(
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                      suffixIcon: IconButton(
                        tooltip: 'Pesquisar',
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 190, 183, 183),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 34, 20, 228),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10.0),

                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                  child: IconButton(
                    tooltip: 'Pesquisar com sua voz',
                    icon: Image.asset(
                      'icons/mic_icon.png',
                      width: 134,
                      height: 30,
                      fit: BoxFit.fill  
                    ),
                    onPressed: () {},
                  ),
                ),

                const Spacer(),

                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Criar',
                  onPressed: () {},
                ),

                IconButton(
                  icon: const Icon(Icons.notifications),
                  tooltip: 'Notificações',
                  onPressed: () {},
                ),

                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,  
                  hoverColor: Colors.transparent,
                  icon: ClipOval(
                    child: Image.asset(
                      'icons/user_avatar.png',
                      width: 35,
                      height: 35,
                      fit: BoxFit.fill  
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
        ),
      ),

      body: Row(
        children: [
          const SizedBox(width: 10.0),
          _showSideBar ? _sideBarOpened() : _sideBarClosed(),
          const SizedBox(width: 20.0),

          Expanded(
            child: Column(
              children: <Widget>[
                // Tag filter buttons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left),
                      tooltip: 'Anterior',
                      onPressed: () {
                        _scrollController.animateTo(
                          _scrollController.offset - 300, 
                          duration: const Duration(milliseconds: 100), 
                          curve: Curves.easeIn
                        );
                      }, 
                    ),

                    const SizedBox(width: 14.0),

                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ListView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          children: const <Widget>[
                            TagFilterButton(text: 'Tudo'),
                            TagFilterButton(text: 'Música'),
                            TagFilterButton(text: 'Jogos'),
                            TagFilterButton(text: 'Jogos eletrônicos cooperativos'),
                            TagFilterButton(text: 'Jogos de estratégia em tempo real'),
                            TagFilterButton(text: 'Ao vivo'),
                            TagFilterButton(text: 'Animais'),
                            TagFilterButton(text: 'Listas de reprodução'),
                            TagFilterButton(text: 'Mixes'),
                            TagFilterButton(text: 'Carros'),
                            TagFilterButton(text: 'Séries'),
                            TagFilterButton(text: 'Filmes'),
                            TagFilterButton(text: 'Tecnologia'),
                            TagFilterButton(text: 'Restaurantes'),
                            TagFilterButton(text: 'Enviados recentemente'),
                            TagFilterButton(text: 'Assistidos'),
                            TagFilterButton(text: 'Novidades para você'),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 14.0),

                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      tooltip: 'Próximo',
                      onPressed: () {
                        _scrollController.animateTo(
                          _scrollController.offset + 300, 
                          duration: const Duration(milliseconds: 100), 
                          curve: Curves.easeIn
                        );
                      }, 
                    )
                  ],
                ),

                // Thumbnails
                const Expanded(
                  child: SingleChildScrollView(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              VideoThumbnail('https://www.youtube.com/watch?v=eUCm4wKarpQ'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=1AElONvi9WQ'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=9PphqxLGIyg'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=b54cMOblOOw'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=ClnfpxfROMc'),
                            ],
                          ),

                          SizedBox(height: 24.0),

                          Row(
                            children: [
                              VideoThumbnail('https://www.youtube.com/watch?v=wXcWNMkoNPg'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=OKR9Y7blY0Q'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=ueJr_rlzLa0'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=K62EMzueWwA'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=pffJ1nDRei0'),
                            ],
                          ),
                          
                          SizedBox(height: 24.0),

                          Row(
                            children: [
                              VideoThumbnail('https://www.youtube.com/watch?v=lNidv12q0sY'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=gpjUu2g8fOY'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=dOV0HIh4DoQ'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=ytvBhLGLMrA'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=ALmS9E87LCg'),
                            ],
                          ),
                          
                          SizedBox(height: 24.0),

                          Row(
                            children: [
                              VideoThumbnail('https://www.youtube.com/watch?v=0T9pKIse7TE'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=1t9RcxV9dUg'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=BrRlXt_h_AY'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=VcqfFYhHT-o'),
                              SizedBox(width: 10.0),
                              VideoThumbnail('https://www.youtube.com/watch?v=vvjmide4aE0'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

