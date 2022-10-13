import serial



with serial.Serial('COM4', 9600, timeout=1.2) as ser:
    ser.write(b'n\r\n')
    ser.write(b'2\r\n')
    print ser.readline()   # read a '\n' terminated line
    ser.write(b's\r\n')
        # str = "123"+"\r\n"
    while True:
        print 1   # read a '\n' terminated line
        print ser.readline()   # read a '\n' terminated line
        print 2   # read a '\n' terminated line
        print ser.readline()   # read a '\n' terminated line
        print 3   # read a '\n' terminated line
        print ser.readline()   # read a '\n' terminated line
        # print ser.readline()
        # ser.write('a\r\n')
        # print ser.readline()

    