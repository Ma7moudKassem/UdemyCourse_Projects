abstract class NewsState {}

class NewsInitialState extends NewsState{}

class NewsBottomNavState extends NewsState{}

class NewsGetBusinessSuccessState extends NewsState{}

class NewsGetBusinessErrorState extends NewsState{

  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsBusinessLoadingState extends NewsState{}


class NewsGetSportsSuccessState extends NewsState{}

class NewsGetSportsErrorState extends NewsState{

  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsSportsLoadingState extends NewsState{}


class NewsGetScienceSuccessState extends NewsState{}

class NewsGetScienceErrorState extends NewsState{

  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsScienceLoadingState extends NewsState{}

class NewsSearchLoadingState extends NewsState{}

class NewsGetSearchSuccessfulState extends NewsState{}

class NewsGetSearchErrorState extends NewsState{

  final String error;

  NewsGetSearchErrorState(this.error);

}

//class AppChangeModeState extends NewsState{}




