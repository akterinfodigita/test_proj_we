var thisYear = DateTime.now().year.toString();

const String appName = "Dokan"; //this shows in the splash screen
const String appVersion = '1.0.0'; //this shows in the splash screen
String copyrightText =
    "@ $appName " + thisYear; //this shows in the splash screen

///configure this
const bool https = true;

///configure this
const String kDomainPath = ""; // directly inside the public folder

///do not configure these below
const String kApiEndPath = "api/";
const String publicFolder = "public";
const String protocol = https ? "https://" : "http://";
const String apiVersion = "v1";
const String rawBaseUrl = "$protocol$kDomainPath$kApiEndPath$apiVersion";
const String baseUrl = rawBaseUrl;
//cosumer key
const String consumerKey = "ck_c94bdb296e0a2f524fa5a937086d8d1b8eb3923d";
const String consumerSecret = "cs_92a6ef79ca1bf4de99d9de8654c4387f63e684fc";