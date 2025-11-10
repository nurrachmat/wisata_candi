// Import library material untuk menggunakan widget Material Design
import 'package:flutter/material.dart';
// Import widget custom ProfileInfoItem dari folder widgets
import 'package:wisata_candi/widgets/profile_info_item.dart';

// Kelas ProfileScreen yang merupakan StatefulWidget karena memiliki state yang berubah
class ProfileScreen extends StatefulWidget {
  // Constructor dengan optional parameter key
  const ProfileScreen({super.key});

  @override
  // Method untuk membuat state dari widget ini
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// State class untuk ProfileScreen yang mengelola state widget
class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel untuk menyimpan data profil
  // Variabel untuk menandai apakah user sudah sign in (default: false)
  bool isSignedIn = false;
  // Variabel untuk menyimpan nama lengkap user (default: string kosong)
  String fullName = "";
  // Variabel untuk menyimpan username (default: string kosong)
  String userName = "";
  // Variabel untuk menyimpan jumlah candi favorit (default: 0)
  int favoriteCandiCount = 0;

  // TODO: 5. Implementasi fungsi Sign In
  // Fungsi untuk menangani proses sign in
  void signIn() {
    // setState untuk memperbarui UI
    setState(() {
      // Toggle nilai isSignedIn (mengubah false menjadi true atau sebaliknya)
      isSignedIn = !isSignedIn;
    });
  }

  // TODO: 6. Implementasi fungsi Sign Out
  // Fungsi untuk menangani proses sign out
  void signOut() {
    // setState untuk memperbarui UI
    setState(() {
      // Toggle nilai isSignedIn (mengubah true menjadi false atau sebaliknya)
      isSignedIn = !isSignedIn;
    });
  }

  @override
  // Method build untuk membangun tampilan widget
  Widget build(BuildContext context) {
    // Scaffold adalah struktur dasar halaman
    return Scaffold(
      // Body berisi konten utama halaman
      body: Stack(
        // Stack untuk menumpuk widget (layer)
        children: [
          // Container sebagai background header berwarna ungu
          Container(
            // Tinggi container 200 pixel
            height: 200,
            // Lebar container memenuhi layar
            width: double.infinity,
            // Warna background ungu tua
            color: Colors.deepPurple,
          ),
          // Padding memberikan jarak horizontal 16 pixel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // Column untuk menyusun widget secara vertikal
            child: Column(
              children: [
                // TODO 2 : Buat bagian ProfileHeader yang berisi gambar profil
                // Align untuk menempatkan widget di posisi tertentu
                Align(
                  // Menempatkan widget di tengah atas
                  alignment: Alignment.topCenter,
                  // Padding dengan jarak dari atas 150 pixel (200-50)
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    // Stack untuk menumpuk avatar dan icon kamera
                    child: Stack(
                      // Alignment icon di kanan bawah
                      alignment: Alignment.bottomRight,
                      children: [
                        // Container sebagai border untuk avatar
                        Container(
                          // Dekorasi untuk border avatar
                          decoration: BoxDecoration(
                            // Border dengan warna ungu dan lebar 2 pixel
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            // Bentuk border lingkaran
                            shape: BoxShape.circle,
                          ),
                          // CircleAvatar untuk menampilkan foto profil
                          child: CircleAvatar(
                            // Radius (jari-jari) avatar 50 pixel
                            radius: 50,
                            // Gambar profil dari asset
                            backgroundImage: AssetImage(
                              'images/placeholder_image.png',
                            ),
                          ),
                        ),
                        // Kondisi: tampilkan icon kamera hanya jika user sudah sign in
                        if (isSignedIn)
                          // IconButton untuk mengubah foto profil
                          IconButton(
                            // Fungsi ketika tombol ditekan (masih kosong)
                            onPressed: () {},
                            // Icon kamera
                            icon: Icon(
                              Icons.camera_alt,
                              // Warna icon ungu muda
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // TODO 3 : Buat bagian ProfileInfo yang berisi informasi profil
                // SizedBox untuk memberikan jarak vertikal 20 pixel
                SizedBox(height: 20),
                // Divider (garis pemisah) dengan warna ungu muda
                Divider(color: Colors.deepPurple[100]),
                // SizedBox untuk memberikan jarak vertikal 4 pixel
                SizedBox(height: 4),
                // ProfileInfoItem untuk menampilkan informasi username
                ProfileInfoItem(
                  // Icon gembok
                  icon: Icons.lock,
                  // Label "Pengguna"
                  label: 'Pengguna',
                  // Nilai dari variabel userName
                  value: userName,
                  // Warna icon kuning
                  iconColor: Colors.amber,
                ),
                // SizedBox untuk memberikan jarak vertikal 4 pixel
                SizedBox(height: 4),
                // Divider (garis pemisah) dengan warna ungu muda
                Divider(color: Colors.deepPurple[100]),
                // SizedBox untuk memberikan jarak vertikal 4 pixel
                SizedBox(height: 4),
                // ProfileInfoItem untuk menampilkan informasi nama lengkap
                ProfileInfoItem(
                  // Icon person
                  icon: Icons.person,
                  // Label "Nama"
                  label: 'Nama',
                  // Nilai dari variabel fullName
                  value: fullName,
                  // Tampilkan icon edit hanya jika user sudah sign in
                  showEditIcon: isSignedIn,
                  // Fungsi ketika icon edit ditekan
                  onEditPressed: () {
                    // Print pesan debug ke console
                    debugPrint('Icon edit ditekan');
                  },
                  // Warna icon biru
                  iconColor: Colors.blue,
                ),
                // SizedBox untuk memberikan jarak vertikal 4 pixel
                SizedBox(height: 4),
                // Divider (garis pemisah) dengan warna ungu muda
                Divider(color: Colors.deepPurple[100]),
                // SizedBox untuk memberikan jarak vertikal 4 pixel
                SizedBox(height: 4),
                // ProfileInfoItem untuk menampilkan informasi jumlah favorit
                ProfileInfoItem(
                  // Icon favorite (hati)
                  icon: Icons.favorite,
                  // Label "Favorit"
                  label: 'Favorit',
                  // Tampilkan jumlah favorit jika > 0, jika tidak tampilkan string kosong
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                  // Warna icon merah
                  iconColor: Colors.red,
                ),
                // TODO 4 : Buat bagian ProfileActions yang berisi TextButton Sign In dan Sign Out
                // SizedBox untuk memberikan jarak vertikal 4 pixel
                SizedBox(height: 4),
                // Divider (garis pemisah) dengan warna ungu muda
                Divider(color: Colors.deepPurple[100]),
                // SizedBox untuk memberikan jarak vertikal 20 pixel
                SizedBox(height: 20),
                // Conditional rendering: tampilkan tombol sesuai status sign in
                isSignedIn
                    // Jika user sudah sign in, tampilkan tombol Sign Out
                    ? TextButton(onPressed: signOut, child: Text('Sign Out'))
                    // Jika user belum sign in, tampilkan tombol Sign In
                    : TextButton(onPressed: signIn, child: Text('Sign In')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
