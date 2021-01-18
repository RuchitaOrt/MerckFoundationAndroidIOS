import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:merckfoundation22dec/model/GetFirstLadiesInitaiveResponse.dart';
import 'package:merckfoundation22dec/model/StrategyResponse.dart';
import 'package:merckfoundation22dec/model/dataprivacy.dart';
import 'package:merckfoundation22dec/model/empoweingbernavideo.dart';
import 'package:merckfoundation22dec/model/empoweringbernacontentResponse.dart';
import 'package:merckfoundation22dec/model/getMerckTestimonialResp.dart';
import 'package:merckfoundation22dec/model/getNewsRelease.dart';
import 'package:merckfoundation22dec/model/getStoriesResponse.dart';
import 'package:merckfoundation22dec/model/leadershipTeamResponse.dart';
import 'package:merckfoundation22dec/model/legaldisclaimerResponse.dart';
import 'package:merckfoundation22dec/model/merckFoundationMediaResp.dart';
import 'package:merckfoundation22dec/model/mmtmResponse.dart';
import 'package:merckfoundation22dec/model/newsLettersArticlesResp.dart';
import 'package:merckfoundation22dec/model/ourActivitiesObjectiveResp.dart';
import 'package:merckfoundation22dec/model/ourActivitiesResponse.dart';
import 'package:merckfoundation22dec/model/ourPartnerObjectivesResp.dart';
import 'package:merckfoundation22dec/model/ourPartnerResponse.dart';
import 'package:merckfoundation22dec/model/ourmissionResponse.dart';
import 'package:merckfoundation22dec/model/ourpolicy.dart';
import 'package:merckfoundation22dec/model/visionResponse.dart';
import 'package:merckfoundation22dec/utility/AppEror.dart';
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart';
import 'package:merckfoundation22dec/model/callforapplicationResponse.dart';

enum API {
  vision,
  legaldisclaimer,
  ourmission,
  ourActivities,
  ourActivitiesObjectives,
  ourPolicies,
  dataPrivacy,

  //////
  newsRelease,
  newsletters,
  merckfoundationinmedia,
  callforapplication,
  videoLibrary,
  getStories,
  merckTestimonial,

  leadershipTeam,
  leadership,

  ourPartner,
  ourPartnerObjectives,

  //ourprogram
  strategy,
  firstladiesinitiative,
  mmtmprogram,
  empoweringbernacontent,
  empoweringbernavideo,

  //ourprogram - merck more than mother
  merckmotherSlider,
  merckmotherContent,
  merckmotherVideos,
  merckmotherLatestUpdates,
  merckmotherCallApplication,
  merckmotherDigitalLib,
  merckmotherMedia,
  merckmotherTestimonial,

  //ourProgram - merck-fertility-and-embryology-training-program

  merckFertilityContent,
  merckFertilityVideos,
  merckFertilityTestimonials,





 

}

enum HTTPMethod { GET, POST, PUT, DELETE }

typedef successCallback = void Function(dynamic response);
typedef progressCallback = void Function(int progress);
typedef failureCallback = void Function(AppError error);

class APIManager {
  static Duration timeout;
  static String token;
  static String baseURL;
  static String apiVersion;
  var taskId;

  APIManager._privateConstructor();
  static final APIManager _instance = APIManager._privateConstructor();

  factory APIManager() {
    return _instance;
  }

  void loadConfiguration(String configString) {
    Map config = jsonDecode(configString);
    var env = config['environment'];
    baseURL = config[env]['hostUrl'];
    apiVersion = config['version'];
    timeout = Duration(seconds: config[env]['timeout']);
    print('load config' + configString);
  }

  void setToken(String value) {
    token = value;
  }

  String apiBaseURL() {
    return baseURL;
  }

