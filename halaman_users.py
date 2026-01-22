from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem


class HalamanUsers(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        # Muat file UI
        uic.loadUi('users.ui', self)

        # Sembunyikan sidebar bawaan agar tidak double
        if hasattr(self, 'frameSidebar'):
            self.frameSidebar.hide()

    def muat_data(self, db_conn):
        """Fungsi untuk menampilkan data ke tableUsers"""
        cursor = db_conn.cursor()

        # Eksekusi Query (Pastikan kolom sesuai dengan tabel di database Anda)
        cursor.execute("SELECT user_id, username, role FROM users")
        results = cursor.fetchall()

        # Pastikan tableUsers ditemukan
        if hasattr(self, 'tableUsers'):
            self.tableUsers.setRowCount(0)  # Bersihkan data lama

            for row_idx, row_data in enumerate(results):
                self.tableUsers.insertRow(row_idx)
                for col_idx, value in enumerate(row_data):
                    # Memasukkan data ke sel tabel
                    self.tableUsers.setItem(row_idx, col_idx, QTableWidgetItem(str(value)))

            # Mengatur lebar kolom agar pas dengan isi data
            self.tableUsers.resizeColumnsToContents()
        else:
            print("Peringatan: Widget 'tableUsers' tidak ditemukan di users.ui")