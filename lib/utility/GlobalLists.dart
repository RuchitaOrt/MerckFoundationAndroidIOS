import 'package:merckfoundation22dec/model/dataprivacy.dart' as dataPrivacy;
import 'package:merckfoundation22dec/model/legaldisclaimerResponse.dart'
    as legalDisclaimer;
import 'package:merckfoundation22dec/model/ourmissionResponse.dart'
    as ourMission;
import 'package:merckfoundation22dec/model/ourpolicy.dart' as ourPolicy;
import 'package:merckfoundation22dec/model/visionResponse.dart' as visionResp;
import 'package:merckfoundation22dec/model/ourActivitiesObjectiveResp.dart'
    as objectives;
import 'package:merckfoundation22dec/model/ourActivitiesResponse.dart'
    as activitiesResp;
import 'package:merckfoundation22dec/model/leadershipTeamResponse.dart'
    as leadershipTeam;

import 'package:merckfoundation22dec/model/ourPartnerObjectivesResp.dart'
    as ourPartnerobjective;

import 'package:merckfoundation22dec/model/ourPartnerResponse.dart'
    as ourPartnerResp;
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart'
    as videolibrayResp;
import 'package:merckfoundation22dec/model/getStoriesResponse.dart'
    as storiesResp;
import 'package:merckfoundation22dec/model/newsLettersArticlesResp.dart'
    as newsArticles;
import 'package:merckfoundation22dec/model/getNewsRelease.dart' as newsRelease;
import 'package:merckfoundation22dec/model/merckFoundationMediaResp.dart'
    as merckMediaresp;
import 'package:merckfoundation22dec/model/getMerckTestimonialResp.dart'
    as merckTestimonialResp;
import 'package:merckfoundation22dec/model/callforapplicationResponse.dart'
    as callforapp;
import 'package:merckfoundation22dec/model/StrategyResponse.dart' as strategy;
import 'package:merckfoundation22dec/model/GetFirstLadiesInitaiveResponse.dart'
    as firstladies;
import 'package:merckfoundation22dec/model/mmtmResponse.dart' as mmtm;
import 'package:merckfoundation22dec/model/empoweringbernacontentResponse.dart'
    as empowerbernacontent;
import 'package:merckfoundation22dec/model/empoweingbernavideo.dart'
    as empowerbernavideo;
import 'package:merckfoundation22dec/model/MMTMSlider.dart' as mmtmslider;
import 'package:merckfoundation22dec/model/mmtmContentResponse.dart'
    as mmtmcontent;
import 'package:merckfoundation22dec/model/merckothervideo.dart' as merckvideo;
import 'package:merckfoundation22dec/model/MMTMlatestupdateResponse.dart'
    as mmtmlatestupdate;
import 'package:merckfoundation22dec/model/mmtminmediaResponse.dart'
    as mmtminmedia;

import 'package:merckfoundation22dec/model/GetFertilityContentResp.dart' as fertilityContent;
import 'package:merckfoundation22dec/model/GetFertilityTestimonialResp.dart' as fertilityTestimonial;
import 'package:merckfoundation22dec/model/GetFertilityVideosResp.dart' as fertilityVideos;



class GlobalLists {
  static List<visionResp.ListElement> vision = [];
  static List<legalDisclaimer.ListElement> legaldisclaimer = [];
  static List<ourMission.ListElement> ourmission = [];
  static List<ourPolicy.ListElement> ourpolicy = [];
  static List<objectives.ListElement> ourActivitiesObjectives = [];
  static List<activitiesResp.ListElement> ourActivitiesData = [];
  static List<leadershipTeam.ListElement> leadershipTeamResp = [];

  static List<dataPrivacy.ListElement> dataprivacy = [];
  static List<ourPartnerobjective.ListElement> ourPartnerObjectives = [];
  static List<ourPartnerResp.ListElement> ourPartnerList = [];

  //media event
  static List<videolibrayResp.ListElement> videolibrary = [];

  static List<storiesResp.ListElement> storiesList = [];

  static List<newsArticles.ListElement> newsLettersList = [];
  static List<newsRelease.ListElement> newsReleaseList = [];
  static List<merckMediaresp.ListElement> merckinMediaList = [];
  static List<merckTestimonialResp.ListElement> merckTestimonialList = [];

  static List<callforapp.Past> upcomingevent = [];
  static List<callforapp.Past> pastevent = [];

  //ourprogram
  static List<strategy.ListElement> strategylist = [];
  static List<firstladies.ListElement> firstladieslist = [];
  static List<mmtm.Datum> mmtmlist = [];

  static List<empowerbernacontent.ListElement> empowercontentlist = [];
  static List<empowerbernavideo.ListElement> empowervideotlist = [];
//MMTM
  static List<mmtmslider.ListElement> mmtmsliderlist = [];
  static List<mmtmcontent.ListElement> mmtmcontentlist = [];

  static List<merckvideo.ListElement> mmtmvideoseclist = [];
  static List<mmtmlatestupdate.ListElement> mmtmlatestupdatelist = [];
  static List<mmtminmedia.ListElement> mmtminmediaresp = [];

  //Fertility program
  static List<fertilityContent.ListElement> fertilityContentList = [];
  static List<fertilityTestimonial.ListElement> fertilityTestimonialList = [];
 static List<fertilityVideos.ListElement> fertilityVideosList = [];
 
}
