$(document).ready(() => {
    console.log("Ready");
});

$('#btnAddBuilding').click(function (e) {
    e.preventDefault();
    // var name = $('name').value();
    var data = {};
    var buildingTypes = [];
    var formData = $('#formAdd').serializeArray();
    /*data['name'] = 'abc';
    data['numberofBasement'] = 3;
    data['rentArea'] = '100,200,300';
    buildingTypes.push('TANG_TRET');
    buildingTypes.push('NGUYEN_CAN');
    data['buildingTypes'] = buildingTypes;*/
    $.each(formData, function (index, v) {
        if (v.value != '' && v.value != null) {
            if (v.name == 'buildingTypes') {
                buildingTypes.push(v.value);
            } else {
                data['' + v.name + ''] = v.value;
            }
        }
    });
    if (buildingTypes.length >= 1) {
        data['buildingTypes'] = buildingTypes;
    }
    $.ajax({
        type: 'POST',
        url: '/api/building',
        data: JSON.stringify(data),
        dataType: "json", // data from Server to Client
        contentType: "application/json", // data from Client to Server
        success: function (response) {
            //showAlertAfterAdd();
            window.location.href = "http://localhost:8080/admin/building-list";
        },
        error: function (response) {
            console.log('failed');
            console.log(response);
        }
    });
});

// function showAlertAfterAdd() {
//     swal("Done!", "You added the the building successfully!", "success").then(function (res) {
//         if(res.value){
//             console.log('success');
//         }else if(res.dismiss == 'cancel'){
//             console.log('cancel');
//         }
//     });
// }

$('#btnEditBuilding').click(function (e) {
    e.preventDefault();
    var data = {};
    var buildingTypes = [];
    var formData = $('#formEdit').serializeArray();
    $.each(formData, function (index, v) {
        if (v.value != '' && v.value != null) {
            if (v.name == 'buildingTypes') {
                buildingTypes.push(v.value);
            } else {
                data['' + v.name + ''] = v.value;
            }
        }
    });
    if (buildingTypes.length >= 1) {
        data['buildingTypes'] = buildingTypes;
    }
    $.ajax({
        type: 'PUT',
        url: '/api/building',
        data: JSON.stringify(data),
        dataType: "json", // data from Server to Client
        contentType: "application/json", // data from Client to Server
        success: function (response) {
            window.location.href = "http://localhost:8080/admin/building-list";
        },
        error: function (response) {
            console.log('failed');
            console.log(response);
        }
    });
});