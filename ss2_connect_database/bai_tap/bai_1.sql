create database relationship;
use relationship;

create table phieuxuat(
sophieuxuat int auto_increment primary key,
ngayxuat date
);

create table vattu(
mavattu int auto_increment primary key,
tenvattu varchar(45)
);

create table phieuxuat_vattu(
sophieuxuat int ,
mavattu int ,
dongiaxuat int ,
soluongxuat int,
primary key(sophieuxuat,mavattu),
foreign key(sophieuxuat) references phieuXuat(sophieuxuat),
foreign key(mavattu) references vatTu(mavattu)
);
create table phieunhap(
sophieunhap int auto_increment primary key,
ngaynhap date
);

create table phieunhap_vattu(
mavattu int ,
sophieunhap int,
dongianhap int,
soluongnhap int,
primary key(sophieunhap,mavattu),
foreign key(sophieunhap) references phieuNhap(sophieunhap),
foreign key(mavattu) references vatTu(mavattu)
);

create table nhacungcap(
manhacungcap int auto_increment primary key,
tennhacungcap varchar(45),
diaChi varchar(45)
);
create table sdt(
manhacungcap int,
sdt varchar(45) primary key,
foreign key(manhacungcap) references nhacungcap(manhacungcap)
);

create table dondathang(
sodathang int auto_increment primary key,
ngaydathang date,
manhacungcap int,
mavattu int,
foreign key(manhacungcap) references nhacungcap(manhacungcap),
foreign key(mavattu) references vatTu(mavattu)
);
