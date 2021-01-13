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
}
