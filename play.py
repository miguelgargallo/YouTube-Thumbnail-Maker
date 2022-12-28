import sys
import pkg_resources
import subprocess

# Check if PyQt5 is installed
try:
    import PyQt5
except ImportError:
    print("PyQt5 is not installed.")
    # Install PyQt5
    subprocess.run(["pip", "install", "PyQt5"])

# Add PyQt5 to the Python path
sys.path.append('C:\Python\Python37\Lib\site-packages')

from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QHBoxLayout, QLabel, QComboBox
from PyQt5.QtGui import QIcon


class ThumbnailMakerGUI(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()
    
    def initUI(self):
        # Create the layout
        vbox = QVBoxLayout()
        hbox = QHBoxLayout()
        
        # Create the label and combo box
        label = QLabel("Choose the thumbnail maker:")
        self.combo_box = QComboBox()
        self.combo_box.addItem("Random color YouTube Thumbnail Maker")
        self.combo_box.addItem("Christmas themed YouTube Thumbnail Maker (red and black)")
        self.combo_box.addItem("Random color YouTube Thumbnail Maker (white background, red text)")
        
        # Create the button
        button = QPushButton("Run thumbnail maker")
        button.clicked.connect(self.run_thumbnail_maker)
        
        # Add the widgets to the layout
        hbox.addWidget(label)
        hbox.addWidget(self.combo_box)
        vbox.addLayout(hbox)
        vbox.addWidget(button)
        self.setLayout(vbox)
        
        # Set the window properties
        self.setGeometry(300, 300, 300, 150)
        self.setWindowTitle('YouTube Thumbnail Maker')
        self.setWindowIcon(QIcon('icon.png'))
        
        self.show()
    
    def run_thumbnail_maker(self):
        index = self.combo_box.currentIndex()
        if index == 0:
            # Run the first thumbnail maker
            pass
        elif index == 1:
            # Run the second thumbnail maker
            pass
        elif index == 2:
            # Run the third thumbnail maker
            pass


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = ThumbnailMakerGUI()
    sys.exit(app.exec_())
