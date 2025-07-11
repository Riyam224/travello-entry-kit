abstract class DatabaseService {
  // todo methods

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  // todo service method for get user data ( fetch it )

  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> checkIfDataExist({
    required String path,
    required String documentId,
  });

  Future<void> deleteData({required String path, required String documentId});
}
