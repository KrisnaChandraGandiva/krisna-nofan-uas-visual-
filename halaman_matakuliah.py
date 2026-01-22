from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem

class HalamanMatakuliah(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        try:
            self.ui_obj = uic.loadUi('matakuliah.ui')
            self.konten = self.ui_obj.findChild(QtWidgets.QWidget, "centralwidget")
            if self.konten: layout.addWidget(self.konten)
        except Exception as e:
            print(f"Gagal memuat matakuliah.ui: {e}")

    def muat_data(self, db_conn):
        cursor = db_conn.cursor()
        # Menggunakan nama tabel 'mata_kuliah' sesuai SQL Anda
        cursor.execute("SELECT kode_mk, nama_mk, sks, semester FROM mata_kuliah")
        results = cursor.fetchall()

        # Nama widget tabel di matakuliah.ui Anda adalah 'tablejurusan' [cite: 6]
        self.tabel = self.ui_obj.findChild(QtWidgets.QTableWidget, "tablejurusan")

        if self.tabel:
            self.tabel.setRowCount(0)
            self.tabel.setColumnCount(4)
            self.tabel.setHorizontalHeaderLabels(["Kode MK", "Nama MK", "SKS", "Semester"])
            for row_idx, row_data in enumerate(results):
                self.tabel.insertRow(row_idx)
                for col_idx, value in enumerate(row_data):
                    self.tabel.setItem(row_idx, col_idx, QTableWidgetItem(str(value)))
            self.tabel.resizeColumnsToContents()