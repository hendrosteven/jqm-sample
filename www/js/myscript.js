var serviceURL = "http://localhost/directory/data/";

var employees;

$('#main').bind('pageinit', function(event) {
    getEmployeeList();
});

$('#refreshBtn').click(function(){
    getEmployeeList();
});

//ambil daftar pegawai
function getEmployeeList() {
    $.getJSON(serviceURL + 'pegawailist.php', function(data) {
        $('#employeeList li').remove();
	    employees = data.items;
        $.mobile.showPageLoadingMsg(true); // load spinner
	    $.each(employees, function(index, employee) {
	       $('#employeeList').append('<li><a href="pegawaidetail.html?id=' + employee.id + '" data-transition="slide">' +
	       '<img src="' + employee.img_url + '"/>' +
	       '<h4>' + employee.nama + '</h4>' +
	       '<p>' + employee.jabatan + '</p></a></li>');
	   });
	   $('#employeeList').listview('refresh');
       $.mobile.hidePageLoadingMsg(); // hide spinner
    });
}

//baca data pegawai diserver saat page detail ditampilkan
$('#detailPage').live('pagebeforeshow', function(event) {
    var id = getUrlVars()["id"];
    $.getJSON(serviceURL + 'pegawaidetail.php?id='+id, displayEmployee);
});

$('#editPage').live('pagebeforeshow',function(event){
     var id = getUrlVars()["id"];
     $.getJSON(serviceURL + 'pegawaidetail.php?id='+id, editEmployee);
});

//tampilkan form edit
function editEmployee(data) {
	var employee = data.item;
    $('#pegId').val(employee.id);
	$('#editNama').val(employee.nama);
	$('#editJabatan').val(employee.jabatan);
	$('#editAlamat').append(employee.alamat);
    $('#editEmail').val(employee.email);
    $('#editTelp').val(employee.telp);
    $('#editImg').val(employee.img_url);

    $('#updateBtn').click(function(){
         var _id = $('#pegId');
         var _nama = $('#editNama');
         var _jabatan = $('#editJabatan');
         var _alamat = $('#editAlamat');
         var _email = $('#editEmail');
         var _telp = $('#editTelp');
         var _img = $('#editImg');

        $.post(serviceURL+'updatepegawai.php',{
            id: _id.val(),
            nama : _nama.val(),
            jabatan : _jabatan.val(),
            alamat : _alamat.val(),
            email : _email.val(),
            telp : _telp.val(),
            img : _img.val()
        },function(data){
            _id.val('');
            _nama.val('');
            _jabatan.val('');
            _alamat.val('');
            _email.val('');
            _telp.val('');
            _img.val('');
            alert('Employee Updated!')
            getEmployeeList();
        });
    });
}



//mengambil parameter dari url
function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++){
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

//tampilkan data
function displayEmployee(data) {
    $.mobile.showPageLoadingMsg(true);
	var employee = data.item;
    $('#employeePic').attr('src', employee.img_url);
	$('#fullName').text(employee.nama);
	$('#employeeTitle').text(employee.jabatan);
	$('#address').text(employee.alamat);
    $('#detailList').append('<li data-icon="false"><a href="mailto:' + employee.email + '"><h3>Email</h3>' +
	   '<p>' + employee.email + '</p></a></li>');
    $('#detailList').append('<li data-icon="false"><a href="tel:' + employee.telp + '"><h3>Call</h3>' +
	   '<p>' + employee.telp + '</p></a></li>');
    $('#detailList').listview('refresh');
    $('#editBtn').attr('href','pegawaiedit.html?id='+employee.id);
    $.mobile.hidePageLoadingMsg();
}


$('#saveBtn').click(function(){
    var _nama = $('#nama');
    var _jabatan = $('#jabatan');
    var _alamat = $('#alamat');
    var _email = $('#email');
    var _telp = $('#telp');
    var _img = $('#img');

    $.post(serviceURL+'insertpegawai.php',{
        nama : _nama.val(),
        jabatan : _jabatan.val(),
        alamat : _alamat.val(),
        email : _email.val(),
        telp : _telp.val(),
        img : _img.val()
    },function(data){
        _nama.val('');
        _jabatan.val('');
        _alamat.val('');
        _email.val('');
        _telp.val('');
        _img.val('');
        $.mobile.changePage('#savedDialog', 'pop', true, true);
        getEmployeeList();
    });

});




