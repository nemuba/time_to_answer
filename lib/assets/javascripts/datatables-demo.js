// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
    paging: false,
    info: false,
    pageLength: 5,
    language: {
      info: "Mostrando _PAGE_ de _PAGES_ página(s)",
      search: "Pesquisar: _INPUT_",
      searchPlaceholder: "Digite ...",
      paginate: {
          previous: '‹',
          next:     '›'
      },
      aria: {
          paginate: {
              previous: 'Previous',
              next:     'Next'
          }
      }
    }
  });
});
