import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager/colors_manager.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/provider/configuration_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key, required this.article});

  final ArticleEntity article;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
late ConfigProvider configProvider;

  @override
  Widget build(BuildContext context) {
     configProvider = Provider.of<ConfigProvider>(context);
    return InkWell(
      onTap: () {
        _showArticleDetailsBottomSheet(context);
      },
      child: Container(
        padding: REdgeInsets.all(8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1.w, color: configProvider.currentTheme == ThemeMode.dark ?ColorsManager.white : ColorsManager.black17),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            CachedNetworkImage(
              imageUrl: widget.article.urlToImage ?? "",
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10.h),
            Text(
              widget.article.title ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    widget.article.author ?? "",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: ColorsManager.grey,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    widget.article.publishedAt ?? "",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: ColorsManager.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showArticleDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,

      context: context,
      builder: (context) {
        return Container(
          padding: REdgeInsets.all(14),
          margin: REdgeInsets.all(14),
          decoration: BoxDecoration(
            color: configProvider.currentTheme == ThemeMode.dark ? ColorsManager.white : ColorsManager.black17,
            borderRadius: BorderRadius.circular(16.r)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: widget.article.urlToImage ?? "",
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 16.h,),
              Text(
                widget.article.description ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 16.h,),
              ElevatedButton(
                onPressed: () {
                  _launchUrl();
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.viewFullArticle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        );
      },

    );
  }

  void _launchUrl() async{

Uri url = Uri.parse(widget.article.url!);
    if(await canLaunchUrl(url)){
     await launchUrl(url,mode: LaunchMode.inAppBrowserView);
    }
  }
}
