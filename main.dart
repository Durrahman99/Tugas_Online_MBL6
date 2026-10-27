import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Identitas pembuat tugas.
class Identitas {
  static const String nama = 'Abdurrahman';
  static const String npm = '5520124032';
  static const String email = '29abdurrachman@gmail.com';
  static const String kelas = 'IF B 2024';
}

void main() => runApp(const AppHubApp());

class AppHubApp extends StatelessWidget {
  const AppHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF01875F)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}

class AppItem {
  final String name;
  final String developer;
  final String category;
  final double rating;
  final String size;
  final String downloads;
  final int downloadsValue;
  final String description;
  final IconData icon;
  final Color color;

  const AppItem({
    required this.name,
    required this.developer,
    required this.category,
    required this.rating,
    required this.size,
    required this.downloads,
    required this.downloadsValue,
    required this.description,
    required this.icon,
    required this.color,
  });
}

const List<AppItem> allApps = [
  AppItem(
    name: 'ChatKu',
    developer: 'Nusantara Labs',
    category: 'Komunikasi',
    rating: 4.6,
    size: '48 MB',
    downloads: '100 jt+',
    downloadsValue: 100,
    description:
        'Aplikasi pesan instan yang cepat dan aman. Kirim teks, foto, video, '
        'dan dokumen ke teman serta keluarga dengan enkripsi end-to-end.',
    icon: Icons.chat_bubble,
    color: Colors.green,
  ),
  AppItem(
    name: 'FotoPro',
    developer: 'Kreasi Digital',
    category: 'Foto',
    rating: 4.4,
    size: '92 MB',
    downloads: '50 jt+',
    downloadsValue: 50,
    description:
        'Edit foto profesional langsung dari ponsel. Dilengkapi filter, '
        'retouch wajah, dan alat penyesuaian warna lengkap.',
    icon: Icons.photo_camera,
    color: Colors.purple,
  ),
  AppItem(
    name: 'MusikLoka',
    developer: 'Irama Studio',
    category: 'Musik',
    rating: 4.7,
    size: '65 MB',
    downloads: '200 jt+',
    downloadsValue: 200,
    description:
        'Dengarkan jutaan lagu dan podcast favoritmu. Buat playlist sendiri '
        'dan unduh untuk didengarkan secara offline.',
    icon: Icons.music_note,
    color: Colors.red,
  ),
  AppItem(
    name: 'BelanjaKu',
    developer: 'Pasar Online',
    category: 'Belanja',
    rating: 4.5,
    size: '71 MB',
    downloads: '150 jt+',
    downloadsValue: 150,
    description:
        'Belanja kebutuhan sehari-hari dengan harga terbaik. Promo setiap '
        'hari, gratis ongkir, dan pembayaran yang mudah.',
    icon: Icons.shopping_bag,
    color: Colors.orange,
  ),
  AppItem(
    name: 'DompetGo',
    developer: 'FinTek Indonesia',
    category: 'Keuangan',
    rating: 4.3,
    size: '38 MB',
    downloads: '80 jt+',
    downloadsValue: 80,
    description:
        'Dompet digital untuk bayar tagihan, transfer, dan isi pulsa. '
        'Kelola keuanganmu dalam satu aplikasi.',
    icon: Icons.account_balance_wallet,
    color: Colors.blue,
  ),
  AppItem(
    name: 'BelajarYuk',
    developer: 'Edu Nusantara',
    category: 'Edukasi',
    rating: 4.8,
    size: '55 MB',
    downloads: '30 jt+',
    downloadsValue: 30,
    description:
        'Platform belajar online dengan ribuan video pelajaran, latihan soal, '
        'dan kelas interaktif untuk semua jenjang.',
    icon: Icons.school,
    color: Colors.indigo,
  ),
  AppItem(
    name: 'PetaKita',
    developer: 'Navigasi Prima',
    category: 'Perjalanan',
    rating: 4.5,
    size: '120 MB',
    downloads: '120 jt+',
    downloadsValue: 120,
    description:
        'Navigasi akurat dengan info lalu lintas real-time, peta offline, '
        'dan rekomendasi tempat menarik di sekitarmu.',
    icon: Icons.map,
    color: Colors.teal,
  ),
  AppItem(
    name: 'GameArena',
    developer: 'Pixel Games',
    category: 'Game',
    rating: 4.2,
    size: '350 MB',
    downloads: '70 jt+',
    downloadsValue: 70,
    description:
        'Bermain game multiplayer bersama teman. Ikuti turnamen mingguan '
        'dan kumpulkan hadiah eksklusif.',
    icon: Icons.sports_esports,
    color: Colors.deepPurple,
  ),
  AppItem(
    name: 'FitHarian',
    developer: 'Sehat Selalu',
    category: 'Kesehatan',
    rating: 4.6,
    size: '44 MB',
    downloads: '20 jt+',
    downloadsValue: 20,
    description:
        'Pantau langkah, kalori, dan jadwal olahraga harianmu. Dapatkan '
        'program latihan sesuai target kebugaranmu.',
    icon: Icons.fitness_center,
    color: Colors.pink,
  ),
];


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _query = '';

  List<AppItem> _filter(List<AppItem> source) {
    if (_query.trim().isEmpty) return source;
    final q = _query.toLowerCase();
    return source
        .where((a) =>
            a.name.toLowerCase().contains(q) ||
            a.category.toLowerCase().contains(q))
        .toList();
  }

  void _showIdentitas() {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFF01875F),
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 12),
            Expanded(child: Text('Identitas Pembuat')),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _IdentitasRow(label: 'Nama', value: Identitas.nama),
            _IdentitasRow(label: 'NIM', value: Identitas.npm),
            _IdentitasRow(label: 'Email', value: Identitas.email),
            _IdentitasRow(label: 'Kelas', value: Identitas.kelas),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final forYou = _filter(allApps);
    final popular = _filter(
      [...allApps]..sort((a, b) => b.downloadsValue.compareTo(a.downloadsValue)),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 12,
          // Pencarian melayang
          title: Material(
            elevation: 3,
            shadowColor: Colors.black38,
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  IconButton(
                    tooltip: 'Menu',
                    icon: const Icon(Icons.menu),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (v) => setState(() => _query = v),
                      decoration: const InputDecoration(
                        hintText: 'Telusuri aplikasi & game',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
          // CircleAvatar profil -> AlertDialog identitas
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                tooltip: 'Profil',
                onPressed: _showIdentitas,
                icon: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xFF01875F),
                  child: Text(
                    'A',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
          // TabBar pada properti bottom
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Untuk Anda'),
              Tab(text: 'Populer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _AppList(apps: forYou),
            _AppList(apps: popular, showRank: true),
          ],
        ),
      ),
    );
  }
}


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String)>[
      (Icons.apps, 'Aplikasi & perangkat saya'),
      (Icons.video_library_outlined, 'Library'),
      (Icons.verified_user_outlined, 'Play Protect'),
      (Icons.notifications_none, 'Notifikasi'),
      (Icons.payment, 'Pembayaran & langganan'),
      (Icons.settings_outlined, 'Pengaturan'),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF01875F)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'A',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF01875F),
                ),
              ),
            ),
            accountName: Text(Identitas.nama),
            accountEmail: Text('${Identitas.npm} • ${Identitas.kelas}'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'Kelola Aplikasi',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          for (final item in items)
            ListTile(
              leading: Icon(item.$1),
              title: Text(item.$2),
              onTap: () {
                final messenger = ScaffoldMessenger.of(context);
                Navigator.pop(context);
                messenger.showSnackBar(
                  SnackBar(content: Text('${item.$2} dipilih')),
                );
              },
            ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// Daftar aplikasi (dipakai Tab 1 dan Tab 2)
// ------------------------------------------------------------
class _AppList extends StatelessWidget {
  final List<AppItem> apps;
  final bool showRank;

  const _AppList({required this.apps, this.showRank = false});

  @override
  Widget build(BuildContext context) {
    if (apps.isEmpty) {
      return const Center(child: Text('Aplikasi tidak ditemukan'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: apps.length,
      separatorBuilder: (_, __) => const SizedBox(height: 2),
      itemBuilder: (context, i) {
        final app = apps[i];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showRank)
                SizedBox(
                  width: 24,
                  child: Text(
                    '${i + 1}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              _AppIcon(app: app, size: 56),
            ],
          ),
          title: Text(app.name, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(
            '${app.category} • ${app.size}\n${app.rating} ★ • ${app.downloads} unduhan',
          ),
          isThreeLine: true,
          // Stack Navigation: push ke Detail Aplikasi
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AppDetailScreen(app: app)),
            );
          },
        );
      },
    );
  }
}

