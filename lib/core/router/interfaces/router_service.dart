abstract class IRouterService {
  Future<void> pushNamed({required String path, Object? data});
  Future<void> pushNamedAndRemoveUntil({required String path, Object? data});
  Future<void> pushReplacementNamed({required String path, Object? data});
  void pop();
  void popUntil({String? removeUntilPageName});
}
