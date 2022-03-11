import 'package:domain/entities/api_base_request.dart';

class HomeStepFields implements ApiBaseJsonRequest {
  final String? email;
  final String? password;

  HomeStepFields(this.password, this.email);

  @override
  Map<String, dynamic> toJson() => {
        "contact": {
          "email": email,
          "password": password,
        }
      };
}
