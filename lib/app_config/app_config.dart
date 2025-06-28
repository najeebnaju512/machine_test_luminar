class AppConfig {
  //base url is set
  static String baseurl = "https://api.crm.luminartechnohub.com/api";
}

class EndPoints {
  // Post
  static String login = "/auth/login/";

  /// Get for details view & Patch for edit
  static String profile = "/profile/";

  /// Get
  /// Optional Params
  /// {search, page_size, page , lead_status , lead_source, course ,date_from , date_to}
  static String leads = "/leads/";
  static String leadStatus = "/lead/statuses/";
  static String leadSource = "/lead/sources/";
  static String courses = "/courses/";
}
