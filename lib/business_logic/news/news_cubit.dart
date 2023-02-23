import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_shop_project/presentation/constantents/end_points.dart';

import '../../data/Local/cache_helper.dart';
import '../../data/Remote/dio_helper.dart';
import '../../data/model/news/NewsModel.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModel;

  //load news from api
  void getNews() {
    emit(NewsLoading());
    //print("Access Token from LoginModel: ${CacheHelper.get(key: "token")}\n");
    DioHelper.getData(
            url: EndPoint.newsEndPoint, token: CacheHelper.get(key: "token"))
        .then((value) {
      //print(value.data);
      newsModel = NewsModel.fromJson(value.data);
      emit(NewsSuccess());
    }).catchError((onError) {
      //print(onError);
      //print("Cannot load news");
      emit(NewsError());
    });
  }
}
