# Summary
### Intoduction
versioning adalah mengatur versi dari source code yang dimana setiap versi akan diberi penamaan yang berbeda sehinnga akan menghasilkan final versi.Git merupakan salah satu version control system yang populer oleh developer untuk mengembangkan software secara bersama-sama(collaboration). Setiap orang bisa mempunyai code tersendiri yang dimana nanti akan dimasukan server pusat (Terdistribuasi). Setiap perubahan yang terjadi pada repository Git itu dicatat dan kita dapat melihat perubahan apa saja yang telah terjadi.
### Config git
- $ git config --global user.name "Username" untuk mengatur nama penguna dan $ git congig --global user.email "Email" untuk mengatur email pengguna ketika melakukan push ke server
- $ git clone <url repository> adalah command untuk ngeclonning repository dari server ke penyimpanan lokal.
- git remote add <namaRemot> <urlServer>, untuk  menambahkan remote server baru dengan nama dan url tertentu.
### Push repository
- $ git add . (semua file) atau $ git add <namafile> (hanya file yang tuliskan)adalah comamand untuk memasukan file dari repository lokal dalam stagging area.
- $ git commit -m "pesan commit" adalah command untuk memberi pesan dan mennyiapkan file sebelum melakukan push kedalam server.
- $ git push <namaremot> [nama_branch] adalah command untuk melakukan push kedalam server.
### inspecting repository
- $ git diff adalah untuk mengetahui apa saja yang telah berubah didalam file yang telah di edit dan git stash untuk menyimpan perubahan tersebut
- $ git log --online untuk melihat versi commit yang telah terjadi.
- $ git checkout <codeCommit> untuk pergi ke commit yang lain tanpa menghapus versi lainnya.
### syncing
Perbedaan antara $ git pull dan $ git fetch adalah $ git pull <namaRemote> <namaBranch>= git fetch + merge. Jika hanya ingin ambil data dari server maka gunakan $ git fetch
### branch
- $ git branch --list, untuk melihat list branch apa aja yang sudah ada
- $ git branch <namaBranch>, untuk membuat branch baru
- $ git checkout <namaBranch>, untuk pindah branch
- $ git branch -D <namaBranch>, untuk hapus branch
- $ git brnach -a, untuk melihat list remote pada branch
- $ git merge <namaBranch>, untuk menggabungkan branch
### solve conflic
- Accept Cureent Change (Mengambil merge yang pertama)
- Accept Incoming Change (Mengambil merge yang kedua)
- Accept Both Change (Menggabungkan kedua merge)
