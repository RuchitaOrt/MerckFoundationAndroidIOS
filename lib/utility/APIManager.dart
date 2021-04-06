import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:merckfoundation22dec/model/FilterdataResponse.dart';
import 'package:merckfoundation22dec/model/GalleryProgram.dart';
import 'package:merckfoundation22dec/model/GetAboutMerckContentResp.dart';
import 'package:merckfoundation22dec/model/GetAboutMerckVideosResp.dart';
import 'package:merckfoundation22dec/model/GetFertilityContentResp.dart';
import 'package:merckfoundation22dec/model/GetFertilityTestimonialResp.dart';
import 'package:merckfoundation22dec/model/GetFertilityVideosResp.dart';
import 'package:merckfoundation22dec/model/GetFirstLadiesInitaiveResponse.dart';
import 'package:merckfoundation22dec/model/GetLocalSongsContentResp.dart';
import 'package:merckfoundation22dec/model/GetLocalSongsDigitalResp.dart';
import 'package:merckfoundation22dec/model/GetLocalSongsVideosResp.dart';
import 'package:merckfoundation22dec/model/MMTMSlider.dart';
import 'package:merckfoundation22dec/model/OurawardResponse.dart';
import 'package:merckfoundation22dec/model/StrategyResponse.dart';
import 'package:merckfoundation22dec/model/dataprivacy.dart';
import 'package:merckfoundation22dec/model/digitalProgramResponse.dart';
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
import 'package:merckfoundation22dec/model/homeheader.dart';
import 'package:merckfoundation22dec/model/ourmissionResponse.dart';
import 'package:merckfoundation22dec/model/ourpolicy.dart';
import 'package:merckfoundation22dec/model/stemsubmenuprogramlist.dart';
import 'package:merckfoundation22dec/model/videoProgramResponse.dart';
import 'package:merckfoundation22dec/model/viewmoreMMTMResponse.dart';
import 'package:merckfoundation22dec/model/viewmoreMediaResponse.dart';
import 'package:merckfoundation22dec/model/visionResponse.dart';
import 'package:merckfoundation22dec/model/yearwisephotogallery.dart';
import 'package:merckfoundation22dec/utility/AppEror.dart';
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart';
import 'package:merckfoundation22dec/model/callforapplicationResponse.dart';
import 'package:merckfoundation22dec/model/mmtmContentResponse.dart';
import 'package:merckfoundation22dec/model/merckothervideo.dart';
import 'package:merckfoundation22dec/model/MMTMlatestupdateResponse.dart';
import 'package:merckfoundation22dec/model/mmtminmediaResponse.dart';
import 'package:merckfoundation22dec/model/mmtmTestimonialResponse.dart'
    as testimonial;
import 'package:merckfoundation22dec/model/mmtmcallforappResponse.dart';
import 'package:merckfoundation22dec/model/mmtmdigitallibrary.dart';
import 'package:merckfoundation22dec/model/CountrylistResponse.dart';
import 'package:merckfoundation22dec/model/CategorylistResponse.dart';
import 'package:merckfoundation22dec/model/LeadershipResponse.dart';
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart';
import 'package:merckfoundation22dec/model/TestimonialProgram.dart';
import 'package:merckfoundation22dec/model/our_gallery_detail_response.dart';
import 'package:merckfoundation22dec/model/Merckoverview.dart';
import 'package:merckfoundation22dec/model/CreategallerymobileResponse.dart';

//Note URL need to change in configuration.json and also in these file fetchget method
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

  //ourProgram - local-songs-and-children-stories

  merckLocalSongsContent,
  merckLocalSongsVideos,
  merckLocalDigital,

  //about-merck-more-than-a-mother

  merckAboutContent,
  merckAboutVideos,

  //filter
  countrylist,
  categoryList,
  filterlist,
  filterlisttestimonial,
  getCategoryWiseCountryList,
  //awardsection
  ouraward,
  ourawarddetail,

  //mobilesearch
  mobilesearch,
  //testiominalprogram
  testiomonailpro,
  ourgallerydetail,
  programgalleryeducting,
  programgallerymmtm,
  programgallerycapacity,
  programgalleryfirstladey,
  programgallerystem,
  programgallerysubstain,
  programgalleryafrica,

  //watchmore video
  watchvideommtm,
  watchvideocancer,
  watchvideocapacity,
  watchvideostem,
  watchvdeoducation,
  watchvideofirstlady,
  watchvideosubstain,
  watchvideoafrica,
//subprogram cancer video
  watchvideoaboutmmtm,
  watchvideoempoweringberna,
  watchvideolocalsong,
  watchvideofertility,
  //viewmoredigital
  digitalmmtm,
  digitalhome,
  digitalcancer,
  digitalcapacity,
  digitalfirstlady,
  digitalstem,
  digitaleducting,
  digitalsubstain,
  digitalafrica,

  //viewmoremmtm
  watchprogrammmtm,
  watchhomemmtm,
  watchfirstladymmtm,

  //viewmore media section
  watchmediprogrammmtm,
  watchmediaprogramcancer,

  //watch more latest update
  watchmorelatestupmmtm,
  watchmorelatestupcancer,
  watchmorelatestupstem,
  watchmorelatestupafrica,

  //watch more testimonial
  watchmoretestimonialcapacity,
  watchmoretestimonialcancer,
  watchmoretestimonialmmtm,
  watchmoretestimonialcancerfellowship,

  //watchmore callfor app
  watchcallhome,
  watchcallmmtm,
  watchcallstem,
  watchcallafrica,

  //merckoverview

  merckoverview,

  //message from ceo rasha
  viewallceomessagerasha,

  //stemprogramlist
  stemprogramlist,
  africaprogramlist,

  //covid video
  covidvideo,
  covidnews,

  //yearwise photo
  yearwisegallery,
  homeheader,

  //create gallery viewmore
  creategallerymobile
}

