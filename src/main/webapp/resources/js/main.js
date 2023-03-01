$(document).ready(function () {
    var table = $('#table_id_cases').DataTable();
    new $.fn.dataTable.Buttons(table, {
        buttons: [
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5]
                },
                title: 'List of cases'
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5]
                },
                title: 'List of cases'
            }
        ]
    });
    table.buttons(0, null).container().prependTo(table.table().container());
});


$(document).ready(function () {
    var table = $('#table_id_documents').DataTable();

    new $.fn.dataTable.Buttons(table, {
        buttons: [
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: [0, 1, 2, 3]
                },
                title: 'List of documents'
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [0, 1, 2, 3]
                },
                title: 'List of documents - ' + document.getElementById("caseSignClass").innerHTML,
            }
        ]
    });
    table.buttons(0, null).container().prependTo(table.table().container());
})




