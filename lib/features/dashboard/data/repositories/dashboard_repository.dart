import '../models/dashboard_model.dart';

class DashboardRepository {
  Future<DashboardData> getDashboardData() async {
    await Future.delayed(const Duration(seconds: 1));
    return DashboardData(
      userName: 'Admin D4TI',
      lastUpdate: DateTime.now(),
      stats: [
        DashboardStats(
          title: 'Total Mahasiswa',
          value: '1,234',
          subtitle: '',
          percentage: 8.5,
          isIncrease: true,
        ),
        DashboardStats(
          title: 'Mahasiswa Aktif',
          value: '1,180',
          subtitle: '',
          percentage: 5.2,
          isIncrease: true,
        ),
        DashboardStats(
          title: 'Dosen',
          value: '650',
          subtitle: '',
          percentage: 1.0,
          isIncrease: true,
        ),
        DashboardStats(
          title: 'Profile',
          value: '',
          subtitle: '',
          percentage: 0.0,
          isIncrease: true,
        ),
      ],
    );
  }

  Future<DashboardData> refreshDashboard() async {
    return getDashboardData();
  }

  Future<DashboardStats?> getStatByTitle(String title) async {
    final data = await getDashboardData();
    try {
      return data.stats.firstWhere((stat) => stat.title == title);
    } catch (e) {
      return null;
    }
  }
}
