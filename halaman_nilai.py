from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem

class HalamanNilai(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)
        try:
            self.ui_obj = uic.loadUi('nilai.ui')
            self.konten = self.ui_obj.findChild(QtWidgets.QWidget, "centralwidget")
            if self.konten: layout.addWidget(self.konten)
        except Exception as e:
            print(f"Gagal memuat nilai.ui: {e}")

    def muat_data(self, db_conn):
        cursor = db_conn.cursor()
        # Join ke KRS untuk dapat NIM mahasiswa
        query = """
            SELECT n.id_nilai, k.nim, k.kode_mk, n.nilai_angka, n.nilai_huruf 
            FROM nilai n 
            JOIN krs k ON n.id_krs = k.id_krs
        """
        cursor.execute(query)
        results = cursor.fetchall()

        # Nama widget tabel di nilai.ui Anda adalah 'tablejurusan' [cite: 11]
        self.tabel = self.ui_obj.findChild(QtWidgets.QTableWidget, "tablejurusan")

        if self.tabel:
            self.tabel.setRowCount(0)
            self.tabel.setColumnCount(5)
            self.tabel.setHorizontalHeaderLabels(["ID", "NIM", "Kode MK", "Angka", "Huruf"])
            for row_idx, row_data in enumerate(results):
                self.tabel.insertRow(row_idx)
                for col_idx, value in enumerate(row_data):
                    self.tabel.setItem(row_idx, col_idx, QTableWidgetItem(str(value)))
            self.tabel.resizeColumnsToContents()