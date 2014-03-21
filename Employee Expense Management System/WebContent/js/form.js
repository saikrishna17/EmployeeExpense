$(document).ready(function(){
	   $("#check").click(function(){
		if ($("#check").is(":checked"))
		{
			$("#fareInpts").show("slow");
		}
		else
		{
			$("#fareInpts").hide("slow");
		}
	  });
	});
	 $(document).ready(function(){
	  $("#check1").click(function(){
		if ($("#check1").is(":checked"))
		{
			$("#haltInpts").show("slow");
		}
		else
		{
			$("#haltInpts").hide("slow");
		}
	  });
	});
	$(document).ready(function(){
	  $("#check2").click(function(){
		if ($("#check2").is(":checked"))
		{
			$("#ccInpts").show("slow");
		}
		else
		{
			$("#ccInpts").hide("slow");
		}
	  });
	});
	$(document).ready(function(){
	  $("#check3").click(function(){
		if ($("#check3").is(":checked"))
		{
			$("#otherInpts").show("slow");
		}
		else
		{
			$("#otherInpts").hide("slow");
		}
	  });
	});
	
	
	$(document).ready(function(){
	$('#date').datepicker({  });
	});
	
	
	$(document).ready(function(){
	$('#date').datepicker({  });
	});