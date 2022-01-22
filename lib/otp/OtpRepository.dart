import 'dart:convert';

import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/model/RegisterApi.dart';

import 'model/VerifyMobileResponse.dart';

class OtpRepository {
  final String _apiKey = "78b9f63937763a206bff26c070b94158";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<RegisterApi> register(Map body) async {
    //final response = await _helper.get("movie/popular?api_key=$_apiKey");
    print("mapreq");
    print(jsonEncode(body));
    final response = await _helper.post("api/register", body);
    print("otp response");
    print(jsonEncode(response));
    return RegisterApi.fromJson(response);
  }

  Future<VerifyMobileModel> verifyMobile(Map body, String token) async {
    print("end_point--- 'api/verify/mobile");
    //final response = await _helper.get("movie/popular?api_key=$_apiKey");
    /*String token =
        " Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTIyNGJiMDAxYjQwY2MxNjhjMzM3YThkNDRhMjRhYmViOGE5NTllZDRkZDNhZTU5NzQxMjlmZTA4YTgwZDY2Y2UwOGJjM2M0OGViMDJmNjkiLCJpYXQiOjE1OTY0MTcwNjAsIm5iZiI6MTU5NjQxNzA2MCwiZXhwIjoxNjI3OTUzMDYwLCJzdWIiOiIxOCIsInNjb3BlcyI6W119.x1rVUKAozm-EfWdQ2FKXtKsysPKKgYPubmEKsAW2ux6A0uqdrBG3H0RiNdT3cnN1l8CP55AFrkFOZQzi3LeJljDOG55tnD6TQrZCtvKwVTXZS_CIEM2nUa-zYi7G5txupAQLT0NM7-8PzleMkhgcisoH0muSJHBzfPCErgymjk5iNuSVKAG627Gq5mrIM-T3vz7haHPNKvWm_2LotQEu4jBIe8tdES7t_gL6Ok6ZrtIFbYe4--26-85k1zZkMbO8k-_y1_bDH4aqj59m44lI3DV2FvTK4EIM5cdxrMWCIInZsXx0Jdlv8UmZeL7q_b38KjPt9cfmyqGpagaXhyF_tYkkirkNLGhSR872tDEtkt_2heUZvMEfAvPczOBA-39DUovZ9g0zWp7Y4t7ir4SQm66vImOqdYUB7IX9cb8wWt0RWRR0bM5m90cXOY7i24T-3Q-zwMEZeYB_Knu_6pOoOkKGQ2SdkhHVnjgVA9IuvfrDA83rtmArRSh6TACo4_cG2hvomqs3ch6Ib8VmnwOUY3Rx0sk7QScM9_EuRrbRuPbirhsNJbL6RuREmeA7go2eoo26GpUHbVpUWUtXp2kPAFTpzEsIG0LSadPGwcd84GbpIGHCDY56P2xvtDPlcfieRYT_hU0cZoBhGakNUOeveY7x9t3o_dQsoUlNbE_MlKg";*/
    final response = await _helper.postWithHeader("api/verify/mobile", body, token);
    return VerifyMobileModel.fromJson(response);
  }
}
