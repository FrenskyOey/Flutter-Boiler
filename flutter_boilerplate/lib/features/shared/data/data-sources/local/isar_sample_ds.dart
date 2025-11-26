import 'package:flutter_boilerplate/features/shared/data/models/entity/email.dart';
import 'package:flutter_boilerplate/features/shared/provider/global_provider.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_sample_ds.g.dart';

@riverpod
EmailLocalDataSource emailLocalDataSource(Ref ref) {
  final isar = ref.read(isarClientProvider);
  return EmailLocalDataSourceImpl(isar: isar);
}

abstract class EmailLocalDataSource {
  /// Inserts a new Email or updates an existing one if the ID is provided.
  Future<int> saveEmail(Email email);

  /// Retrieves a single Email by its primary ID.
  Future<Email?> getEmailById(int id);

  /// Retrieves all Emails from the local store.
  Future<List<Email>> getAllEmails();

  /// Updates the status of an Email given its ID.
  Future<bool> updateEmailStatus(int id, Status newStatus);

  /// Permanently deletes an Email by its ID.
  Future<bool> deleteEmail(int id);
}

/// Implements the EmailLocalDataSource contract using Isar for persistence.
class EmailLocalDataSourceImpl implements EmailLocalDataSource {
  // We use a late variable for Isar, which will be initialized in the initialize() method.
  final Isar _isar;

  EmailLocalDataSourceImpl({required Isar isar}) : _isar = isar;

  @override
  Future<int> saveEmail(Email email) async {
    // Isar writes must be wrapped in a transaction.
    return _isar.writeTxn(() async {
      // put() is used for both inserting (if id is null/autoIncrement) and updating (if id is set).
      return await _isar.emails.put(email);
    });
  }

  @override
  Future<Email?> getEmailById(int id) {
    // Simply fetch the email by ID.

    /*Sample Query
    final importantEmails = isar.emails
    .where()
    .titleStartsWith('Important') // use index
    .limit(10)
    .findAll()

    final specificEmails = isar.emails
    .filter()
    .recipient((q) => q.nameEqualTo('David')) // query embedded objects
    .or()
    .titleMatches('*university*', caseSensitive: false) // title containing 'university' (case insensitive)
    .findAll()
   */

    /*Sample Streaming
    Stream<void> collectionStream = isar.emails.watchLazy();
    Stream<List<Post>> queryStream = importantEmails.watch();
    queryStream.listen((newResult) {
      // do UI updates
    })
   */
    return _isar.emails.get(id);
  }

  @override
  Future<List<Email>> getAllEmails() {
    // Query all objects in the Email collection and return the list.
    return _isar.emails.where().findAll();
  }

  @override
  Future<bool> updateEmailStatus(int id, Status newStatus) async {
    return _isar.writeTxn(() async {
      final email = await _isar.emails.get(id);
      if (email == null) {
        return false;
      }
      // Update only the status field
      email.status = newStatus;
      await _isar.emails.put(email);
      return true;
    });
  }

  @override
  Future<bool> deleteEmail(int id) async {
    // delete() operation also needs to be wrapped in a transaction.
    return _isar.writeTxn(() async {
      // delete(id) returns true if an object was deleted, false otherwise.
      return await _isar.emails.delete(id);
    });
  }
}
