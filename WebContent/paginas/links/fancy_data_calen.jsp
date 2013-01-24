
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<!--FancyBox2 -->
	<script type="text/javascript" src="wgt/fancyBox2/source/jquery.fancybox.js?v=2.0.6"></script>
	<link rel="stylesheet" type="text/css" href="wgt/fancyBox2/source/jquery.fancybox.css?v=2.0.6" media="screen" />
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$('.fancybox').fancybox();
		});
	</script>
<!--Fin-->
	<!-- Data Table-->
	<style type="text/css" title="currentStyle">
		@import "wgt/DataTables/media/css/demo_page.css";
		@import "wgt/DataTables/media/css/jquery.dataTables.css";
	</style>
	<script type="text/javascript" language="javascript" src="wgt/DataTables/media/js/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="wgt/DataTables/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$('#example').dataTable( {
				
				"oLanguage": {
					"sLengthMenu": "Mostrar _MENU_ ",
					"sSearch": "Buscar:",
					"sInfoEmpty": "No hay entradas",
					 "oPaginate": {
						"sNext": "Siguiente",
						"sPrevious": "Anterior",
						"sFirst": "Primero",
						 "sLast": "Ultimo"
					}
				}
			});
			//para cambiar de idioma http://www.datatables.net/usage/i18n
		});
	</script>
<!-- Fin-->
<!--Calendario-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.20/themes/base/jquery-ui.css" type="text/css" media="all" />
	<script src="http://code.jquery.com/ui/1.8.20/jquery-ui.min.js" type="text/javascript"></script>
	<script src="http://jquery-ui.googlecode.com/svn/tags/latest/external/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
	<script src="http://jquery-ui.googlecode.com/svn/tags/latest/ui/minified/i18n/jquery-ui-i18n.min.js"></script>
	<script>	
		$(function() {
			$.datepicker.setDefaults($.datepicker.regional["es"]);
			var dates = $( "#from, #to" ).datepicker({
				defaultDate: "+0w",
				changeMonth: true,
				numberOfMonths: 1,
				onSelect: function( selectedDate ) {
					var option = this.id == "from" ? "minDate" : "maxDate",
						instance = $( this ).data( "datepicker" ),
						date = $.datepicker.parseDate(
							instance.settings.dateFormat ||
							$.datepicker._defaults.dateFormat,
							selectedDate, instance.settings );
					dates.not( this ).datepicker( "option", option, date );
				}
			});
			
		});
	</script>
<!--Fin-->