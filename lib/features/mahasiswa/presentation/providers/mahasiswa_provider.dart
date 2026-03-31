import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprak/core/services/local_storage_service.dart';
import 'package:mobileprak/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:mobileprak/features/mahasiswa/data/repositories/mahasiswa_repository.dart';
import 'package:mobileprak/features/dosen/presentation/providers/dosen_provider.dart';

final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

// Provider semua data mahasiswa yang disimpan
final savedMahasiswaProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  return storage.getSavedUsers();
});

class MahasiswaNotifier extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;
  final LocalStorageService _storage;

  MahasiswaNotifier(this._repository, this._storage)
      : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> refresh() async => loadMahasiswaList();

  Future<void> saveSelectedMahasiswa(MahasiswaModel mhs) async {
    await _storage.addUserToSavedList(
      userId: mhs.id.toString(),
      username: mhs.name,
    );
  }

  Future<void> removeSavedMahasiswa(String userId) async {
    await _storage.removeSavedUser(userId);
  }

  Future<void> clearSavedMahasiswa() async {
    await _storage.clearSavedUsers();
  }
}

final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<MahasiswaNotifier, AsyncValue<List<MahasiswaModel>>>((ref) {
  final repository = ref.watch(mahasiswaRepositoryProvider);
  final storage = ref.watch(localStorageServiceProvider);
  return MahasiswaNotifier(repository, storage);
});