  Future<String> apiEndPoint(API api) async {
    var apiPathString = "";
    if (Platform.isAndroid) {
      // Android-specific code
      print("This is android");
      switch (api) {
        case API.vision:
          apiPathString = "show/vision/13/Android/1";
          break;

        case API.legaldisclaimer:
          apiPathString = "show/legal-disclaimer/13/Android/1";
          break;

        case API.ourmission:
          apiPathString = "show/mission/13/Android/1";
          break;

        case API.ourActivities:
          apiPathString = "show/our-activities/23/Android/1";
          break;

        case API.ourActivitiesObjectives:
          apiPathString = "show/our-activities/13/Android/1";
          break;

        case API.ourPolicies:
          apiPathString = "show/our-policies/13/Android/1";
          break;

        case API.leadershipTeam:
          apiPathString = "show/message-from-leadership-team/13/Android/1";
          break;

        case API.leadership:
          apiPathString = "show/leadership/19/Android/1";
          break;

        case API.dataPrivacy:
          apiPathString = "show/data-privacy/13/Android/1";
          break;

        case API.newsRelease:
          apiPathString = "show/news-releases/16/Android/1";
          break;
        case API.newsletters:
          apiPathString = "show/newsletters-and-articles/23/Android/1";
          break;
        case API.merckfoundationinmedia:
          apiPathString = "show/merck-foundation-in-media/20/Android/1";
          break;
        case API.callforapplication:
          apiPathString = "call_for_app/call-for-application/9";
          break;
        case API.videoLibrary:
          apiPathString = "show/Video-Library/14/Android/1";
          break;

        case API.ourPartner:
          apiPathString = "show/our-partners/17/Android/1";
          break;

        case API.ourPartnerObjectives:
          apiPathString = "show/our-partners/13/Android/1";
          break;
        case API.getStories:
          apiPathString = "show/stories/14/Android/1";
          break;

        case API.merckTestimonial:
          apiPathString =
              "show/merck-foundation-alumnis-testimonies/14/Android/1";
          break;
        case API.strategy:
          apiPathString = "show/strategy/13/Android/1";
          break;
        case API.firstladiesinitiative:
          apiPathString =
              "show/merck-foundation-first-ladies-initiative-summit/13/Android/1";
          break;
        case API.mmtmprogram:
          apiPathString = "MMTM_Videos_list/merck-more-than-a-mother/Android/1";
          break;
        case API.empoweringbernacontent:
          apiPathString = "show/empowering-berna/13/Android/1";
          break;
        case API.empoweringbernavideo:
          apiPathString = "show/empowering-berna/14/Android/1";
          break;

        case API.merckmotherSlider:
          apiPathString = "show/merck-more-than-a-mother/5/Android/1";
          break;

        case API.merckmotherContent:
          apiPathString = "show/merck-more-than-a-mother/13/Android/1";
          break;

        case API.merckmotherVideos:
          apiPathString = "show/merck-more-than-a-mother/14/Android/1";
          break;

        case API.merckmotherLatestUpdates:
          apiPathString = "show/merck-more-than-a-mother/23/Android/1";
          break;

        case API.merckmotherCallApplication:
          apiPathString = "show/merck-more-than-a-mother/9/Android/1";
          break;  

                case API.merckmotherDigitalLib:
          apiPathString = "show/merck-more-than-a-mother/22/Android/1";
          break; 

           case API.merckmotherMedia:
          apiPathString = "show/merck-more-than-a-mother/20/Android/1";
          break; 

           case API.merckmotherTestimonial:
          apiPathString = "show/merck-more-than-a-mother/18/Android/1";
          break; 

           case API.merckFertilityContent:
          apiPathString = "show/merck-fertility-and-embryology-training-program/13/Android/1";
          break;

            case API.merckFertilityVideos:
          apiPathString = "show/merck-fertility-and-embryology-training-program/14/Android/1";
          break;   

            case API.merckFertilityTestimonials:
          apiPathString = "show/merck-fertility-and-embryology-training-program/18/Android/1";
          break;




          



        default:
          apiPathString = "";
      }
      print(apiBaseURL());
    } else if (Platform.isIOS) {
      // iOS-specific code
      print("This is ios");
      switch (api) {
        case API.vision:
          apiPathString = "show/vision/13/IOS/1";
          break;

        case API.legaldisclaimer:
          apiPathString = "show/legal-disclaimer/13/IOS/1";
          break;

        case API.ourmission:
          apiPathString = "show/mission/13/IOS/1";
          break;

        case API.ourActivities:
          apiPathString = "show/our-activities/23/IOS/1";
          break;

        case API.ourActivitiesObjectives:
          apiPathString = "show/our-activities/13/IOS/1";
          break;

        case API.ourPolicies:
          apiPathString = "show/our-policies/13/IOS/1";
          break;

        case API.leadershipTeam:
          apiPathString = "show/message-from-leadership-team/13/IOS/1";
          break;

        case API.leadership:
          apiPathString = "show/leadership/19/IOS/1";
          break;

        case API.dataPrivacy:
          apiPathString = "show/data-privacy/13/IOS/1";
          break;

        case API.newsRelease:
          apiPathString = "show/news-releases/16/IOS/1";
          break;
        case API.newsletters:
          apiPathString = "show/newsletters-and-articles/23/IOS/1";
          break;
        case API.merckfoundationinmedia:
          apiPathString = "show/merck-foundation-in-media/20/IOS/1";
          break;
        case API.callforapplication:
          apiPathString = "call_for_app/call-for-application/9";
          break;
        case API.videoLibrary:
          apiPathString = "show/Video-Library/14/IOS/1";
          break;

        case API.ourPartner:
          apiPathString = "show/our-partners/17/IOS/1";
          break;

        case API.ourPartnerObjectives:
          apiPathString = "show/our-partners/13/IOS/1";
          break;

        case API.getStories:
          apiPathString = "show/stories/14/IOS/1";
          break;

        case API.merckTestimonial:
          apiPathString = "show/merck-foundation-alumnis-testimonies/14/IOS/1";
          break;

        case API.strategy:
          apiPathString = "show/strategy/13/IOS/1";
          break;
        case API.firstladiesinitiative:
          apiPathString =
              "show/merck-foundation-first-ladies-initiative-summit/13/IOS/1";
          break;
        case API.mmtmprogram:
          apiPathString = "MMTM_Videos_list/merck-more-than-a-mother/IOS/1";
          break;

        case API.empoweringbernacontent:
          apiPathString = "show/empowering-berna/13/IOS/1";
          break;
        case API.empoweringbernavideo:
          apiPathString = "show/empowering-berna/14/IOS/1";
          break;

        case API.merckmotherSlider:
          apiPathString = "show/merck-more-than-a-mother/5/IOS/1";
          break;

        case API.merckmotherContent:
          apiPathString = "show/merck-more-than-a-mother/13/IOS/1";
          break;

        case API.merckmotherVideos:
          apiPathString = "show/merck-more-than-a-mother/14/IOS/1";
          break;

        case API.merckmotherLatestUpdates:
          apiPathString = "show/merck-more-than-a-mother/23/IOS/1";
          break;


           case API.merckmotherCallApplication:
          apiPathString = "show/merck-more-than-a-mother/9/IOS/1";
          break;  

                case API.merckmotherDigitalLib:
          apiPathString = "show/merck-more-than-a-mother/22/IOS/1";
          break; 

           case API.merckmotherMedia:
          apiPathString = "show/merck-more-than-a-mother/20/IOS/1";
          break; 

           case API.merckmotherTestimonial:
          apiPathString = "show/merck-more-than-a-mother/18/IOS/1";
          break;  

            case API.merckFertilityContent:
          apiPathString = "show/merck-fertility-and-embryology-training-program/13/IOS/1";
          break;

            case API.merckFertilityVideos:
          apiPathString = "show/merck-fertility-and-embryology-training-program/14/IOS/1";
          break;   

            case API.merckFertilityTestimonials:
          apiPathString = "show/merck-fertility-and-embryology-training-program/18/IOS/1";
          break;




        default:
          apiPathString = "";
      }
      print(apiBaseURL());
    }

    return this.apiBaseURL() + apiPathString;
  }

