 $(document).ready(function() {

    $('select').material_select();

    $('#textarea1').val('New Text');
    $('#textarea1').trigger('autoresize');

     $('.datepicker').pickadate({
       selectMonths: true, // Creates a dropdown to control month
       selectYears: 15, // Creates a dropdown of 15 years to control year
       format: 'dd/mm/yyyy',
     });

   //   $('input.autocomplete').autocomplete({
	  //   data: {
	  //     "Action": null,
	  //     "Aventure": null,
	  //     "Documentaire": null,
	  //     "Musical": null,
	  //     "Comédie": null,
	  //     "Drame": null,
	  //   }
	  // });

  });
