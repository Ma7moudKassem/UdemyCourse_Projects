abstract class SocialStates {}

class SocialInitialState extends SocialStates{}


class SocialGetLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {

  final String error;

  SocialGetUserErrorState(this.error);
}



class SocialChangeBottomNavState extends SocialStates{}



class SocialImageProfilePickedSuccessState extends SocialStates{}

class SocialImageProfilePickedErrorState extends SocialStates{}



class SocialImageCoverPickedSuccessState extends SocialStates{}

class SocialImageCoverPickedErrorState extends SocialStates{}


class SocialImagePostPickedSuccessState extends SocialStates{}

class SocialImagePostPickedErrorState extends SocialStates{}



class SocialUploadImageProfileSuccessState extends SocialStates{}

class SocialUploadImageProfileErrorState extends SocialStates{}



class SocialUploadImageCoverSuccessState extends SocialStates{}

class SocialUploadImageCoverErrorState extends SocialStates{}


class SocialUpdateUserLoadingState extends SocialStates{}
class SocialUpdateUserErrorState extends SocialStates{}

class SocialCreatePostLoadingState extends SocialStates{}

class SocialCreatePostSuccessState extends SocialStates{}

class SocialCreatePostErrorState extends SocialStates{
  final String error;

  SocialCreatePostErrorState(this.error);
}
class SocialRemovePostImageState extends SocialStates{}


class SocialGetPostLoadingState extends SocialStates{}

class SocialGetPostSuccessState extends SocialStates{}

class SocialGetPostErrorState extends SocialStates {
  final String error;

  SocialGetPostErrorState(this.error);
}

class SocialLikePostSuccessState extends SocialStates{}

class SocialLikePostErrorState extends SocialStates {
  final String error;
  SocialLikePostErrorState(this.error);
}

