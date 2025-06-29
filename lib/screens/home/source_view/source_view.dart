import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/dependency_injection/di.dart';
import 'package:news_app/core/widgets/error_state_widget.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_impl/api%20_sources_data_source_impl.dart';
import 'package:news_app/data/data_source_impl/api_articles_data-source.dart';
import 'package:news_app/domain/use_cases/get_articles_usecases.dart';
import 'package:news_app/domain/use_cases/get_sources_use_cases.dart';
import 'package:news_app/provider/view_model.dart';
import 'package:news_app/screens/home/source_view/article_item.dart';
import 'package:provider/provider.dart';
import '../../../data/models/category_model.dart';
import '../../../data/repo_impl/article_repo_impl.dart';
import '../../../data/repo_impl/sources_repo_impl.dart';

class SourceView extends StatefulWidget {
  SourceView({super.key, required this.category});

  CategoryModel category;

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  late ViewModel sourcesViewProvider;
  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    sourcesViewProvider = getIt<ViewModel>();
    await sourcesViewProvider.loadSources(widget.category);
    await sourcesViewProvider.loadArticles(
      (sourcesViewProvider.sourcesState as SourcesSuccessState).sources[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sourcesViewProvider,
      child: Column(
        children: [
          Consumer<ViewModel>(
            builder: (context, sourcesViewProvider, child) {
              var state = sourcesViewProvider.sourcesState;
              switch (state) {
                case SourcesSuccessState():
                  return DefaultTabController(
                    length: state.sources.length,

                    child: TabBar(
                      onTap: (value) {
                        sourcesViewProvider.loadArticles(state.sources[value]);
                      },
                      isScrollable: true,
                      tabs:
                          state.sources
                              .map((source) => Tab(text: source.name))
                              .toList(),
                    ),
                  );
                case SourcesLoadingState():
                  return Center(child: CircularProgressIndicator());

                case SourcesErrorState():
                  return ErrorStateWidget(
                    generalEX: state.generalEX,
                    serverError: state.serverError,
                  );
              }
            },
          ),
          SizedBox(height: 14.h),
          Consumer<ViewModel>(
            builder: (context, sourcesViewProvider, child) {
              var state = sourcesViewProvider.articlesState;
              switch (state) {
                case ArticlesSuccessState():
                  return Expanded(
                    child: ListView.separated(
                      padding: REdgeInsets.all(16),

                      itemBuilder:
                          (context, index) =>
                              ArticleItem(article: state.articles[index]),
                      separatorBuilder:
                          (context, index) => SizedBox(height: 16.h),
                      itemCount: state.articles.length,
                    ),
                  );
                case ArticlesLoadingState():
                  return Expanded(
                    child: Column(
                      children: [
                        Spacer(),
                        CircularProgressIndicator(),
                        Spacer(),
                      ],
                    ),
                  );
                case ArticlesErrorState():
                  return ErrorStateWidget(
                    generalEX: state.generalEX,
                    serverError: state.serverError,
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
