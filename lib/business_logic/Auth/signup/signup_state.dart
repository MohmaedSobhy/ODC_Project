abstract class SignupState {}

class SignupInitial extends SignupState {}

class GetSingupSuccessState extends SignupState {}

class GetSingupErrorState extends SignupState {}

class GetSingupLoadingState extends SignupState {}

class VisiblePasswordState extends SignupState {}

class VisibleConfirmPasswordState extends SignupState {}

class ChangeGenderState extends SignupState {}

class ChangeUniversityState extends SignupState {}
