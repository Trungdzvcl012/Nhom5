CREATE TABLE PHONG_KHAM (  
    ID_PK VARCHAR(4) PRIMARY KEY,  
    TEN NVARCHAR(255),  
    DIA_CHI NVARCHAR(255)  
);  

CREATE TABLE BAC_SI (  
    ID_BS VARCHAR(4) PRIMARY KEY,  
    TEN NVARCHAR(255),  
    SDT INT,  
    EMAIL NVARCHAR(255),  
    TEN_DN NVARCHAR(255),  
    MAT_KHAU INT,
	CHUYEN_KHOA NVARCHAR (255),
	KINH_NGHIEM NVARCHAR(4000)
);  

CREATE TABLE KHACH_HANG (  
    ID_KH VARCHAR(5) PRIMARY KEY,  
    TEN NVARCHAR(255),  
    SDT INT,  
    EMAIL NVARCHAR(255),  
    TEN_DN NVARCHAR(255),  
    MAT_KHAU INT  
);  

CREATE TABLE DICH_VU_KHAM (  
    ID_DV VARCHAR(4) PRIMARY KEY,  
    TEN_DV NVARCHAR(255),  
    GIA_DV NVARCHAR(255)  
);  

CREATE TABLE LICH_SU_KHAM_BENH (
	ID_LSK VARCHAR(5) PRIMARY KEY,
	ID_KH VARCHAR(5),
	ID_BS VARCHAR(4),
	THOI_GIAN DATETIME,
	CHUA NVARCHAR(255),
	DIEU_TRI NVARCHAR(255),
	NGAY NVARCHAR(255),
	FOREIGN KEY (ID_KH) REFERENCES KHACH_HANG(ID_KH),
	FOREIGN KEY (ID_BS) REFERENCES BAC_SI(ID_BS)
);

CREATE TABLE LICH_KHAM_BENH (  
    ID_LK VARCHAR(5) PRIMARY KEY,  
    ID_KH VARCHAR (5),  
    ID_BS VARCHAR (4),  
    THOI_GIAN DATETIME,  
    TRANG_THAI_KHAM NVARCHAR(255),  
    FOREIGN KEY (ID_KH) REFERENCES KHACH_HANG(ID_KH),  
    FOREIGN KEY (ID_BS) REFERENCES BAC_SI(ID_BS)  
);  

CREATE TABLE HOA_DON_THANH_TOAN (  
    ID_HD VARCHAR(5) PRIMARY KEY,  
    ID_KH VARCHAR(5),  
    TONG NVARCHAR(255),  
    THOI_GIAN DATETIME,  
    TRANG_THAI_KHAM NVARCHAR(255),  
    FOREIGN KEY (ID_KH) REFERENCES KHACH_HANG(ID_KH)  
);  

CREATE TABLE CHI_TIET_HOA_DON (  
    ID_CTHD VARCHAR(6) PRIMARY KEY,  
    ID_HD VARCHAR(5) NOT NULL,  
    ID_DV VARCHAR(4) NOT NULL,  
    SO_LUONG INT,  
    FOREIGN KEY (ID_HD) REFERENCES HOA_DON_THANH_TOAN(ID_HD),  
    FOREIGN KEY (ID_DV) REFERENCES DICH_VU_KHAM(ID_DV)  
);

