// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({    
    pageLength: 5,
    pagingType: "full_numbers",
    language: {
      info: "Mostrando _PAGE_ de _PAGES_ página(s)",
      search: "Pesquisar: _INPUT_",
      searchPlaceholder: "Digite ...",
      paginate: {
          previous: '‹',
          next:     '›',
          first: 'Primeiro',
          last: 'Último'
      }
    }
  });
});