  HTTPMethod apiHTTPMethod(API api) {
    HTTPMethod method;
    switch (api) {
      // case API.vision:
      // case API.legaldisclaimer:
      //  case API.mission:
      //  case API.ourActivities:
      //   case API.ourPolicies:
      //    case API.dataPrivacy:

      //   method = HTTPMethod.POST;
      //   break;

      default:
        method = HTTPMethod.GET;
    }
    return method;
  }

  String classNameForAPI(API api) {
    String className;
    switch (api) {
      case API.vision:
        className = "VisionResponse";
        break;
      case API.legaldisclaimer:
        className = "LegaldisclaimerResponse";
        break;
      case API.ourmission:
        className = "OurmissionResponse";
        break;
      case API.ourActivities:
        className = "OurActivitiesResponse";
        break;

      case API.ourActivitiesObjectives:
        className = "OurActivitiesObjectivesResponse";
        break;

      case API.ourPolicies:
        className = "OurPoliciesResponse";
        break;

      case API.dataPrivacy:
        className = "DataPrivacyResponse";
        break;

      case API.newsRelease:
        className = "NewsReleaseResponse";
        break;
      case API.newsletters:
        className = "NewsLetterseResponse";
        break;

      case API.merckfoundationinmedia:
        className = "merckFoundationMediaResponse";
        break;

      case API.callforapplication:
        className = "callforapplicationResponse";
        break;

      case API.videoLibrary:
        className = "VidepLibraryResponse";
        break;
      case API.getStories:
        className = "StoriesResponse";
        break;

      case API.leadershipTeam:
        className = "LeadershipTeamResponse";
        break;

      case API.ourPartnerObjectives:
        className = "OurPartnerObjectivesResp";
        break;

      case API.ourPartner:
        className = "OurPartnerResp";
        break;

      case API.merckTestimonial:
        className = "MerckTestimonialResp";
        break;
      case API.strategy:
        className = "StrategyResponse";
        break;
      case API.firstladiesinitiative:
        className = "FirstLadiesInitiativeResponse";
        break;
      case API.mmtmprogram:
        className = "MMTMResponse";
        break;

      case API.empoweringbernacontent:
        className = "empoweringbernacontentResponse";
        break;
      case API.empoweringbernavideo:
        className = "empoweringbernavideoResponse";
        break;

      case API.merckmotherSlider:
        className = "getMerckmotherSliderResp";

        break;

      case API.merckmotherContent:
        className = "getMerckmotherContentResp";
        break;

      case API.merckmotherVideos:
        className = "getMerckmotherVideosResp";
        break;
      case API.merckmotherLatestUpdates:
        className = "getMerckmotherLatestUpdatesResp";
        break;


       case API.merckmotherCallApplication:
        className = "getMerckmotherCallAppliResp";
        break;  

         case API.merckmotherDigitalLib:
        className = "getMerckmotherDigitalLibResp";
        break;

 case API.merckmotherMedia:
        className = "getMerckmotherMediaResp";
        break;


         case API.merckmotherTestimonial:
        className = "getMerckmotherTestimonialResp";
        break;

         case API.merckFertilityContent:
        className = "getMerckFertilityContentResp";
        break;
          case API.merckFertilityVideos:
        className = "getMerckFertilityVideosResp";
        break;
          case API.merckFertilityTestimonials:
        className = "getMerckFertilityTestimonialResp";
        break;




      case API.leadership:
        className = "";
        break;

      default:
        className = 'CommonResponse';
    }
    return className;
  }