-- ADD DỮ LIỆU VÀO BẢNG BAC_SI
USE WEB_KHAM_BENH;
INSERT INTO BAC_SI (ID_BS, TEN, SDT, EMAIL, TEN_DN, MAT_KHAU, CHUYEN_KHOA, KINH_NGHIEM)  
VALUES  
('BS01', 'Nguyễn Văn An', '0123456789', 'annguyen@gmail.com', 'nguyenvanan', '12345', 'Nha khoa tổng quát', '5 năm kinh nghiệm'),  
('BS02', 'Trần Thị Bình', '0123456780', 'binhtran@gmail.com', 'tranthibinh', '12345', 'Nha khoa trẻ em', '3 năm kinh nghiệm'),  
('BS03', 'Phạm Minh Cường', '0123456781', 'cuongpham@gmail.com', 'phamminhcuong', '12345', 'Nha khoa phẫu thuật', '7 năm kinh nghiệm'),  
('BS04', 'Lê Thị Dung', '0123456782', 'dungle@gmail.com', 'lethidung', '12345', 'Nha khoa phục hình', '4 năm kinh nghiệm'),  
('BS05', 'Nguyễn Thế Hùng', '0123456783', 'hungnguyen@gmail.com', 'nguyenthehung', '12345', 'Nha khoa chỉnh nha', '6 năm kinh nghiệm'),  
('BS06', 'Trần Văn Kiện', '0123456784', 'kientran@gmail.com', 'tranvankien', '12345', 'Nha khoa implant', '2 năm kinh nghiệm'),  
('BS07', 'Phan Thị Lan', '0123456785', 'lanphan@gmail.com', 'phanthilan', '12345', 'Nha khoa nội nha', '8 năm kinh nghiệm'),  
('BS08', 'Nguyễn Văn Minh', '0123456786', 'minhnguyen@gmail.com', 'nguyenvanminh', '12345', 'Nha khoa tổng quát', '10 năm kinh nghiệm'),  
('BS09', 'Lê Văn Nam', '0123456787', 'namle@gmail.com', 'levannam', '12345', 'Nha khoa trẻ em', '3 năm kinh nghiệm'),  
('BS10', 'Trần Thị Oanh', '0123456788', 'oanhtran@gmail.com', 'tranthioanh', '12345', 'Nha khoa phẫu thuật', '5 năm kinh nghiệm'),  
('BS11', 'Nguyễn Minh Quang', '0123456789', 'quangnguyen@gmail.com', 'nguyenminhquang', '12345', 'Nha khoa phục hình', '12 năm kinh nghiệm'),  
('BS12', 'Phạm Thị Hương', '0123456790', 'huongpham@gmail.com', 'phamthihuong', '12345', 'Nha khoa chỉnh nha', '4 năm kinh nghiệm'),  
('BS13', 'Lê Văn Phúc', '0123456791', 'phucle@gmail.com', 'levanphuc', '12345', 'Nha khoa implant', '2 năm kinh nghiệm'),  
('BS14', 'Nguyễn Văn Sơn', '0123456792', 'sonnguyen@gmail.com', 'nguyenvanson', '12345', 'Nha khoa nội nha', '6 năm kinh nghiệm'),  
('BS15', 'Trần Văn Tài', '0123456793', 'taitran@gmail.com', 'tranvantai', '12345', 'Nha khoa tổng quát', '8 năm kinh nghiệm'),  
('BS16', 'Phan Thị Thảo', '0123456794', 'thaophan@gmail.com', 'phanthithao', '12345', 'Nha khoa trẻ em', '1 năm kinh nghiệm'),  
('BS17', 'Nguyễn Văn Uất', '0123456795', 'uatnguyen@gmail.com', 'nguyenvanuat', '12345', 'Nha khoa phẫu thuật', '9 năm kinh nghiệm'),  
('BS18', 'Lê Thị Vân', '0123456796', 'vanle@gmail.com', 'lethivan', '12345', 'Nha khoa phục hình', '7 năm kinh nghiệm'),  
('BS19', 'Trần Văn Xuân', '0123456797', 'xuantran@gmail.com', 'tranvanxuan', '12345', 'Nha khoa chỉnh nha', '5 năm kinh nghiệm'),  
('BS20', 'Phạm Minh Yên', '0123456798', 'yenpham@gmail.com', 'phamminhyen', '12345', 'Nha khoa implant', '8 năm kinh nghiệm');

-- ADD DỮ LIỆU VÀO BẢNG KHACH_HANG

