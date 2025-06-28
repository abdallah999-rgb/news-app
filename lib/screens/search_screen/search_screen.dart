import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager/colors_manager.dart';
import 'package:news_app/provider/configuration_provider.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:provider/provider.dart';
import '../../data/api_services/api_services.dart';
import '../../data/data_source_impl/search_data_source_impl.dart';
import '../../data/repo_impl/search_repo_impl.dart';
import '../../l10n/app_localizations.dart';
import '../home/source_view/article_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchProvider viewModel;

  late final TextEditingController searchController;
  late ConfigProvider configProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initViewModel();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  initViewModel() {
    viewModel = SearchProvider(SearchRepoImpl(SearchDataSourceImpl(APIServices())));

  }

  @override
  Widget build(BuildContext context) {
configProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChangeNotifierProvider(
            create: (context) => viewModel,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    viewModel.search(value);
                  },
                  controller: searchController,
                  style: Theme.of(context).textTheme.titleMedium,
                  cursorColor: configProvider.currentTheme == ThemeMode.dark ? ColorsManager.white : ColorsManager.black17,
                  textAlign: TextAlign.start,

                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search_outlined,

                    ),
                    hintText: AppLocalizations.of(context)!.search,
                    hintStyle: Theme.of(context).textTheme.titleMedium,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color:configProvider.currentTheme == ThemeMode.dark ? ColorsManager.white :ColorsManager.black17),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color:configProvider.currentTheme == ThemeMode.dark ? ColorsManager.white :ColorsManager.black17),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color:Colors.red),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color:configProvider.currentTheme == ThemeMode.dark ? ColorsManager.white :ColorsManager.black17),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Consumer<SearchProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (provider.errorMessage != null) {
                      return Center(child: Text(provider.errorMessage!,style: Theme.of(context).textTheme.bodyMedium,));
                    }
                    if (provider.articles.isEmpty) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.notFoundAnyArticles,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.separated(
                        padding: REdgeInsets.all(16),

                        itemBuilder:
                            (context, index) =>
                                ArticleItem(article: provider.articles[index]),
                        separatorBuilder:
                            (context, index) => SizedBox(height: 16.h),
                        itemCount: provider.articles.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
