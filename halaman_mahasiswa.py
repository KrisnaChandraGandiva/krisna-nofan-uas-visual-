from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem


class HalamanMahasiswa(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        # Muat file UI mahasiswa
        uic.loadUi('mahasiswa.ui', self)

        # Sembunyikan sidebar bawaan agar tidak double
        if hasattr(self, 'frameSidebar'):
            self.frameSidebar.hide()

    def muat_data(self, db_conn):
        """Fungsi khusus menampilkan data mahasiswa"""
        cursor = db_conn.cursor()
        # Query mengambil data mahasiswa
        cursor.execute("SELECT nim, nama, id_jurusan FROM mahasiswa")
        results = cursor.fetchall()

        # Cari widget tabel bernama tableMahasiswa
        if hasattr(self, 'tableMahasiswa'):
            self.tableMahasiswa.setRowCount(0)  # Bersihkan tabel
            for row_idx, row_data in enumerate(results):
                self.tableMahasiswa.insertRow(row_idx)
                for col_idx, value in enumerate(row_data):
                    self.tableMahasiswa.setItem(row_idx, col_idx, QTableWidgetItem(str(value)))

            self.tableMahasiswa.resizeColumnsToContents()
        else:
            print("Gagal: Widget 'tableMahasiswa' tidak ditemukan di mahasiswa.ui")