INSERT INTO KHACH_HANG (ID_KH, TEN, SDT, EMAIL, TEN_DN, MAT_KHAU)  
VALUES   
('KH001', 'Nguyễn Văn Đức', '0123456790', 'duc.nguyen@gmail.com', 'nguyenvanduc', 12345),  
('KH002', 'Trần Thị Hoa', '0123456791', 'hoa.tran@gmail.com', 'tranthihoa', 12345),  
('KH003', 'Phạm Văn Tiến', '0123456792', 'tien.pham@gmail.com', 'phamvantie', 12345),  
('KH004', 'Lê Quang Minh', '0123456793', 'minh.le@gmail.com', 'lequangminh', 12345),  
('KH005', 'Nguyễn Hữu Nam', '0123456794', 'nam.nguyen@gmail.com', 'nguyenhuunam', 12345),  
('KH006', 'Trần Thị Như', '0123456795', 'nhu.tran@gmail.com', 'tranthinhun', 12345),  
('KH007', 'Phan Văn Linh', '0123456796', 'linh.phan@gmail.com', 'phanvanlinh', 12345),  
('KH008', 'Nguyễn Thị Lan', '0123456797', 'lan.nguyen@gmail.com', 'nguyenthilan', 12345),  
('KH009', 'Lê Thanh Tùng', '0123456798', 'tung.le@gmail.com', 'lethanhtung', 12345),  
('KH010', 'Trần Minh Mẫn', '0123456799', 'mantran@gmail.com', 'tranminhman', 12345),  
('KH011', 'Nguyễn Trường An', '0123456700', 'an.truongnguyen@gmail.com', 'nguyentruongan', 12345),  
('KH012', 'Phạm Thị Mai', '0123456701', 'mai.pham@gmail.com', 'phamthimai', 12345),  
('KH013', 'Lê Văn Hải', '0123456702', 'hai.le@gmail.com', 'levanhai', 12345),  
('KH014', 'Nguyễn Văn Khoa', '0123456703', 'khoa.nguyen@gmail.com', 'nguyenvankhoa', 12345),  
('KH015', 'Trần Minh Khôi', '0123456704', 'khoi.tran@gmail.com', 'tranminhkhoi', 12345),  
('KH016', 'Lê Đình Hồng', '0123456705', 'hong.le@gmail.com', 'ledinhhong', 12345),  
('KH017', 'Nguyễn Thị Sam', '0123456706', 'sam.nguyen@gmail.com', 'nguyenthisam', 12345),  
('KH018', 'Phan Thị Thảo', '0123456707', 'thao.phan@gmail.com', 'phanthithao', 12345),  
('KH019', 'Trần Quyết Tâm', '0123456708', 'tam.tran@gmail.com', 'tranquyetam', 12345),  
('KH020', 'Nguyễn Văn Tài', '0123456709', 'tai.nguyen@gmail.com', 'nguyenvantai', 12345);