class _AppIcon extends StatelessWidget {
  final AppItem app;
  final double size;

  const _AppIcon({required this.app, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: app.color.withAlpha(35),
        borderRadius: BorderRadius.circular(size * 0.25),
      ),
      child: Icon(app.icon, color: app.color, size: size * 0.55),
    );
  }
}

class AppDetailScreen extends StatefulWidget {
  final AppItem app;

  const AppDetailScreen({super.key, required this.app});

  @override
  State<AppDetailScreen> createState() => _AppDetailScreenState();
}

class _AppDetailScreenState extends State<AppDetailScreen> {
  bool _installing = false;
  bool _installed = false;

  Future<void> _onInstallPressed() async {
    if (_installed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Membuka ${widget.app.name}...')),
      );
      return;
    }
    setState(() => _installing = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() {
      _installing = false;
      _installed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final app = widget.app;
    final label = _installing ? 'Memasang...' : (_installed ? 'Buka' : 'Pasang');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(app.name),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              _AppIcon(app: app, size: 88),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      app.developer,
                      style: const TextStyle(
                        color: Color(0xFF01875F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      app.category,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _Stat(value: '${app.rating} ★', label: 'Rating'),
              const _StatDivider(),
              _Stat(value: app.size, label: 'Ukuran'),
              const _StatDivider(),
              _Stat(value: app.downloads, label: 'Unduhan'),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _installing ? null : _onInstallPressed,
              child: Text(label),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Tentang aplikasi ini',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(app.description, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 28, color: Colors.black12);
  }
}


class _IdentitasRow extends StatelessWidget {
  final String label;
  final String value;

  const _IdentitasRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            child: Text(label, style: const TextStyle(color: Colors.grey)),
          ),
          const Text(': '),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}