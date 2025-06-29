// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_services/api_services.dart' as _i671;
import '../../data/data_source_contract/articles_data_source.dart' as _i435;
import '../../data/data_source_contract/search_datasource.dart' as _i707;
import '../../data/data_source_contract/sources_data_source.dart' as _i1058;
import '../../data/data_source_impl/api%20_sources_data_source_impl.dart'
    as _i333;
import '../../data/data_source_impl/api_articles_data-source.dart' as _i695;
import '../../data/data_source_impl/search_data_source_impl.dart' as _i949;
import '../../data/repo_impl/article_repo_impl.dart' as _i237;
import '../../data/repo_impl/search_repo_impl.dart' as _i1008;
import '../../data/repo_impl/sources_repo_impl.dart' as _i564;
import '../../domain/repo_contract/article_repo.dart' as _i3;
import '../../domain/repo_contract/search_repo.dart' as _i404;
import '../../domain/repo_contract/sources_repo.dart' as _i484;
import '../../domain/use_cases/get_articles_usecases.dart' as _i442;
import '../../domain/use_cases/get_sources_use_cases.dart' as _i658;
import '../../domain/use_cases/search_use_cases.dart' as _i396;
import '../../provider/search_provider.dart' as _i932;
import '../../provider/view_model.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i671.APIServices>(() => _i671.APIServices());
    gh.factory<_i435.ArticlesDataSource>(
      () =>
          _i695.ApiArticlesDataSourceImpl(apiServices: gh<_i671.APIServices>()),
    );
    gh.factory<_i1058.SourcesDataSource>(
      () =>
          _i333.ApiSourcesDataSourceImpl(apiServices: gh<_i671.APIServices>()),
    );
    gh.factory<_i707.SearchDataSource>(
      () => _i949.SearchDataSourceImpl(gh<_i671.APIServices>()),
    );
    gh.factory<_i484.SourcesRepo>(
      () => _i564.SourcesRepoImpl(dataSource: gh<_i1058.SourcesDataSource>()),
    );
    gh.factory<_i658.GetSourceUsesCases>(
      () => _i658.GetSourceUsesCases(repository: gh<_i484.SourcesRepo>()),
    );
    gh.factory<_i3.ArticleRepo>(
      () => _i237.ArticleRepoImpl(
        articlesDataSource: gh<_i435.ArticlesDataSource>(),
      ),
    );
    gh.factory<_i404.SearchRepo>(
      () => _i1008.SearchRepoImpl(gh<_i707.SearchDataSource>()),
    );
    gh.factory<_i396.SearchUseCases>(
      () => _i396.SearchUseCases(repository: gh<_i404.SearchRepo>()),
    );
    gh.factory<_i932.SearchProvider>(
      () => _i932.SearchProvider(gh<_i396.SearchUseCases>()),
    );
    gh.factory<_i442.GetArticleUsesCases>(
      () => _i442.GetArticleUsesCases(repository: gh<_i3.ArticleRepo>()),
    );
    gh.factory<_i212.ViewModel>(
      () => _i212.ViewModel(
        articleUsesCases: gh<_i442.GetArticleUsesCases>(),
        sourcesUseCase: gh<_i658.GetSourceUsesCases>(),
      ),
    );
    return this;
  }
}
