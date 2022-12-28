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

from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QHBoxLayout, QLabel, QComboBox, QLineEdit
from PyQt5.QtGui import QIcon


class ThumbnailMakerGUI(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()
    
    def initUI(self):
        # Create the layout
        vbox = QVBoxLayout()
        hbox1 = QHBoxLayout()
        hbox2 = QHBoxLayout()
        hbox3 = QHBoxLayout()
        
        # Create the label and combo box
        label = QLabel("Choose the thumbnail maker:")
        self.combo_box = QComboBox()
        self.combo_box.addItem("Random color YouTube Thumbnail Maker")
        self.combo_box.addItem("Christmas themed YouTube Thumbnail Maker (red and black)")
        self.combo_box.addItem("Random color YouTube Thumbnail Maker (white background, red text)")
        
        # Create the input fields
        self.sentence2words_input = QLineEdit()
        self.sentence3words_input = QLineEdit()
        self.sentence2lastwords_input = QLineEdit()
        
        # Create the button
        button = QPushButton("Run thumbnail maker")
        button.clicked.connect(self.run_thumbnail_maker)
        
        # Add the widgets to the layout
        hbox1.addWidget(label)
        hbox1.addWidget(self.combo_box)
        hbox2.addWidget(QLabel("Enter your YouTube 2 keywords:"))
        hbox2.addWidget(self.sentence2words_input)
        hbox3.addWidget(QLabel("Enter your YouTube 3 keywords:"))
        hbox3.addWidget(self.sentence3words_input)
        hbox4.addWidget(QLabel("Enter your YouTube 2 keywords:"))
        hbox4.addWidget(self.sentence2lastwords_input)
        vbox.addLayout(hbox1)
        vbox.addLayout(hbox2)
        