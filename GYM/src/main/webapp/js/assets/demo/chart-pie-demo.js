// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example

var myPieChart;
function getPie(total, crname, month){
	if(window.myPieChart != undefined){
		window.myPieChart.destroy();
	} 
    var ctx = document.getElementById("myPieChart");
    window.myPieChart = new Chart(ctx, {
     type: 'pie',
     data: {
       labels: crname,
       datasets: [{
         data: total,
         backgroundColor: ['#FF6464',  '#FFEB46', '#B2FA5C', '#32AAFF'],
       }],
     },
   });
};

   


	      		
	      		
	      		