enum HTTPMethod { GET, POST, PUT, DELETE }

typedef successCallback = void Function(dynamic response);
typedef progressCallback = void Function(int progress);
typedef failureCallback = void Function(AppError error);

//Note URL need to change in configuration.json and also in these file fetchget method
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

  static Future<http.Response> fetchget(
      {@required String encoding, BuildContext context}) async {
    IOClient ioClient = new IOClient();

    HttpClient client = new HttpClient();

    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => false);

    ioClient = new IOClient(client);

    //TODO: Use this URI for UATs
    //http://merckfoundation.org/mfindia/web/public/api/
    // var uri = Uri.http(
    //     'onerooftechnologiesllp.com', '/mfindia/web/public/api/$encoding');
    var uri = Uri.http('merck-foundation.com', 'api/$encoding');
    final response = await ioClient.get(uri);
    print(uri.toString());
    if (response.statusCode == 401) {
    } else if (response.statusCode == 200) {
      return response;
    } else {
      // throw AlertDialog(
      //   title: Text("Invalid User"),
      // );
      return response;
    }
  }

  static String viewmorealbum = baseURL + "create_gallery_mobile";
  static String steminnerpages = baseURL + "LuminaryStemBarPages";
  static String searchapi = baseURL + "mobile_search";
  //video view all section
  static String ambasadarvideoapi =
      baseURL + "ambassadors_view_more_videos_mob";
  //api for view all video section-Empowering Berna ,Local Songs and Children Stories,Merck Oncology Fellowship Program,Merck More Than a Patient,Merck Community Awareness
  static String watchsubmenuvideoapi = baseURL + "WatchMoreSubProgramVideos";
  ////
  static String ambasadarimageapi = baseURL + "ambassadors_view_more_image_mob";
  static String homeurl = "program_page_api/home/Android/1";
  static String mmtmprogramurl =
      "MMTM_Program_Api/merck-foundation-more-than-a-mother/Android/1";
  static String merckcancerprogramurl =
      "MainProgramPageApi/merck-foundation-cancer-access-program/Android/1";
  static String merckcapabilityprogram =
      "MainProgramPageApi/merck-foundation-capacity-advancement-nationwide-diabetes-blue-points-program/Android/1";

  static String merckstemprogram =
      "MainProgramPageApi/merck-foundation-stem-program/Android/1";
  static String merckfirstladies =
      "MainProgramPageApi/merck-foundation-first-ladies-initiative-summit/Android/1";
  static String merckafricaasialuminar =
      "MainProgramPageApi/merck-foundation-africa-asia-luminary/Android/1";
  static String mercksubstaition =
      "MainProgramPageApi/merck-foundation-sustainability-initiative/Android/1";
  static String merckeducatinglinda =
      "MainProgramPageApi/merck-foundation-educating-linda-program/Android/1";
  static String empoweringberna =
      "SubProgramPageApi/empowering-berna/Android/1";
  static String fertilityprogram =
      "SubProgramPageApi/merck-foundation-fertility-and-embryology-training-program/Android/1";
  static String subproaboutmmtm =
      "SubProgramPageApi/about-merck-foundation-more-than-a-mother/Android/1";
  static String viewhomeceomsg = "ceo_message_mob";
  static String mediaarticle = "new_letters_and_articles_mob";
  static String subprogramstrategy = "SubProgramPageApi/strategy/Android/1";
  static String subprogrammmtmambasadar =
      "SubProgramPageApi/merck-foundation-more-than-a-mother-ambassadors/Android/1";
  static String subprogramcommunityawareness =
      "SubProgramPageApi/merck-foundation-community-awareness-and-awards-program/Android/1";
  // "SubProgramPageApi/community-awareness-and-awards-program/Android/1";
  static String subprogramlocalsong =
      "SubProgramPageApi/local-songs-and-children-stories/Android/1";
  static String subprocancerobjtive = "SubProgramPageApi/objectives/Android/1";
  static String subprofellowship =
      "SubProgramPageApi/merck-foundation-oncology-fellowship-program/Android/1";
  static String subprocancerpatient =
      "SubProgramPageApi/merck-foundation-more-than-a-patient/Android/1";
  static String subprocancercommunityawareness =
      "SubProgramPageApi/merck-foundation-community-awareness/Android/1";
  Future<String> apiEndPoint(API api) async {
    var apiPathString = "";
    //  if (Platform.isAndroid) {
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
        apiPathString = "media_and_events_sorting/our-activities/23/Android/1";
        //"show/our-activities/23/Android/1";
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
        apiPathString = "leaders/leadership/19/Android/1";
        //"show/leadership/19/Android/1";
        break;

      case API.dataPrivacy:
        apiPathString = "show/data-privacy/13/Android/1";
        break;

      case API.newsRelease:
        apiPathString = "media_and_events_sorting/news-release/16/Android/1";
        // "show/news-releases/16/Android/1";
        break;
      case API.newsletters:
        apiPathString =
            "media_and_events_sorting/newsletters-and-articles/23/Android/1";
        // "show/newsletters-and-articles/23/Android/1";
        break;
      case API.merckfoundationinmedia:
        apiPathString =
            "media_and_events_sorting/merck-foundation-in-media/20/Android/1";
        //"show/merck-foundation-in-media/20/Android/1";
        break;
      case API.callforapplication:
        apiPathString =
            "media_and_events_sorting/upcoming-programs-&-calls-for-applications/9/Android/1";
        //  "media_and_events_sorting/call-for-applications/9/Android/1";

        //"call_for_app/call-for-application/9";
        break;
      case API.videoLibrary:
        apiPathString = "media_and_events_sorting/video-library/14/Android/1";
        // "show/Video-Library/14/Android/1";
        break;

      case API.ourPartner:
        apiPathString = "media_and_events_sorting/our-partners/17/Android/1";
        //"show/our-partners/17/Android/1";
        break;

      case API.ourPartnerObjectives:
        apiPathString = "media_and_events_sorting/our-partners/13/Android/1";
        //"show/our-partners/13/Android/1";
        break;
      case API.getStories:
        apiPathString = "show/stories/14/Android/1";
        break;

      case API.merckTestimonial:
        apiPathString =
            "media_and_events_sorting/merck-foundation-alumni-testimonials/14/Android/1";
        // "show/merck-foundation-alumnis-testimonies/14/Android/1";

        break;
      case API.strategy:
        apiPathString = "show/strategy/13/Android/1";
        break;
      case API.firstladiesinitiative:
        apiPathString =
            "show/merck-foundation-first-ladies-initiative-summit/13/Android/1";
        break;
      case API.mmtmprogram:
        apiPathString =
            "MMTM_Videos_list/merck-foundation-more-than-a-mother/Android/1";
        break;
      case API.empoweringbernacontent:
        apiPathString = "show/empowering-berna/13/Android/1";
        break;
      case API.empoweringbernavideo:
        apiPathString = "show/empowering-berna/14/Android/1";
        break;

      case API.merckmotherSlider:
        apiPathString = "show/merck-foundation-more-than-a-mother/5/Android/1";
        break;

      case API.merckmotherContent:
        apiPathString = "show/merck-foundation-more-than-a-mother/13/Android/1";
        break;

      case API.merckmotherVideos:
        apiPathString = "show/merck-foundation-more-than-a-mother/14/Android/1";
        break;

      case API.merckmotherLatestUpdates:
        apiPathString = "show/merck-foundation-more-than-a-mother/23/Android/1";
        break;

      case API.merckmotherCallApplication:
        apiPathString = "show/merck-foundation-more-than-a-mother/9/Android/1";
        break;

      case API.merckmotherDigitalLib:
        apiPathString = "show/merck-foundation-more-than-a-mother/22/Android/1";
        break;

      case API.merckmotherMedia:
        apiPathString = "show/merck-foundation-more-than-a-mother/20/Android/1";
        break;

      case API.merckmotherTestimonial:
        apiPathString = "show/merck-foundation-more-than-a-mother/18/Android/1";
        break;

      case API.merckFertilityContent:
        apiPathString =
            "show/merck-foundation-fertility-and-embryology-training-program/13/Android/1";
        break;

      case API.merckFertilityVideos:
        apiPathString =
            "show/merck-foundation-fertility-and-embryology-training-program/14/Android/1";
        break;

      case API.merckFertilityTestimonials:
        apiPathString =
            "show/merck-foundation-fertility-and-embryology-training-program/18/Android/1";
        break;

      case API.merckLocalSongsContent:
        apiPathString = "show/local-songs-and-children-stories/13/Android/1";
        break;

      case API.merckLocalSongsVideos:
        apiPathString = "show/local-songs-and-children-stories/14/Android/1";
        break;

      case API.merckLocalDigital:
        apiPathString = "show/local-songs-and-children-stories/22/Android/1";
        break;

      case API.merckAboutContent:
        apiPathString = "show/about-merck-more-than-a-mother/13/Android/1";
        break;

      case API.merckAboutVideos:
        apiPathString = "show/about-merck-more-than-a-mother/14/Android/1";
        break;

      case API.countrylist:
        apiPathString = "getCountryList/1";
        break;

      case API.getCategoryWiseCountryList:
        apiPathString = "getCategoryWiseCountryList";
        break;
      case API.categoryList:
        apiPathString = "getCategoryList/1";
        break;
      case API.ouraward:
        apiPathString = "show/home/11/Android/1";
        break;
      case API.filterlist:
        apiPathString = "filter_data";
        break;
      case API.filterlisttestimonial:
        apiPathString = "getTestimonialCategoryList";
        break;
      case API.ourawarddetail:
        apiPathString = "merck_awards";
        break;
      case API.testiomonailpro:
        apiPathString = "merck_testimonials";
        break;
      case API.ourgallerydetail:
        apiPathString = "mob_event_gallery";
        break;
      case API.programgalleryeducting:
        apiPathString =
            "ProgramGallery/merck-foundation-educating-linda-program/1";
        break;
      case API.programgallerymmtm:
        apiPathString = "ProgramGallery/merck-foundation-more-than-a-mother/1";
        break;
      case API.programgallerycapacity:
        apiPathString =
            "ProgramGallery/merck-foundation-capacity-advancement-nationwide-diabetes-blue-points-program/1";
        break;
      case API.programgalleryfirstladey:
        apiPathString =
            "ProgramGallery/merck-foundation-first-ladies-initiative-summit/1";
        break;
      case API.programgallerystem:
        apiPathString = "ProgramGallery/merck-foundation-stem-program/1";
        break;
      case API.programgallerysubstain:
        apiPathString =
            "ProgramGallery/merck-foundation-sustainability-initiative/1";
        break;
      case API.programgalleryafrica:
        apiPathString =
            "ProgramGallery/merck-foundation-africa-asia-luminary/1";
        break;
      case API.watchvideommtm:
        apiPathString =
            "watch_program_videos/merck-foundation-more-than-a-mother/1";
        break;
      case API.watchvideocancer:
        apiPathString =
            "watch_program_videos/merck-foundation-cancer-access-program/1";
        break;
      case API.watchvideocapacity:
        apiPathString =
            "watch_program_videos/merck-foundation-capacity-advancement-nationwide-diabetes-blue-points-program/1";
        break;
      case API.watchvideosubstain:
        apiPathString =
            "watch_program_videos/merck-foundation-sustainability-initiative/1";
        break;
      case API.watchvdeoducation:
        apiPathString =
            "watch_program_videos/merck-foundation-educating-linda-program/1";
        break;
      case API.watchvideofirstlady:
        apiPathString =
            "watch_program_videos/merck-foundation-first-ladies-initiative-summit/1";
        break;
      case API.watchvideoafrica:
        apiPathString =
            "watch_program_videos/merck-foundation-africa-asia-luminary/1";

        break;
      case API.watchvideostem:
        apiPathString = "watch_program_videos/merck-foundation-stem-program/1";
        break;

      case API.digitalmmtm:
        apiPathString = "digital_library/merck-foundation-more-than-a-mother/1";
        break;
      case API.digitalhome:
        apiPathString = "digital_library/Home/1";
        break;

      case API.digitalcancer:
        apiPathString =
            "digital_library/merck-foundation-cancer-access-program/1";
        break;
      case API.digitalcapacity:
        apiPathString =
            "digital_library/merck-foundation-capacity-advancement-nationwide-diabetes-blue-points-program/1";
        break;

      case API.digitalfirstlady:
        apiPathString =
            "digital_library/merck-foundation-first-ladies-initiative-summit/1";
        break;
      case API.digitalstem:
        apiPathString = "digital_library/merck-foundation-stem-program/1";

        break;
      case API.digitaleducting:
        apiPathString =
            "digital_library/merck-foundation-educating-linda-program/1";

        break;
      case API.digitalsubstain:
        apiPathString =
            "digital_library/merck-foundation-sustainability-initiative/1";

        break;
      case API.digitalafrica:
        apiPathString =
            "digital_library/merck-foundation-africa-asia-luminary/1";

        break;
      case API.watchhomemmtm:
        apiPathString = "show_mmtm_gallery/home/1";

        break;
      case API.watchprogrammmtm:
        apiPathString =
            "show_mmtm_gallery/merck-foundation-more-than-a-mother/1";

        break;
      case API.watchfirstladymmtm:
        apiPathString =
            "show_mmtm_gallery/merck-foundation-first-ladies-initiative-summit/1";

        break;
      case API.watchmediprogrammmtm:
        apiPathString =
            "read_merck_media/merck-foundation-more-than-a-mother/1";

        break;
      case API.watchmediaprogramcancer:
        apiPathString =
            "read_merck_media/merck-foundation-cancer-access-program/1";

        break;
      case API.watchmorelatestupmmtm:
        apiPathString =
            "read_latest_updates/merck-foundation-more-than-a-mother/1";

        break;
      case API.watchmorelatestupcancer:
        apiPathString =
            "read_latest_updates/merck-foundation-cancer-access-program/1";

        break;
      case API.watchmorelatestupstem:
        apiPathString = "read_latest_updates/merck-foundation-stem-program/1";

        break;
      case API.watchmorelatestupafrica:
        apiPathString =
            "read_latest_updates/merck-foundation-africa-asia-luminary/1";

        break;

      case API.watchmoretestimonialcancer:
        apiPathString =
            "merck_testimonials_list/merck-foundation-cancer-access-program/1";

        break;
      case API.watchmoretestimonialcancerfellowship:
        apiPathString =
            "merck_testimonials_list/merck-foundation-oncology-fellowship-program/1";

        break;
      case API.watchmoretestimonialcapacity:
        apiPathString =
            "merck_testimonials_list/merck-foundation-capacity-advancement-nationwide-diabetes-blue-points-program/1";

        break;
      case API.watchmoretestimonialmmtm:
        apiPathString =
            "merck_testimonials_list/merck-foundation-more-than-a-mother/1";

        break;

      case API.watchvideoaboutmmtm:
        apiPathString = "watch_program_videos/about-merck-more-than-a-mother/1";

        break;
      case API.watchvideoempoweringberna:
        apiPathString = "watch_program_videos/empowering-berna/1";

        break;
      case API.watchvideolocalsong:
        apiPathString =
            "watch_program_videos/local-songs-and-children-stories/1";

        break;
      case API.watchvideofertility:
        apiPathString =
            "watch_program_videos/merck-foundation-fertility-and-embryology-training-program/1";

        break;

      case API.watchcallhome:
        apiPathString = "read_call_for_app/Home/1";

        break;
      case API.watchcallmmtm:
        apiPathString =
            "read_call_for_app/merck-foundation-more-than-a-mother/1";

        break;
      case API.watchcallstem:
        apiPathString = "read_call_for_app/merck-foundation-stem-program/1";

        break;
      case API.watchcallafrica:
        apiPathString =
            "read_call_for_app/merck-foundation-africa-asia-luminary/1";

        break;

      case API.merckoverview:
        apiPathString = "merck_foundation_over_view";

        break;

      case API.viewallceomessagerasha:
        apiPathString = "all_ceo_message/home/1";
        break;

      case API.stemprogramlist:
        apiPathString = "get_luminary_pages/merck-foundation-stem-program/1";
        break;
      case API.covidvideo:
        apiPathString = "covid_videos/1";
        break;
      case API.covidnews:
        apiPathString = "covid_news/1";
        break;

      case API.yearwisegallery:
        apiPathString = "year_wise_gallery/1";
        break;
      case API.africaprogramlist:
        apiPathString =
            "get_luminary_pages/merck-foundation-africa-asia-luminary/1";
        break;
      case API.homeheader:
        apiPathString = "program_page_api/header/Android/1";
        break;
      case API.creategallerymobile:
        apiPathString = "create_gallery_mobile";
        break;

      default:
        apiPathString = "HomeheaderResponse";
    }
    //   print(apiBaseURL());
    // } else if (Platform.isIOS) {
    //   // iOS-specific code
    //   print("This is ios");
    //   switch (api) {
    //     case API.vision:
    //       apiPathString = "show/vision/13/IOS/1";
    //       break;

    //     case API.legaldisclaimer:
    //       apiPathString = "show/legal-disclaimer/13/IOS/1";
    //       break;

    //     case API.ourmission:
    //       apiPathString = "show/mission/13/IOS/1";
    //       break;

    //     case API.ourActivities:
    //       apiPathString = "media_and_events_sorting/our-activities/23/IOS/1";
    //       //"show/our-activities/23/IOS/1";
    //       break;

    //     case API.ourActivitiesObjectives:
    //       apiPathString = "show/our-activities/13/IOS/1";
    //       break;

    //     case API.ourPolicies:
    //       apiPathString = "show/our-policies/13/IOS/1";
    //       break;

    //     case API.leadershipTeam:
    //       apiPathString = "show/message-from-leadership-team/13/IOS/1";
    //       break;

    //     case API.leadership:
    //       apiPathString = "leaders/leadership/19/IOS/1";
    //       //"show/leadership/19/IOS/1";
    //       break;

    //     case API.dataPrivacy:
    //       apiPathString = "show/data-privacy/13/IOS/1";
    //       break;

    //     case API.newsRelease:
    //       apiPathString = "media_and_events_sorting/news-releases/16/IOS/1";
    //       //"show/news-releases/16/IOS/1";
    //       break;
    //     case API.newsletters:
    //       apiPathString =
    //           "media_and_events_sorting/newsletters-and-articles/23/IOS/1";
    //       // "show/newsletters-and-articles/23/IOS/1";
    //       break;
    //     case API.merckfoundationinmedia:
    //       apiPathString =
    //           "media_and_events_sorting/merck-foundation-in-media/20/IOS/1";
    //       //"show/merck-foundation-in-media/20/IOS/1";
    //       break;
    //     case API.callforapplication:
    //       apiPathString =
    //           "media_and_events_sorting/call-for-applications/9/Android/1";
    //       //"call_for_app/call-for-application/9";
    //       break;
    //     case API.videoLibrary:
    //       apiPathString = "/media_and_events_sorting/video-library/14/IOS/1";
    //       //"show/Video-Library/14/IOS/1";
    //       break;

    //     case API.ourPartner:
    //       apiPathString = "media_and_events_sorting/our-partners/17/IOS/1";
    //       //"show/our-partners/17/IOS/1";
    //       break;

    //     case API.ourPartnerObjectives:
    //       apiPathString = "media_and_events_sorting/our-partners/13/IOS/1";
    //       // "show/our-partners/13/IOS/1";
    //       break;

    //     case API.getStories:
    //       apiPathString = "media_and_events_sorting/stories/14/Android/1";
    //       //"show/stories/14/IOS/1";
    //       break;

    //     case API.merckTestimonial:
    //       apiPathString =
    //           "media_and_events_sorting/merck-foundation-alumni-testimonials/14/Android/1";
    //       break;

    //     case API.strategy:
    //       apiPathString = "show/strategy/13/IOS/1";
    //       break;
    //     case API.firstladiesinitiative:
    //       apiPathString =
    //           "show/merck-foundation-first-ladies-initiative-summit/13/IOS/1";
    //       break;
    //     case API.mmtmprogram:
    //       apiPathString = "MMTM_Videos_list/merck-more-than-a-mother/IOS/1";
    //       break;

    //     case API.empoweringbernacontent:
    //       apiPathString = "show/empowering-berna/13/IOS/1";
    //       break;
    //     case API.empoweringbernavideo:
    //       apiPathString = "show/empowering-berna/14/IOS/1";
    //       break;

    //     case API.merckmotherSlider:
    //       apiPathString = "show/merck-more-than-a-mother/5/IOS/1";
    //       break;

    //     case API.merckmotherContent:
    //       apiPathString = "show/merck-more-than-a-mother/13/IOS/1";
    //       break;

    //     case API.merckmotherVideos:
    //       apiPathString = "show/merck-more-than-a-mother/14/IOS/1";
    //       break;

    //     case API.merckmotherLatestUpdates:
    //       apiPathString = "show/merck-more-than-a-mother/23/IOS/1";
    //       break;

    //     case API.merckmotherCallApplication:
    //       apiPathString = "show/merck-more-than-a-mother/9/IOS/1";
    //       break;

    //     case API.merckmotherDigitalLib:
    //       apiPathString = "show/merck-more-than-a-mother/22/IOS/1";
    //       break;

    //     case API.merckmotherMedia:
    //       apiPathString = "show/merck-more-than-a-mother/20/IOS/1";
    //       break;

    //     case API.merckmotherTestimonial:
    //       apiPathString = "show/merck-more-than-a-mother/18/IOS/1";
    //       break;

    //     case API.merckFertilityContent:
    //       apiPathString =
    //           "show/merck-fertility-and-embryology-training-program/13/IOS/1";
    //       break;

    //     case API.merckFertilityVideos:
    //       apiPathString =
    //           "show/merck-fertility-and-embryology-training-program/14/IOS/1";
    //       break;

    //     case API.merckFertilityTestimonials:
    //       apiPathString =
    //           "show/merck-fertility-and-embryology-training-program/18/IOS/1";
    //       break;

    //     case API.merckLocalSongsContent:
    //       apiPathString = "media_and_events_sorting/stories/14/IOS/1";
    //       //"show/local-songs-and-children-stories/13/IOS/1";
    //       break;

    //     case API.merckLocalSongsVideos:
    //       apiPathString = "show/local-songs-and-children-stories/14/IOS/1";
    //       break;

    //     case API.merckLocalDigital:
    //       apiPathString = "show/local-songs-and-children-stories/22/IOS/1";
    //       break;

    //     case API.merckAboutContent:
    //       apiPathString = "show/about-merck-more-than-a-mother/13/IOS/1";
    //       break;

    //     case API.merckAboutVideos:
    //       apiPathString = "show/about-merck-more-than-a-mother/14/IOS/1";
    //       break;

    //     case API.countrylist:
    //       apiPathString = "getCountryList/1";
    //       break;
    //     case API.categoryList:
    //       apiPathString = "getCategoryList/1";
    //       break;
    //     case API.ouraward:
    //       apiPathString = "show/home/11/IOS/1";
    //       break;
    //     case API.filterlist:
    //       apiPathString = "filter_data";
    //       break;
    //     case API.ourawarddetail:
    //       apiPathString = "merck_awards";
    //       break;
    //     case API.testiomonailpro:
    //       apiPathString = "merck_testimonials";
    //       break;
    //     case API.ourgallerydetail:
    //       apiPathString = "mob_event_gallery";
    //       break;
    //     case API.programgalleryeducting:
    //       apiPathString = "ProgramGallery/educating-linda-program/1";
    //       break;
    //     case API.programgallerymmtm:
    //       apiPathString = "ProgramGallery/merck-more-than-a-mother/1";
    //       break;
    //     case API.programgallerycapacity:
    //       apiPathString =
    //           "ProgramGallery/merck-capacity-advancement-and-nationwide-diabetes-blue-point-program/1";
    //       break;
    //     case API.programgalleryfirstladey:
    //       apiPathString =
    //           "ProgramGallery/merck-foundation-first-ladies-initiative-summit/1";
    //       break;
    //     case API.programgallerystem:
    //       apiPathString = "ProgramGallery/merck-stem-program/1";
    //       break;
    //     case API.programgallerysubstain:
    //       apiPathString =
    //           "ProgramGallery/merck-foundation-sustainability-initiative/1";
    //       break;
    //     case API.programgalleryafrica:
    //       apiPathString = "ProgramGallery/merck-africa-asia-luminary/1";
    //       break;

    //     case API.watchvideommtm:
    //       apiPathString = "watch_program_videos/merck-more-than-a-mother/1";
    //       break;
    //     case API.watchvideocancer:
    //       apiPathString = "watch_program_videos/merck-cancer-access-program/1";
    //       break;
    //     case API.watchvideocapacity:
    //       apiPathString =
    //           "watch_program_videos/merck-capacity-advancement-and-nationwide-diabetes-blue-point-program/1";
    //       break;
    //     case API.watchvideosubstain:
    //       apiPathString =
    //           "watch_program_videos/merck-foundation-sustainability-initiative/1";
    //       break;
    //     case API.watchvdeoducation:
    //       apiPathString = "watch_program_videos/educating-linda-program/1";
    //       break;
    //     case API.watchvideofirstlady:
    //       apiPathString =
    //           "watch_program_videos/merck-foundation-first-ladies-initiative-summit/1";
    //       break;
    //     case API.watchvideoafrica:
    //       apiPathString = "watch_program_videos/merck-africa-asia-luminary/1";

    //       break;
    //     case API.watchvideostem:
    //       apiPathString = "watch_program_videos/merck-stem-program/1";

    //       break;
    //     case API.digitalmmtm:
    //       apiPathString = "digital_library/merck-more-than-a-mother/1";
    //       break;
    //     case API.digitalhome:
    //       apiPathString = "digital_library/Home/1";
    //       break;

    //     case API.digitalcancer:
    //       apiPathString = "digital_library/merck-cancer-access-program/1";
    //       break;
    //     case API.digitalcapacity:
    //       apiPathString =
    //           "digital_library/merck-capacity-advancement-and-nationwide-diabetes-blue-point-program/1";
    //       break;

    //     case API.digitalfirstlady:
    //       apiPathString =
    //           "digital_library/merck-foundation-first-ladies-initiative-summit/1";
    //       break;
    //     case API.digitalstem:
    //       apiPathString = "digital_library/merck-stem-program/1";

    //       break;
    //     case API.digitaleducting:
    //       apiPathString = "digital_library/educating-linda-program/1";

    //       break;
    //     case API.digitalsubstain:
    //       apiPathString =
    //           "digital_library/merck-foundation-sustainability-initiative/1";

    //       break;
    //     case API.digitalafrica:
    //       apiPathString = "digital_library/merck-africa-asia-luminary/1";

    //       break;

    //     case API.watchhomemmtm:
    //       apiPathString = "show_mmtm_gallery/home/1";

    //       break;
    //     case API.watchprogrammmtm:
    //       apiPathString = "show_mmtm_gallery/merck-more-than-a-mother/1";

    //       break;
    //     case API.watchfirstladymmtm:
    //       apiPathString =
    //           "show_mmtm_gallery/merck-foundation-first-ladies-initiative-summit/1";

    //       break;
    //     case API.watchmediprogrammmtm:
    //       apiPathString = "read_merck_media/merck-more-than-a-mother/1";

    //       break;
    //     case API.watchmediaprogramcancer:
    //       apiPathString = "read_merck_media/merck-cancer-access-program/1";

    //       break;
    //     case API.watchmorelatestupmmtm:
    //       apiPathString = "read_latest_updates/merck-more-than-a-mother/1";

    //       break;
    //     case API.watchmorelatestupcancer:
    //       apiPathString = "read_latest_updates/merck-cancer-access-program/1";

    //       break;
    //     case API.watchmorelatestupstem:
    //       apiPathString = "read_latest_updates/merck-stem-program/1";

    //       break;
    //     case API.watchmorelatestupafrica:
    //       apiPathString = "read_latest_updates/merck-africa-asia-luminary/1";

    //       break;

    //     case API.watchmoretestimonialcancer:
    //       apiPathString =
    //           "merck_testimonials_list/merck-cancer-access-program/1";

    //       break;
    //     case API.watchmoretestimonialcapacity:
    //       apiPathString =
    //           "merck_testimonials_list/merck-capacity-advancement-and-nationwide-diabetes-blue-point-program/1";

    //       break;
    //     case API.watchmoretestimonialmmtm:
    //       apiPathString = "merck_testimonials_list/merck-more-than-a-mother/1";

    //       break;
    //     case API.watchvideoaboutmmtm:
    //       apiPathString =
    //           "watch_program_videos/about-merck-more-than-a-mother/1";

    //       break;
    //     case API.watchvideoempoweringberna:
    //       apiPathString = "watch_program_videos/empowering-berna/1";

    //       break;
    //     case API.watchvideolocalsong:
    //       apiPathString =
    //           "watch_program_videos/local-songs-and-children-stories/1";

    //       break;
    //     case API.watchvideofertility:
    //       apiPathString =
    //           "watch_program_videos/merck-fertility-and-embryology-training-program/1";

    //       break;

    //     case API.watchcallhome:
    //       apiPathString = "read_call_for_app/Home/1";

    //       break;
    //     case API.watchcallmmtm:
    //       apiPathString = "read_call_for_app/merck-more-than-a-mother/1";

    //       break;
    //     case API.watchcallstem:
    //       apiPathString = "read_call_for_app/merck-stem-program/1";

    //       break;
    //     case API.watchcallafrica:
    //       apiPathString = "read_call_for_app/merck-africa-asia-luminary/1";

    //       break;
    //     case API.merckoverview:
    //       apiPathString = "merck_foundation_over_view";

    //       break;
    //     case API.viewallceomessagerasha:
    //       apiPathString = "all_ceo_message/home/1";
    //       break;
    //     case API.stemprogramlist:
    //       apiPathString = "get_luminary_pages/merck-stem-program/1";
    //       break;
    //     case API.covidvideo:
    //       apiPathString = "covid_videos/1";
    //       break;
    //     case API.covidnews:
    //       apiPathString = "covid_news/1";
    //       break;
    //     case API.yearwisegallery:
    //       apiPathString = "year_wise_gallery/1";
    //       break;
    //     case API.africaprogramlist:
    //       apiPathString = "get_luminary_pages/merck-africa-asia-luminary/1";
    //       break;
    //     default:
    //       apiPathString = "";
    //   }
    //   print(apiBaseURL());
    // }

    return this.apiBaseURL() + apiPathString;

    // return this.apiBaseURL() + apiPathString;
  }

  HTTPMethod apiHTTPMethod(API api) {
    HTTPMethod method;
    switch (api) {
      case API.filterlist:
      case API.ourawarddetail:
      case API.ourgallerydetail:
      case API.creategallerymobile:
      case API.getCategoryWiseCountryList:
        // case API.legaldisclaimer:
        //  case API.mission:
        //  case API.ourActivities:
        //   case API.ourPolicies:
        //    case API.dataPrivacy:

        method = HTTPMethod.POST;
        break;

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
      case API.watchmorelatestupmmtm:
      case API.watchmorelatestupcancer:
      case API.watchmorelatestupstem:
      case API.watchmorelatestupafrica:
      case API.viewallceomessagerasha:
      case API.covidnews:
        className = "NewsLetterseResponse";
        break;

      case API.merckfoundationinmedia:
        className = "merckFoundationMediaResponse";
        break;

      case API.callforapplication:
      case API.watchcallhome:
      case API.watchcallmmtm:
      case API.watchcallstem:
      case API.watchcallafrica:
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

      case API.merckLocalSongsContent:
        className = "getLocalSongsContentResp";
        break;

      case API.merckLocalSongsVideos:
        className = "getLocalSongsVidoesResp";
        break;

      case API.merckLocalDigital:
        className = "getLocalSongsDigitalResp";
        break;

      case API.merckAboutContent:
        className = "getMerckAboutContentResp";
        break;
      case API.merckAboutVideos:
        className = "getMerckAboutVideosResp";
        break;
      case API.countrylist:
      case API.getCategoryWiseCountryList:
        className = "CountrylistResponse";
        break;

      case API.categoryList:
      case API.filterlisttestimonial:
        className = "CategorylistResponse";
        break;

      case API.leadership:
        className = "LeadershipResponse";
        break;
      case API.ouraward:
        className = "OurawardResponse";
        break;
      case API.filterlist:
        className = "FilterdataResponse";
        break;

      case API.ourawarddetail:
        className = "OurawarddetailResponse";
        break;
      case API.testiomonailpro:
      case API.watchmoretestimonialcancer:
      case API.watchmoretestimonialcapacity:
      case API.watchmoretestimonialmmtm:
      case API.watchmoretestimonialcancerfellowship:
        className = "TestimonialprogramResponse";
        break;
      case API.ourgallerydetail:
        className = "OurgallerydetailResponse";
        break;
      case API.programgalleryeducting:
      case API.programgallerymmtm:
      case API.programgallerycapacity:
      case API.programgalleryfirstladey:
      case API.programgallerystem:
      case API.programgallerysubstain:
      case API.programgalleryafrica:
        className = "GalleryProgramResponse";
        break;
      case API.watchvideommtm:
      case API.watchvideocancer:
      case API.watchvideocapacity:
      case API.watchvdeoducation:
      case API.watchvideofirstlady:
      case API.watchvideosubstain:
      case API.watchvideostem:
      case API.watchvideoafrica:

      case API.watchvideoaboutmmtm:
      case API.watchvideoempoweringberna:
      case API.watchvideolocalsong:
      case API.watchvideofertility:
      case API.covidvideo:
        className = "VideoProgramResponse";
        break;

      case API.digitalmmtm:
      case API.digitalhome:
      case API.digitalcancer:
      case API.digitalcapacity:
      case API.digitalfirstlady:
      case API.digitalstem:
      case API.digitaleducting:
      case API.digitalsubstain:
      case API.digitalafrica:
        className = "DigitalProgramResponse";
        break;

      case API.watchhomemmtm:
      case API.watchprogrammmtm:
      case API.watchfirstladymmtm:
        className = "ViewmoremmtmResponse";
        break;
      case API.watchmediprogrammmtm:
      case API.watchmediaprogramcancer:
        className = "ViewmoremediaResponse";
        break;
      case API.merckoverview:
        className = "MerckoverviewResponse";
        break;
      case API.stemprogramlist:
      case API.africaprogramlist:
        className = "StemsubmenuprogramlistResponse";
        break;
      case API.yearwisegallery:
        className = "YearwisePhotogalleryResponse";
        break;
      case API.homeheader:
        className = "HomeheaderResponse";
        break;
      case API.creategallerymobile:
        className = "CreategallerymobileResponse";
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
      responseObj = MmtmSliderResponse.fromJson(json);
    }

    if (className == "getMerckmotherContentResp") {
      responseObj = MmtmContentResponce.fromJson(json);
    }

    if (className == "getMerckmotherVideosResp") {
      responseObj = MerckMotherVideosResponce.fromJson(json);
    }

    if (className == "getMerckmotherLatestUpdatesResp") {
      responseObj = MmtMlatestupdateResponse.fromJson(json);
    }

    if (className == "getMerckmotherCallAppliResp") {
      responseObj = MmtmcallforappResponse.fromJson(json);
    }

    if (className == "getMerckmotherDigitalLibResp") {
      responseObj = MmtmdigitallibraryResponse.fromJson(json);
    }

    if (className == "getMerckmotherMediaResp") {
      responseObj = MmtMinmediaResponse.fromJson(json);
    }
    if (className == "getMerckmotherTestimonialResp") {
      responseObj = testimonial.MmtmTestimonialResponse.fromJson(json);
    }

    if (className == "getMerckFertilityContentResp") {
      responseObj = GetFertilityContentResp.fromJson(json);
    }
    if (className == "getMerckFertilityVideosResp") {
      responseObj = GetFertilityVideosResp.fromJson(json);
    }
    if (className == "getMerckFertilityTestimonialResp") {
      responseObj = GetFertilityTestimonialResp.fromJson(json);
    }

    if (className == "getLocalSongsContentResp") {
      responseObj = GetLocalSongsContentResp.fromJson(json);
    }

    if (className == "getLocalSongsVidoesResp") {
      responseObj = GetLocalSongsVidoesResp.fromJson(json);
    }

    if (className == "getLocalSongsDigitalResp") {
      responseObj = GetLocalSongsDigitalLibResp.fromJson(json);
    }

    if (className == "getMerckAboutContentResp") {
      responseObj = GetAboutMerckContentResp.fromJson(json);
    }

    if (className == "getMerckAboutVideosResp") {
      responseObj = GetAboutMerckVideosResp.fromJson(json);
    }
    if (className == "CountrylistResponse") {
      responseObj = CountrylistResponse.fromJson(json);
    }
    if (className == "CategorylistResponse") {
      responseObj = CategorylistResponse.fromJson(json);
    }
    if (className == "LeadershipResponse") {
      responseObj = LeadershipResponse.fromJson(json);
    }
    if (className == "OurawardResponse") {
      responseObj = OurawardResponse.fromJson(json);
    }
    if (className == "FilterdataResponse") {
      responseObj = FilterdataResponse.fromJson(json);
    }
    if (className == "OurawarddetailResponse") {
      responseObj = OurawarddetailResponse.fromJson(json);
    }
    if (className == "TestimonialprogramResponse") {
      responseObj = TestimonialprogramResponse.fromJson(json);
    }
    if (className == "OurgallerydetailResponse") {
      //enterhere
      responseObj = OurGalleryDetailsResponse.fromJson(json);
    }
    if (className == "GalleryProgramResponse") {
      //enterhere
      responseObj = GalleryProgramResponse.fromJson(json);
    }
    if (className == "VideoProgramResponse") {
      //enterhere
      responseObj = VideoProgramResponse.fromJson(json);
    }
    if (className == "DigitalProgramResponse") {
      //enterhere
      responseObj = DigitalProgramResponse.fromJson(json);
    }
    if (className == "ViewmoremmtmResponse") {
      //enterhere
      responseObj = ViewmoremmtmResponse.fromJson(json);
    }
    if (className == "ViewmoremediaResponse") {
      //enterhere
      responseObj = ViewmoremediaResponse.fromJson(json);
    }
    if (className == "MerckoverviewResponse") {
      //enterhere
      responseObj = MerckoverviewResponse.fromJson(json);
    }
    if (className == "StemsubmenuprogramlistResponse") {
      //enterhere
      responseObj = StemsubmenuprogramlistResponse.fromJson(json);
    }
    if (className == "YearwisePhotogalleryResponse") {
      //enterhere
      responseObj = YearwisePhotogalleryResponse.fromJson(json);
    }
    if (className == "HomeheaderResponse") {
      //enterhere
      responseObj = HomeheaderResponse.fromJson(json);
    }
    if (className == "CreategallerymobileResponse") {
      //enterhere
      responseObj = CreategallerymobileResponse.fromJson(json);
    }

    return responseObj;
  }

  Future<void> apiRequest(BuildContext context, API api,
      successCallback onSuccess, failureCallback onFailure,
      {dynamic parameter,
      dynamic params,
      dynamic path,
      dynamic jsonval}) async {
    var jsonResponse;
    http.Response response;

    var body = (parameter != null ? json.encode(parameter) : jsonval);

    var url = await this.apiEndPoint(api);
    if (path != null) {
      url = url + path;
    }
    print('URL is $url');

    Map<String, String> headers = {
      // HttpHeaders.contentTypeHeader: 'application/json',
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