INSERT INTO KHACH_HANG (ID_KH, TEN, SDT, EMAIL, TEN_DN, MAT_KHAU) VALUES   
('KH021', 'Nguyễn Văn Bình', '0123456710', 'binh.nguyen@gmail.com', 'nguyenvanbinh', 12345),   
('KH022', 'Trần Thị Ngọc', '0123456711', 'ngoc.tran@gmail.com', 'tranthingoc', 12345),   
('KH023', 'Phạm Quang Dũng', '0123456712', 'dung.pham@gmail.com', 'phamquangdung', 12345),   
('KH024', 'Lê Thị Bích', '0123456713', 'bich.le@gmail.com', 'lethibich', 12345),   
('KH025', 'Nguyễn Minh Tiến', '0123456714', 'tien.nguyen@gmail.com', 'nguyenminhtien', 12345),   
('KH026', 'Trần Văn Hưng', '0123456715', 'hung.tran@gmail.com', 'tranvanhung', 12345),   
('KH027', 'Phan Văn Duy', '0123456716', 'duy.phan@gmail.com', 'phanvanduy', 12345),   
('KH028', 'Nguyễn Thị Kim', '0123456717', 'kim.nguyen@gmail.com', 'nguyenthikim', 12345),   
('KH029', 'Lê Hoàng Minh', '0123456718', 'minh.le@gmail.com', 'lehoangminh', 12345),   
('KH030', 'Trần Hà Hạnh', '0123456719', 'hanh.tran@gmail.com', 'tranhaanh', 12345),   
('KH031', 'Nguyễn Văn Khải', '0123456720', 'khai.nguyen@gmail.com', 'nguyenvankhai', 12345),   
('KH032', 'Phạm Văn Phú', '0123456721', 'phu.pham@gmail.com', 'phamvanphu', 12345),   
('KH033', 'Lê Thị Thanh', '0123456722', 'thanh.le@gmail.com', 'lethithanh', 12345),   
('KH034', 'Nguyễn Sỹ Mạnh', '0123456723', 'manh.nguyen@gmail.com', 'nguyensymanh', 12345),   
('KH035', 'Trần Thị Đẹp', '0123456724', 'dep.tran@gmail.com', 'tranthidep', 12345),   
('KH036', 'Phan Văn Tín', '0123456725', 'tin.phan@gmail.com', 'phanvantin', 12345),   
('KH037', 'Nguyễn Huỳnh Tú', '0123456726', 'tu.huynh@gmail.com', 'nguyenhuynhtu', 12345),   
('KH038', 'Lê Văn Nhân', '0123456727', 'nhan.le@gmail.com', 'levannhan', 12345),   
('KH039', 'Trần Văn Bảo', '0123456728', 'bao.tran@gmail.com', 'tranvanbao', 12345),   
('KH040', 'Nguyễn Thị Vui', '0123456729', 'vui.nguyen@gmail.com', 'nguyenthivui', 12345),   
('KH041', 'Phạm Minh Kha', '0123456730', 'kha.pham@gmail.com', 'phammeekha', 12345),   
('KH042', 'Lê Thị My', '0123456731', 'my.le@gmail.com', 'lethimy', 12345),   
('KH043', 'Nguyễn Văn Lộc', '0123456732', 'loc.nguyen@gmail.com', 'nguyenvanloc', 12345),   
('KH044', 'Trần Uông Vinh', '0123456733', 'vinh.tran@gmail.com', 'tranvangvinh', 12345),   
('KH045', 'Phạm Thị Nguyệt', '0123456734', 'nguyet.pham@gmail.com', 'phamthinguye', 12345),   
('KH046', 'Nguyễn Ngọc Diệp', '0123456735', 'diep.nguyen@gmail.com', 'nguyenngocdiep', 12345),   
('KH047', 'Lê Văn Niên', '0123456736', 'nien.le@gmail.com', 'levannien', 12345),   
('KH048', 'Trần Hồng Sơn', '0123456737', 'son.tran@gmail.com', 'tranhongsong', 12345),   
('KH049', 'Nguyễn Thị Hương', '0123456738', 'huong.nguyen@gmail.com', 'nguyenthihuong', 12345),   
('KH050', 'Phạm Văn Lẫm', '0123456739', 'lam.pham@gmail.com', 'phamvanlam', 12345);  


	INSERT INTO DICH_VU_KHAM (ID_DV, TEN_DV, GIA_DV) VALUES  
	('DV01', 'Implant Hàn Quốc (1 Răng)', '15000000 VNĐ'),
	('DV02', 'Implant Pháp (1 Răng)', '18000000 VNĐ'),
	('DV03', 'Implant THỤY SĨ (1 Răng)', '23000000 VNĐ'),
	('DV04', 'Điều trị tủy răng (1 Răng)', '350000 VNĐ'),
	('DV05', 'Chỉnh nha khớp cần ngược (2 Hàm)', '15000000 VNĐ'),
	('DV06', 'Thay mắc cài kim loại bằng mắc cài sứ / pha lê (1 Bộ)', '4000000 VNĐ'),
	('DV07', 'Chỉnh nha bằng khay trong suốt (2 Hàm)', '100000000 VNĐ'),
	('DV08', 'Tẩy trắng (2 Hàm)', '1200000 VNĐ'),
	('DV09', 'Điều trị viêm lợi (2 Hàm)', '500000 VNĐ'),
	('DV10', 'Nhổ răng vĩnh viễn (1 Răng)', '1000000 VNĐ'),
	('DV11', 'Phẫu thuật cười hở lợi (1 Ca)', '8000000 VNĐ'),
	('DV12', 'Nền hàm tháo lắp nhựa cứng (1 Hàm)', '1500000 VNĐ'),
	('DV13', 'Nền hàm tháo lắp nhựa dẻo (1 Hàm)', '2500000 VNĐ'),
	('DV14', 'Nền hàm tháo lắp khung Titan (1 Hàm)', '2500000 VNĐ'),
	('DV15', 'Lên răng nhựa ngoại (1 Răng)', '150000 VNĐ'),
	('DV16', 'Răng sứ Titanium (1 Răng)', '1700000 VNĐ'),
	('DV17', 'Răng sử kim loại sạch Coban (1 Răng)', '2500000 VNĐ'),
	('DV18', 'Răng sứ Katana - Nhật (1 Răng)', '2800000 VNĐ'),
	('DV19', 'Răng sứ Venus - Đức (1 Răng)', '3500000 VNĐ'),
	('DV20', 'Răng sứ Cercon, Ceramill- Đức (1 Răng)', '4500000 VNĐ');
    
