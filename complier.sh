#!/bin/bash

echo "=== 1. ทำความสะอาดไฟล์เก่า ==="
rm -f libswe.so *.o

echo "=== 2. กำลังคอมไพล์ libswe.so แบบ -fPIC และพ่วง -lm -ldl ==="
gcc -fPIC -shared -o libswe.so $(ls *.c | grep -vE 'swetest|swemini|swephgen|swevents|obama') -lm -ldl -O2

if [ $? -eq 0 ]; then
    echo "=== 3. คอมไพล์สำเร็จ! กำลังติดตั้งลงระบบ /usr/local/lib/ ==="
    sudo cp libswe.so /usr/local/lib/
    sudo ldconfig
    echo "=== ติดตั้งเรียบร้อยสมบูรณ์! ==="
else
    echo "=== เกิดข้อผิดพลาดในการคอมไพล์ ลองตรวจสอบรายชื่อไฟล์ C อีกครั้ง ==="
fi