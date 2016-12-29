program tubes;
uses crt;
type
	ktp = record
	nik: longint;
	nama: string;
	tmp_lahir: string;
	tgl:string;
	bln:string;
	thn:string;
	jk:string;
	goldar:string;
	alamat:string;
	rt: string;
	rw:string;
	lurah:string;
	camat:string;
	agama:string;
	kerja:string;
end;
type
	mati = record
	nik:longint;
	nama:string;
	jk:string;
	hari:string;
	tgl:string;
	bln:string;
	thn:string;
	alamat:string;
	kota:string;
	pelapor:string;
	relasi_pelapor:string;
	umur:string;
end;
var
	penduduk: array[1..10000] of ktp;
	penduduk_mati:array[1..10000] of mati;
	ind,stat,cari,cari2:longint;
	status,status1:boolean;
	stats:char;
procedure hapus(var y:longint);
var
	cari_penduduk:longint;
begin
		while (y<cari) do
		begin
			penduduk[y].nik:=penduduk[y+1].nik;
			penduduk[y].nama:=penduduk[y+1].nama;
			penduduk[y].tmp_lahir:=penduduk[y+1].tmp_lahir;
			penduduk[y].tgl:=penduduk[y+1].tgl;
			penduduk[y].bln:=penduduk[y+1].bln;
			penduduk[y].thn:=penduduk[y+1].thn;
			penduduk[y].tmp_lahir:=penduduk[y+1].tmp_lahir;
			penduduk[y].jk:=penduduk[y+1].jk;
			penduduk[y].goldar:=penduduk[y+1].goldar;
			penduduk[y].alamat:=penduduk[y+1].alamat;
			penduduk[y].rt:=penduduk[y+1].rt;
			penduduk[y].rw:=penduduk[y+1].rw;
			penduduk[y].lurah:=penduduk[y+1].lurah;
			penduduk[y].camat:=penduduk[y+1].camat;
			penduduk[y].agama:=penduduk[y+1].agama;
			penduduk[y].kerja:=penduduk[y+1].kerja;
			y:=y+1;
		end;
		ind:=ind-1;
		cari:=cari-1;
end;
function pencarian(var cari_objek:longint):integer;
var
	a:integer;
begin
	a:=1;
	while (cari_objek<>penduduk[a].nik) and (a<=cari) do
	begin
		a:=a+1;
	end;
	pencarian:=a;
end;
procedure tampil(idx:integer);
begin
	writeln('======================================================================');
	writeln('NIK: ',penduduk[idx].nik);
	writeln('Nama: ',penduduk[idx].nama);
	writeln('Tempat, tanggal lahir: ',penduduk[idx].tmp_lahir,', ',penduduk[idx].tgl,' - ',penduduk[idx].bln,' - ',penduduk[idx].thn);
	writeln('Jenis Kelamin: ',penduduk[idx].jk);
	writeln('Golongan Darah: ',penduduk[idx].goldar);
	writeln('Alamat: ',penduduk[idx].alamat);
	writeln('RT/RW: ',penduduk[idx].rt,'/',penduduk[idx].rw);
	writeln('Kelurahan: ',penduduk[idx].lurah);
	writeln('Kecamatan: ',penduduk[idx].camat);
	writeln('Agama: ',penduduk[idx].agama);
	writeln('Pekerjaan: ',penduduk[idx].kerja);
	writeln('======================================================================');
	//hal_user;
end;
procedure tambah_penduduk;
var
	pilih,pilih_lanjut:char;
	usia:longint;
	tua:boolean;
begin
	clrscr;
	write('Masukkan usia: ');
	readln(usia);
	if (usia<17) then
	begin 
		tua:=false;
		writeln('Silahkan memulai pembuatan Kartu Identitas Anak (KIA)');
	end
	else
		writeln('Silahkan memulai pembuatan Kartu Tanda Penduduk (KTP)');
	ind:=cari;
	if (tua=true) then
		penduduk[ind].nik:=100000+ind
	else
		penduduk[ind].nik:=200000+ind;
	write('Nama Lengkap: ');
	readln(penduduk[ind].nama);
	write('Tempat Lahir: ');
	readln(penduduk[ind].tmp_lahir);
	write('Tanggal Lahir: ');
	readln(penduduk[ind].tgl);
	write('Bulan Lahir: ');
	readln(penduduk[ind].bln);
	write('Tahun Lahir: ');
	readln(penduduk[ind].thn);
	write('Jenis Kelamin: ');
	readln(penduduk[ind].jk);
	write('Golongan Darah: ');
	readln(penduduk[ind].goldar);
	write('Alamat: ');
	readln(penduduk[ind].alamat);
	write('RT: ');
	readln(penduduk[ind].rt);
	write('RW: ');
	readln(penduduk[ind].rw);
	write('Kelurahan: ');
	readln(penduduk[ind].lurah);
	write('Kecamatan: ');
	readln(penduduk[ind].camat);
	write('Agama: ');
	readln(penduduk[ind].agama);
	write('Pekerjaan: ');
	readln(penduduk[ind].kerja);
	clrscr;
	writeln('=========PEMBUATAN KTP/KIA ANDA BERHASIL====================');
	tampil(ind);
	cari:=cari+1;
	writeln('Apakah anda yakin data yang terisi sudah benar? (Y/N)');
	readln(pilih);
	if (pilih='N') then
	begin
		cari:=cari-1;
		writeln('Apakah pembuatan kartu akan dilanjutkan kembali? (Y/N)');
		readln(pilih_lanjut);
		if (pilih_lanjut='Y') then
			tambah_penduduk;
	end;
