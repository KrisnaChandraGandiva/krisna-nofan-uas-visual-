from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem


class HalamanJurusan(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        # Muat file UI jurusan
        uic.loadUi('jurusan.ui', self)

        # Sembunyikan sidebar bawaan agar tidak double
        if hasattr(self, 'frameSidebar'):
            self.frameSidebar.hide()

    def muat_data(self, db_conn):
        """Fungsi khusus menampilkan data jurusan"""
        cursor = db_conn.cursor()
        # Ambil data dari tabel jurusan di database Anda
        cursor.execute("SELECT id_jurusan, nama_jurusan FROM jurusan")
        results = cursor.fetchall()

        # Gunakan nama widget yang Anda berikan: tablejurusan
        if hasattr(self, 'tablejurusan'):
            self.tablejurusan.setRowCount(0)  # Kosongkan tabel
            for row_idx, row_data in enumerate(results):
                self.tablejurusan.insertRow(row_idx)
                for col_idx, value in enumerate(row_data):
                    self.tablejurusan.setItem(row_idx, col_idx, QTableWidgetItem(str(value)))

            self.tablejurusan.resizeColumnsToContents()
        else:
            print("Gagal: Widget 'tablejurusan' tidak ditemukan. Cek ObjectName di Qt Designer!")