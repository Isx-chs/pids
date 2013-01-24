<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
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
<!--FancyBox2 -->
	<script type="text/javascript" src="wgt/fancyBox2/source/jquery.fancybox.js?v=2.0.6"></script>
	<link rel="stylesheet" type="text/css" href="wgt/fancyBox2/source/jquery.fancybox.css?v=2.0.6" media="screen" />
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$('.fancybox').fancybox();
		});
	</script>
<!--Fin-->