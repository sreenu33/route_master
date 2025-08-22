class AppRouteConstants {
  static const dashboard = '/dashboard';

  // home
  static const home = '/home';
  static const homeItem1 = '/home/item1';
  static const homeItem2 = '/home/item2';
  static const profileView = '/profile/view';
  static const profileEdit = '/profile/edit';
  static const profileSettings = '/profile/settings';
  static const reports = '/reports';
  static const help = '/help';
  static const patient = '/patient';
  static const table = '/table';
  static String userDetail(int id) => '$dashboard/user-detail/$id';
}
