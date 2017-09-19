<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script src="assets/js/progress-bar/src/jquery.velocity.min.js"></script>
<script src="assets/js/progress-bar/number-pb.js"></script>
<script src="assets/js/progress-bar/progress-app.js"></script>



<!-- MAIN EFFECT -->
<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>




<!-- GAGE -->

<script type="text/javascript" src="assets/js/toggle_close.js"></script>
<script src="assets/js/footable/js/footable.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.sort.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.filter.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<script type="text/javascript">
  $(function() {
    $('.footable-res').footable();
  });
</script>
<script type="text/javascript">
  $(function() {
    $('#footable-res2').footable().bind('footable_filtering', function(e) {
      var selected = $('.filter-status').find(':selected').text();
      if (selected && selected.length > 0) {
        e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
        e.clear = !e.filter;
      }
    });

    $('.clear-filter').click(function(e) {
      e.preventDefault();
      $('.filter-status').val('');
      $('table.demo').trigger('footable_clear_filter');
    });

    $('.filter-status').change(function(e) {
      e.preventDefault();
      $('table.demo').trigger('footable_filter', {
        filter: $('#filter').val()
      });
    });

    $('.filter-api').click(function(e) {
      e.preventDefault();

      //get the footable filter object
      var footableFilter = $('table').data('footable-filter');

      alert('about to filter table by "tech"');
      //filter by 'tech'
      footableFilter.filter('tech');

      //clear the filter
      if (confirm('clear filter now?')) {
        footableFilter.clearFilter();
      }
    });
  });
</script>