  dynamic parseResponse(String className, var json) {
    dynamic responseObj;
    if (className == 'VisionResponse') {
      responseObj = VisionResponse.fromJson(json);
    }
    if (className == 'LegaldisclaimerResponse') {
      responseObj = LegaldisclaimerResponse.fromJson(json);
    }
    if (className == 'OurmissionResponse') {
      responseObj = OurmissionResponse.fromJson(json);
    }
    if (className == 'OurActivitiesResponse') {
      responseObj = OurActivityResponse.fromJson(json);
    }
    if (className == 'OurActivitiesObjectivesResponse') {
      responseObj = OurActivityObjectiveResponse.fromJson(json);
    }
    if (className == 'OurPoliciesResponse') {
      responseObj = OurpolicyResponse.fromJson(json);
    }
    if (className == 'DataPrivacyResponse') {
      responseObj = DataprivacyResponse.fromJson(json);
    }
    if (className == 'LeadershipTeamResponse') {
      responseObj = MessageFromleadershipResponse.fromJson(json);
    }

    if (className == 'StoriesResponse') {
      responseObj = GetStoriesResponse.fromJson(json);
    }

    if (className == 'NewsLetterseResponse') {
      responseObj = NewsletterArticleResponse.fromJson(json);
    }

    if (className == 'NewsReleaseResponse') {
      responseObj = NewsreleaseResponse.fromJson(json);
    }

    if (className == 'merckFoundationMediaResponse') {
      responseObj = MerckinMediaResponse.fromJson(json);
    }
    if (className == 'MerckTestimonialResp') {
      responseObj = MerckTestimonialResponse.fromJson(json);
    }

    if (className == 'VidepLibraryResponse') {
      responseObj = GetVideoLibraryResponse.fromJson(json);
    }

    if (className == 'OurPartnerObjectivesResp') {
      responseObj = OurpartnerobjectiveResponse.fromJson(json);
    }

    if (className == 'OurPartnerResp') {
      responseObj = OurpartnerResponse.fromJson(json);
    }
    if (className == 'callforapplicationResponse') {
      responseObj = CallforApplicationResponse.fromJson(json);
    }
    if (className == "StrategyResponse") {
      responseObj = GetStrategeryResponse.fromJson(json);
    }
    if (className == "FirstLadiesInitiativeResponse") {
      responseObj = GetFirstLadiesInitaiveResp.fromJson(json);
    }
    if (className == "MMTMResponse") {
      responseObj = GetMmtmResponse.fromJson(json);
    }
    if (className == "empoweringbernavideoResponse") {
      responseObj = GetEmpowringbernaVideosResp.fromJson(json);
    }
    if (className == "empoweringbernacontentResponse") {
      responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

    if (className == "getMerckmotherSliderResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

    if (className == "getMerckmotherContentResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

    if (className == "getMerckmotherVideosResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

    if (className == "getMerckmotherLatestUpdatesResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

      if (className == "getMerckmotherCallAppliResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

      if (className == "getMerckmotherDigitalLibResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

      if (className == "getMerckmotherMediaResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }
      if (className == "getMerckmotherTestimonialResp") {
      // responseObj = EmpoweingbernacontentResponse.fromJson(json);
    }

    return responseObj;
  }

  Future<void> apiRequest(BuildContext context, API api,
      successCallback onSuccess, failureCallback onFailure,
      {dynamic parameter, dynamic params, dynamic path}) async {
    var jsonResponse;
    http.Response response;

    var body = (parameter != null ? json.encode(parameter) : null);

    var url = await this.apiEndPoint(api);
    if (path != null) {
      url = url + path;
    }
    print('URL is $url');

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // headers = {
    // // "apiKey": '',
    //   HttpHeaders.contentTypeHeader: 'application/json',
    // };
    print("header is $headers");
    //}

    try {
      if (this.apiHTTPMethod(api) == HTTPMethod.POST) {
        response =
            await http.post(url, body: body, headers: headers).timeout(timeout);
        print(response.body);
        print('response of post');
      } else if (this.apiHTTPMethod(api) == HTTPMethod.GET) {
        response = await http.get(url, headers: headers).timeout(timeout);
        print('response of get');
      } else if (this.apiHTTPMethod(api) == HTTPMethod.PUT) {
        print('body is -' + body);
        response = await http
            .put(
              url,
              body: body,
              headers: headers,
            )
            .timeout(timeout);
      } else if (this.apiHTTPMethod(api) == HTTPMethod.DELETE) {
        response = await http.delete(url, headers: headers).timeout(timeout);
      }

      //TODO : Handle 201 status code as well
      print('Resp is ${response.statusCode}');
      if (response.statusCode == 200) {
        //logout appi response is not json

        jsonResponse = json.decode(response.body);
        print('BODY is--> $jsonResponse');

        onSuccess(this.parseResponse(this.classNameForAPI(api), jsonResponse));

        // onSuccess(this.parseResponse(this.classNameForAPI(api), jsonResponse));
      } else if (response.statusCode == 201 || response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        print('Creted Resp dict ${jsonResponse.toString()}');

        onSuccess(this.parseResponse(this.classNameForAPI(api), jsonResponse));
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
            msg: "Server not responding",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        //clear all shared preferences
        // SPManager().clear().then((value) {
        //   // temporary redirect to login screen
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => MobileLogin()));
        // });
      } else {
        var appError = this.parseError(response);
        // FLog.error(
        //     text:
        //         'Caller : ${programInfo.callerFunctionName} Error : ${appError.toString()}');

        onFailure(appError);
      }
    } on Exception catch (exception) {
      print('Exception ${exception.toString()}');
      // only executed if error is of type Exception
      var appError = FetchDataError(exception.toString());
      // FLog.error(
      //     text:
      //         'Time : ${Utility().calculateTime(startTime)} Caller : ${programInfo.callerFunctionName} Error : ${appError.toString()}',
      //     exception: exception);

      onFailure(appError);
    } catch (error) {
      print('Exception ${error.toString()}');

      // executed for errors of all types other than Exception
      var appError = FetchDataError(error.toString());
      // FLog.error(
      //     text:
      //         'Time : ${Utility().calculateTime(startTime)} Caller : ${programInfo.callerFunctionName} Error : ${appError.toString()}');
      onFailure(appError);
    }
  }

  dynamic parseUploadError(String response, int statusCode) {
    var jsonResponse;
    var message;
    if (response != null && response.length > 0) {
      jsonResponse = json.decode(response);
      if (jsonResponse != null && jsonResponse["status_Message"] != null) {
        message = jsonResponse["status_Message"];
      } else {
        message = response;
      }
    }

    switch (statusCode) {
      case 400:
        return BadRequestError(message);
      case 401:
      case 403:
        return UnauthorisedError(message);
      case 500:
      default:
        return FetchDataError(
            'Error occured while Communication with Server with StatusCode : ${statusCode}');
    }
  }

  dynamic parseError(http.Response response) {
    var jsonResponse;
    var message;

    if (response.body != null && response.body.toString().length > 0) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse["desc"] != null) {
        message = jsonResponse["desc"];
      } else {
        message = response.body.toString();
      }
    }

    switch (response.statusCode) {
      case 400:
        return BadRequestError(message);
      case 200:
        return MessageError(message);
      case 401:
      case 403:
        return UnauthorisedError(message);
      case 500:
      default:
        return FetchDataError(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
