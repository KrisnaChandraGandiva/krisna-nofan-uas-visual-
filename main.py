import sys
import mysql.connector
from PyQt5 import QtWidgets, uic

# Import halaman
from halaman_users import HalamanUsers
from halaman_mahasiswa import HalamanMahasiswa
from halaman_jurusan import HalamanJurusan
from halaman_krs import HalamanKRS
from halaman_nilai import HalamanNilai
from halaman_matakuliah import HalamanMatakuliah

class MainApp(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        uic.loadUi('main_window.ui', self)

        # 1. Inisialisasi Halaman
        self.page_users = HalamanUsers()
        self.page_mhs = HalamanMahasiswa()
        self.page_jurusan = HalamanJurusan()
        self.page_krs = HalamanKRS()
        self.page_nilai = HalamanNilai()
        self.page_mk = HalamanMatakuliah()

        # 2. Tambahkan ke StackedWidget
        self.stackedWidget.addWidget(self.page_users)    # Index 1
        self.stackedWidget.addWidget(self.page_mhs)      # Index 2
        self.stackedWidget.addWidget(self.page_jurusan)  # Index 3
        self.stackedWidget.addWidget(self.page_krs)      # Index 4
        self.stackedWidget.addWidget(self.page_nilai)    # Index 5
        self.stackedWidget.addWidget(self.page_mk)       # Index 6

        # 3. Hubungkan Tombol Navigasi (Sesuai saran error: btnMataKuliah)
        self.btnDashboard.clicked.connect(lambda: self.stackedWidget.setCurrentIndex(0))
        self.btnUsers.clicked.connect(self.buka_users)
        self.btnMahasiswa.clicked.connect(self.buka_mahasiswa)
        self.btnJurusan.clicked.connect(self.buka_jurusan)
        self.btnKrs.clicked.connect(self.buka_krs)
        self.btnNilai.clicked.connect(self.buka_nilai)
        self.btnMataKuliah.clicked.connect(self.buka_matakuliah) # Perbaikan Nama

    def koneksi(self):
        return mysql.connector.connect(
            host="localhost", user="root", password="", database="si_mahasiswa"
        )

    def buka_users(self): self.stackedWidget.setCurrentIndex(1); self.proses_muat(self.page_users)
    def buka_mahasiswa(self): self.stackedWidget.setCurrentIndex(2); self.proses_muat(self.page_mhs)
    def buka_jurusan(self): self.stackedWidget.setCurrentIndex(3); self.proses_muat(self.page_jurusan)
    def buka_krs(self): self.stackedWidget.setCurrentIndex(4); self.proses_muat(self.page_krs)
    def buka_nilai(self): self.stackedWidget.setCurrentIndex(5); self.proses_muat(self.page_nilai)
    def buka_matakuliah(self): self.stackedWidget.setCurrentIndex(6); self.proses_muat(self.page_mk)

    def proses_muat(self, halaman_obj):
        try:
            db = self.koneksi()
            halaman_obj.muat_data(db)
            db.close()
        except Exception as e:
            print(f"Error Database: {e}")

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    window = MainApp()
    window.show()
    sys.exit(app.exec_())