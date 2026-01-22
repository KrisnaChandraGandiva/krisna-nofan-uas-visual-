from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem


class HalamanKRS(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        # Layout utama untuk menampung isi krs.ui
        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        try:
            # Karena krs.ui adalah QWidget, kita bisa langsung muat ke self
            uic.loadUi('krs.ui', self)
            print("Berhasil memuat krs.ui")
        except Exception as e:
            print(f"Gagal memuat krs.ui: {e}")

    def muat_data(self, db_conn):
        cursor = db_conn.cursor()
        # Mengambil data dari tabel krs di database
        cursor.execute("SELECT id_krs, nim, kode_mk, semester FROM krs")
        results = cursor.fetchall()

        # BERDASARKAN XML: Nama widget tabel Anda adalah 'tablejurusan'
        # Kita gunakan hasattr untuk memastikan widget ditemukan
        if hasattr(self, 'tablejurusan'):
            self.tablejurusan.setRowCount(0)
            self.tablejurusan.setColumnCount(4)  # ID KRS, NIM, Kode MK, Semester

            # Header tabel agar lebih rapi
            self.tablejurusan.setHorizontalHeaderLabels(["ID KRS", "NIM", "Kode MK", "Semester"])

            for row_idx, row_data in enumerate(results):
                self.tablejurusan.insertRow(row_idx)
                for col_idx, value in enumerate(row_data):
                    self.tablejurusan.setItem(row_idx, col_idx, QTableWidgetItem(str(value)))

            self.tablejurusan.resizeColumnsToContents()
            print("Data KRS berhasil ditampilkan.")
        else:
            print("Error: Widget 'tablejurusan' tidak ditemukan di krs.ui")