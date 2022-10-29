/*
If the route contains slashes, then it is treated as a "deep link",
and before this route is pushed, the routes leading to this one are pushed also.
For example, if the route was /a/b/c, then the app would start with
the three routes /a, /a/b, and /a/b/c loaded, in that order.
 */

class RouterConstants {
  static const NOT_FOUND = "/404";
  static const HOME = "/";
  static const LOGIN = "login";
  static const CHAT = "/dashboard/chat";
  static const CHAT_ITEM = "/dashboard/chat/item";
  static const TIMETABLE = "/school/timeline";
  static const CONTRACT = "/school/contracts-item";
  static const CONTRACTS = "/school/contracts";
  static const SCHEDULE = "/school/calendar";
  static const CONTRACT_DETAILS = "/school/contracts/details";
}
