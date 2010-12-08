import struct
import sys
import getopt

class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg

def main(argv=None):
    if argv is None:
        argv = sys.argv
    filename = argv[1]
    f = open(filename, "rb")

    riff_header = struct.unpack("ccccicccc", f.read(12));
    fmt_header = struct.unpack("ccccihhiihh", f.read(24));
    data_header = struct.unpack("cccci", f.read(8));
    data = f.read(...);

if __name__ = "__main__":
    sys.exit(main());
