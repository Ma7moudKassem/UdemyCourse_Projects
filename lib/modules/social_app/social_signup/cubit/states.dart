

abstract class SocialSignupState{}

class SocialSignupInitialState extends SocialSignupState{}

class SocialSignupLoadingState extends SocialSignupState{}

class SocialSignupSuccessState extends SocialSignupState{
}

class SocialSignupErrorState extends SocialSignupState
{
  final String error;

  SocialSignupErrorState(this.error);
}

class SocialChangePasswordVisibilityState extends SocialSignupState{}


class SocialCreateUserSuccessState extends SocialSignupState{
}

class SocialCreateUserErrorState extends SocialSignupState {
  final String error;

  SocialCreateUserErrorState(this.error);

}
