import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/app_images.dart';

class LinkList extends StatelessWidget {
  const LinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _LinkInBrowser(
            image: AppImages.link1,
            link: 'https://www.amazon.com/',
          ),
          _LinkInBrowser(
            image: AppImages.link2,
            link: 'https://www.macys.com/',
          ),
          _LinkInBrowser(
            image: AppImages.link3,
            link: 'https://www.ebay.com/',
          ),
          _LinkInBrowser(
            image: AppImages.link4,
            link: 'https://www.walmart.com/',
          ),
          _LinkInBrowser(
            image: AppImages.link5,
            link: 'https://rozetka.com.ua/',
          ),
          _LinkInBrowser(
            image: AppImages.link6,
            link: 'https://best.aliexpress.ru/',
          ),
          _LinkInBrowser(
            image: AppImages.link7,
            link: 'https://www.alibaba.com/',
          ),
        ],
      ),
    );
  }
}

class _LinkInBrowser extends StatelessWidget {
  const _LinkInBrowser({
    Key? key,
    required this.link,
    required this.image,
  }) : super(key: key);
  final String link;
  final String image;

  Future<void> _launchUrl(String link) async {
    final Uri _url = Uri.parse(
      link,
    );
    if (await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launchUrl(link),
          child: SizedBox(
            width: 100.0,
            height: 75.0,
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