end;
procedure update_data;
var
	cari_penduduk:longint;
	x:longint;
	bacas:string;
begin
	writeln('Masukkan NIK data yang ingin diubah:');
	readln(cari_penduduk);
	x:=pencarian(cari_penduduk);
	if (x>cari) then
	begin
		writeln('Maaf, data yang anda cari tidak ditemukan');
		readln;
	end
	else
	begin
		clrscr;
		tampil(x);
		writeln('========================Update Data===================================');
		writeln('=============Apabila data tidak diubah, cukup tekan enter=============');
		writeln('======================================================================');
		write('Nama Lengkap: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[x].nama:=bacas;
		write('Tempat Lahir: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[x].tmp_lahir:=bacas;
		write('Tanggal Lahir: ');
			readln(bacas);
		if (bacas<>'') then
			penduduk[x].tgl:=bacas;
		write('Bulan Lahir: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[x].bln:=bacas;
		write('Tahun Lahir: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[x].thn:=bacas;
		write('Jenis Kelamin: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[x].jk:=bacas;
		write('Golongan Darah: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[x].goldar:=bacas;
		write('Alamat: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[x].alamat:=bacas;
		write('RT: ');
		readln(bacas);
		if (bacas<>'') then
			penduduk[ind].rt:=bacas;
			write('RW: ');
			readln(bacas);
			if (bacas<>'') then
				penduduk[ind].rw:=bacas;
			write('Kelurahan: ');
			readln(bacas);
			if (bacas<>'') then
				penduduk[ind].lurah:=bacas;
			write('Kecamatan: ');
			readln(bacas);
			if (bacas<>'') then
				penduduk[ind].camat:=bacas;
			write('Agama: ');
			readln(bacas);
			if (bacas<>'') then
				penduduk[ind].agama:=bacas;
			write('Pekerjaan: ');
			readln(bacas);
			if (bacas<>'') then
				penduduk[ind].kerja:=bacas;
	end;
end;
procedure hal_admin;
var
	tanya,sesi,ketemu:boolean;
	password,bacas:string;
	pilih:char;
	x,y,cari_penduduk,bacaint:longint;
begin
	tanya:=true;
	sesi:=false;
	clrscr;
	while (tanya=true) do
	begin
		writeln('Masukkan kata kunci');
		readln(password);
		if (password='asdasd123') then
		begin
			sesi:=true;
			tanya:=false;
		end
		else
		begin
			writeln('Password anda salah, ulangi? (Y/N)');
			readln(pilih);
			if (pilih='N') or (pilih='n') then
			begin
				status1:=false;
				sesi:=false;
				tanya:=false;
			end;
		end;
	end;
	while (sesi=true) do
	begin
			clrscr;
			writeln('======================================================================');
			writeln('Silahkan pilih aksi administrator:');
			writeln('1. Melihat data penduduk');
			writeln('2. Menyunting data penduduk');
			writeln('3. Menghapus data penduduk');
			writeln('4. Menambah Data Penduduk');
			writeln('0. Keluar dari Menu Administrator');
			writeln('======================================================================');
			readln(pilih);
			case pilih of
			'1':
			begin
				//writeln(ind);
				for x:=1 to ind do
				begin
					tampil(x);
				end; 
				readln;
			end;
			'2':
			begin
			update_data;
				//writeln('dua');
			end;
			'3':
			begin
				writeln('Masukkan NIK data yang ingin dihapus:');
				readln(cari_penduduk);
				y:=pencarian(cari_penduduk);
				if (y>cari) then
				begin
					writeln('Maaf, data yang anda cari tidak ditemukan');
					readln;
				end
				else
					hapus(y);
				//writeln('tiga');
			end;
			'4':
			begin
				tambah_penduduk;
				//writeln('empat');
			end;
			'0':
			begin
				status1:=false;
				sesi:=false;
			end;
		end;
	end;
end;
procedure hal_user;
var
	status:char;
	aktif:boolean;
	tua:boolean;
	indeks,opsi,usia,nikk:longint;
begin
	aktif:=true;
	while (aktif=true) do
	begin
		clrscr;
		writeln('======================================================================');
		tua:=true;
		writeln('Silahkan pilih aksi user: ');
		writeln('1. Membuat Kartu Tanda Penduduk(KTP)/Kartu Identitias Anak (KIA)');
		writeln('2. Membuat Surat Kematian');
		writeln('3. Update dari KIA Ke KTP');
		writeln('0. Kembali ke Menu Sebelumnya');
		writeln('======================================================================');
		readln(opsi);
		case opsi of
		1: 
		begin
			tambah_penduduk;
		end;
		2:
		begin
			writeln('Masukkan NIK:');
			readln(nikk);
			indeks:=pencarian(nikk);
			if (indeks>cari) then
			begin
				writeln('Maaf, data anda tidak ditemukan');
				readln;
			end
			else
			begin
			penduduk_mati[cari2].nik:=nikk;
			penduduk_mati[cari2].nama:=penduduk[indeks].nama;
			penduduk_mati[cari2].jk:=penduduk[indeks].jk;
			writeln('Kronologi Kematian');
			write('Hari:');
			readln(penduduk_mati[cari2].hari);
			write('Tanggal: ');
			readln(penduduk_mati[cari2].tgl);
			write('Bulan: ');
			readln(penduduk_mati[cari2].bln);
			write('Tahun: ');
			readln(penduduk_mati[cari2].thn);
			write('Umur: ');
			readln(penduduk_mati[cari2].umur);
			write('Kota: ');
			readln(penduduk_mati[cari2].kota);
			write('Alamat: ');
			readln(penduduk_mati[cari2].alamat);
			write('Pelapor: ');
			readln(penduduk_mati[cari2].pelapor);
			write('Hubungan pelapor dengan orang ybs: ');
			readln(penduduk_mati[cari2].relasi_pelapor);
			clrscr;
			writeln('=======SURAT KEMATIAN===========');
			writeln('Yang bertanda tangan dibawah ini menerangkan bahwa');
			writeln('Hari : ',penduduk_mati[cari2].hari);
			writeln('Tanggal : ',penduduk_mati[cari2].tgl,' - ',penduduk_mati[cari2].bln,' - ',penduduk_mati[cari2].thn);
			writeln('Di : ',penduduk_mati[cari2].kota);
			write('Telah meninggal dunia ');
			if (penduduk_mati[cari2].jk='L') or (penduduk_mati[cari2].jk='l') then
				writeln('laki laki')
			else
				writeln('perempuan');
			writeln('Bernama : ',penduduk_mati[cari2].nama);
			writeln('Umur : ',penduduk_mati[cari2].umur);
			writeln('Alamat : ',penduduk_mati[cari2].alamat);
			writeln('Surat keterangan ini dibuat atas dasar yang sebenarnya');
			writeln('Nama yang melaporkan : ',penduduk_mati[cari2].pelapor);
			writeln('Relasi yang melaporkan : ',penduduk_mati[cari2].relasi_pelapor);
			readln;
			hapus(indeks);
			cari2:=cari2+1;
			end;
			//writeln('dua');
		end;
		3:
		begin
			writeln('Masukkan NIK:');
			readln(nikk);
			indeks:=pencarian(nikk);
			if (indeks>cari) then
				writeln('Maaf, data anda tidak ditemukan')
			else
			begin
				penduduk[indeks].nik:=penduduk[indeks].nik-100000;
				clrscr;
				writeln('======SELAMAT DATA ANDA TELAH TERUPDATE DARI KIA MENJADI KTP=======');
				tampil(indeks);
			end;
			readln;
			//writeln('empat');
		end;
		0:
		begin
			status1:=false;
			aktif:=false;
		end;
		end;
		if (status1=true) then
		begin
			writeln('Masih ingin melakukan proses lainnya? (Y/N)');
			readln(status);
			if (status='Y') or (status='y') then
				aktif:=false;
		end;
	end;
	end;
begin
	cari:=1;
	cari2:=1;
	status1:=false;
	status:=true;
	while (status=true) do
	begin
		clrscr;
		writeln('======================================================================');
		writeln('Selamat datang di Aplikasi Sistem Informasi Kependudukan Sipil!');
		writeln('Silahkan pilih jenis user anda');
		writeln('1. User');
		writeln('2. Administrator');
		writeln('0. Keluar');
		writeln('======================================================================');
		readln(stat);
		if (stat=1) then
			hal_user
		else if (stat=2) then
			hal_admin
		else
			status:=false;
		if (status1=true) then
		begin
			writeln('Apakah anda ingin keluar? (Y/N)');
			readln(stats);
			if (stats='Y') or (stats='y') then
				status:=false;
		end;
	end;
end.
